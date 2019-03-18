#!/usr/bin/env python

import pygame.camera as pycam
import pygame.image as pyimg
from time import sleep


photo_counter = 0
  


#Called if there was a 'loud noise'
def snap(cam):
	#print 'Snap!'
	#cam.get_image()
	#cam.get_image()
	cam.get_image()
	cam.get_image()
	img = cam.get_image()

	file_string = '/var/www/html/toilet.jpeg'
	pyimg.save(img, file_string)



try:  
	
	pycam.init()
	cam = pycam.Camera(pycam.list_cameras()[0])
	cam.start()
	sleep(2)
	snap(cam)

except Exception:
	print str(Exception)	
finally:
	pycam.quit()
	pycam.stop()
