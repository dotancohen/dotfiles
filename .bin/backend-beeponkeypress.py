#!/usr/bin/env python
# Adapted from http://rants.sayanriju.co.cc/script-to-make-tick-tick-sound-on-keypress

# sudo aptitude install python-xlib beep
# Remove pcspkr blacklist from /etc/modprobe.d/blacklist.conf

from Xlib.display import Display
import os
import time
import sys



ZERO,SHIFT,ALT,CTL=[],[],[],[]
for i in range(0,32):
	ZERO.append(0)
	if i==6:
		SHIFT.append(4)
	else:
		SHIFT.append(0)
	if i==4:
		CTL.append(32)
	else:
		CTL.append(0)
	if i==8:
		ALT.append(1)
	else:
		ALT.append(0)
ignorelist=[ZERO,ALT,SHIFT,CTL]



def main():

	disp = Display()
	lastlastkeymap = []
	lastkeymap = []
	stopCommand = 0
	makeBeep = 1

	lowerQ = [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
	upperQ = [0, 0, 0, 1, 0, 0, 0, 64, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

	while 1:
		time.sleep(0.06) # This is the lowest value that ensures Xlib won't recognize a single keypress twice
		keymap = disp.query_keymap()

		if keymap == lowerQ and keymap == lastkeymap:
			stopCommand += 1
			if stopCommand == 2:
				stopCommand = 0
				makeBeep = 1 - makeBeep
		else:
			stopCommand = 0

		if keymap not in ignorelist and keymap != lastkeymap:
			lastkeymap = keymap
			if makeBeep == 1:
				os.system("beep -l 20")



def enableSpeaker():
	os.system("modprobe pcspkr")
	print("Speaker enabled, please restart as normal user.")
	sys.exit()



if __name__ == '__main__':
	if os.getuid()==0:
		enableSpeaker()
	else:
		print("If no beep is heard, then run as root to enable pcspkr.")
		print("Press 'qq' to enable and disable beeping. The string will be recognized by the focused application.")
		main()
