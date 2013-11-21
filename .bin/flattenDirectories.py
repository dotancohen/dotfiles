#!/usr/bin/python
# -*- coding: utf-8 -*-
import sys
import os
import shutil

currentDir = os.getcwd()
forReal = False

if ( currentDir in ['/home/dotancohen', '/home/dotancohen/.bin'] ):
	print "Error: Will not run in "+currentDir
	exit()

if ( len(sys.argv)>1 and sys.argv[1] in ['m', 'M', 'c', 'C'] ):
	forReal = True
else:
	print "\nThis is a test run. To actually perform changes, add 'm' (move) or 'c' (copy) after the program name.\n"

filesList = os.walk(currentDir)

for rootDir, folders, files in filesList:
	for f in files:
		if (rootDir!=currentDir):
			toMove = os.path.join(rootDir, f)
			print toMove
			newFilename = os.path.join(currentDir,f)
			renameNumber = 1
			while(os.path.exists(newFilename)):
				newFilename = os.path.join(currentDir,f)+"_"+str(renameNumber)
				renameNumber = renameNumber+1
			if ( forReal and sys.argv[1] in ['m', 'M'] ):
				os.rename(toMove, newFilename)
			elif ( forReal and sys.argv[1] in ['c', 'C'] ):
				shutil.copy(toMove, newFilename)

if ( not forReal ):
	print "\nThis was a test run. To actually perform changes, add 'm' (move) or 'c' (copy) after the program name."




# Features
# 1) Flattens files in arbitrarily-deep directories to the top-level directory.
# 2) Supports either Move or Copy operations.
# 2) Requires confirmation flag before running.
# 3) Will not run in specific known dangerous directories.
# 4) Will not overwrite files but rather append _N to the filename.
# 5) Works with spaces in filenames and directories.
# 6) Works with Hebrew file and directory names.

# To Add
# 1) Change _N suffix to appear before filename extension.
# 2) Remove empty directories. I think that os.removedirs will work here.
# 3) Prevent race conditions by performing the filename check during write. For that I need to find a function that fails to write when the file exists.

# https://mail.google.com/mail/u/0/?shva=1#search/is%3Astarred+directory/127f25c58e6e2359

