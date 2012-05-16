#**********************************************************************
# Program Name: prepend 1.1.0
# Author: James Hollingshead
# Purpose: Prepends a string onto the beginning of a filename
# Date Released: February 25, 2007
# Requirements: Ruby interpreter (Tested on 1.8)
# Instructions: Place this file in a directory that is in your PATH
# Website: www.jameshollingshead.com
# Email: programs@jameshollingshead.com
# Copyright (C) 2007  James Hollingshead (www.JamesHollingshead.com)
#**********************************************************************
#This program is free software; you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation; version 2 of the License only.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#**********************************************************************

require 'fileutils'
include FileUtils

if ARGV.length !=1
  puts "useage: prepend \"string to add to filenames\"\n"
  exit
end

strPrepend = ARGV[0]

#get list of files
fileList = Dir.entries(".")

#adds string to beginning of file names
begin
  for i in fileList
    if(File.directory?(i) == false)
      newName = strPrepend + i
      if(i != newName and File.exists?(newName) == false)
        File.rename(i, newName)
      end
    end
  end
  
#If an error occurs, print a notice
rescue Exception
  $stderr.print "\nAn Error has occured while processing file " + i + "\n\n"
  $stderr.print "Exiting Program \n"
end
