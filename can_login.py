#!/usr/bin/env python
from sys import argv, stdout
from hashlib import sha256

USERS_PASSWORDS_DICT = {"824198ad8ec51008415e13eee917e04b9aeca11b4c08e105a010e921e27ffe36": "e32aac1ca61e2d7198141ddf540de0abb316290b00ef2aa42a7aa1436faa7d74",
						"11e05648e431c68977ca7ee95c3636968febdb0c25748f68dcedfa8874615852": "854c8df52ccddc47be0cb1424739ae60c922dad69b027c8ee37e823d7273c9d6",
						"d9ac1d7db2f4ec0c5d0543e52f893a38cfc602a2b1dacf03c54583fb92324d26": "a00676372284c6d738234946beafea5efca55550b8cd4ea11e2570aafdf67f14",
						"904b381339139cc99aaa1f1c35ad481f81aaf590e28cce0ada066d8abdc38957": "0a56b52c0f182d556019f25abcd81d54ca037959a40a5b49075dd260cac040ef",
						"e98d42d4f348d03a94cf9d18b5c2018a8879dd38e248ee006b9080947264a09a": "7fc07015874a1f75b2d364553da19755b057f2a65f97e430a2a64b919b4bb80a"}
try:
	MODE = argv[1].strip().lower()

	if MODE == 'cookie':
		cookie = argv[2]
		for uh in USERS_PASSWORDS_DICT:
			if uh + 'toilet' + USERS_PASSWORDS_DICT[uh] == cookie:
				stdout.write('True')
				exit()


	elif MODE == 'user':
		USER = argv[2].strip()
		PASSWORD = argv[3].strip()

		if(USERS_PASSWORDS_DICT[sha256(USER).hexdigest()] == sha256(PASSWORD).hexdigest()):
			#print 'True'
			stdout.write('True')
			stdout.flush()
			exit()


	stdout.write('False')
	stdout.flush()
	exit()
except Exception, e:
	stdout.write('False')
	stdout.flush()
	exit()
