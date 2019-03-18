#!/usr/bin/env python

import RPi.GPIO as GPIO
from time import time, sleep
#import getpass
from sys import argv, stdout

import os
import os.path
from datetime import datetime
from pytz import timezone


import socket


COOL_DOWN = 60

EXTEND_TIME = 4

OUT1 = 23
OUT2 = 24

LOCK_FILE = '/tmp/flush.lock'
LOG_FILE = '/var/log/flushlog'




def gpio_enter():
	GPIO.setmode(GPIO.BCM)
	GPIO.setup(OUT1, GPIO.OUT)
	GPIO.setup(OUT2, GPIO.OUT)

	GPIO.output(OUT1, False)
	GPIO.output(OUT2, False)

def gpio_exit():
	GPIO.output(OUT1, False)
	GPIO.output(OUT2, False)
	GPIO.cleanup()

def touch(fname, times=None):
	#When times=None, then it's like atime=time(), mtime=time(); like Linux touch.
	with open(fname, 'a'):
		os.utime(fname, times)

def unix_time_to_date(utime):
	#return datetime.fromtimestamp(utime).strftime('%d/%m/%Y %H:%M:%S')
	#isdst_now_in = lambda zonename: bool(datetime.now(timezone("Israel")).dst())
	isdst_now_in = bool(datetime.now(timezone("Israel")).dst())
	local_time = utime + 3600*3 if isdst_now_in else utime + 3600*2
	return datetime.utcfromtimestamp(local_time).strftime('%d/%m/%Y %H:%M:%S')


def can_flush():
	can_flush = False
	try:
		return time() - os.path.getmtime(LOCK_FILE) >= COOL_DOWN
	except:
		#File doesn't exist, we can flush.
		return True



try:

	FLUSHER_USER = argv[1]
	FLUSHER_IP = argv[2]
	#Validate is IP.
	socket.inet_aton(FLUSHER_IP)
	#fl = open(LOG_FILE, 'a')

	if can_flush():
		#FLUSH
		stdout.write('True')
		open(LOG_FILE, 'a').write(FLUSHER_USER + ' FLUSHED at: ' + unix_time_to_date(time()) + ' from ' + FLUSHER_IP + '\n' )

		touch(LOCK_FILE)
		#fl.write(FLUSHER_IP  + ' FLUSHED at: ' + unix_time_to_date(time()) + '\n' )
		#print 'python: ' + getpass.getuser()
		gpio_enter()

#		sleep(1)

		#extend
		GPIO.output(OUT1, True)
		GPIO.output(OUT2, False)

		sleep(EXTEND_TIME)

		#retract
		GPIO.output(OUT1, False)
		GPIO.output(OUT2, True)	

		sleep(EXTEND_TIME + 1) #Make sure that actuator is fully retracted.

		#print 'Flushed!'
		#os.remove(LOCK_FILE)

	else:
		#print 'Toilet is cooling down!!'
		#fl.write(FLUSHER_IP  + ' Tried to flush at: ' +  unix_time_to_date(time()) + '\n')
		stdout.write('False')
		open(LOG_FILE, 'a').write(FLUSHER_USER + ' Tried to flush at: ' +  unix_time_to_date(time()) + ' from ' + FLUSHER_IP + '\n' )


except socket.error:
	#If someone somehow flushes without a valid IP.	
	stdout.write('False')
	open(LOG_FILE, 'a').write(FLUSHER_USER + ' Tried to flush at: ' +  unix_time_to_date(time()) + ' NO IP: ' + FLUSHER_IP + '\n')

except Exception, e:
	print e
	stdout.write('False')
	open(LOG_FILE, 'a').write('Exception ' + str(e) + ' ' + unix_time_to_date(time()) + '\n')

finally:
	gpio_exit()
	#fl.close()

