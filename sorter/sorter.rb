#**********************************************************************
# Program Name: Sorter 1.2.0
# Author: James Hollingshead
# Purpose: To alphabetically sort files into directories.  
#          Also has options for replacing spaces and underscores
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

require 'optparse'
require 'fileutils'
include FileUtils

#initalize flag variables
aflag = false #About flag
fflag = false #Force Overwrite flag
hflag = false #Help flag
nflag = false #NoSort flag
sflag = false #Spaces flag
uflag = false #Underscore flag

#check for command line flags
opts = OptionParser.new
opts.on("-a")	{|val| aflag = true}
opts.on("-f")	{|val| fflag = true}
opts.on("-h")	{|val| hflag = true}
opts.on("-n")	{|val| nflag = true}
opts.on("-s")	{|val| sflag = true}
opts.on("-u")	{|val| uflag = true}

rest = opts.parse(ARGV)

#get list of files
fileList = Dir.entries(".")

#array of letters for the sorter
letters = 'A'..'Z'


#Help instructions
if hflag == true
	nflag = true
	puts "	useage: sorter -flags
	flags:
		-a About this program
		-f Force files to be overwritten
		-h Help (in other words, this)
		-n Do not sort files (generally used with -s or -u)
		-s Replace underscores with spaces
		-u Replace spaces with underscores"
end


#About this program
if aflag == true
	nflag = true
	puts "	About Sorter
		Version: 1.2.0
		Author: James Hollingshead
		Address: www.JamesHollingshead.com
		Notes: This program is released under GPLv2. (and only version 2)"
end




#replaces spaces with underscores
if uflag == true
  begin
    for i in fileList
      if(File.directory?(i) == false)
        newName = i.gsub(/ /, '_')
        if(i != newName and File.exists?(newName) == false)
          File.rename(i, newName)
        end
      end
    end
    
    #Exit program if there is an error
    rescue Exception
      $stderr.print "\nAn Error has occured while processing file " + i + "\n\n"
      $stderr.print "Exiting Program \n"
      exit
    
  end
end


#replaces underscores with spaces
if sflag == true
  begin
    for i in fileList
      if(File.directory?(i) == false)
        newName = i.gsub(/_/, ' ')
        if(i != newName and File.exists?(newName) == false)
          File.rename(i, newName)
        end
      end
    end
    
    #Exit program if there is an error
    rescue Exception
      $stderr.print "\nAn Error has occured while processing file " + i + "\n\n"
      $stderr.print "Exiting Program \n"
      exit
      
  end
end




#Sorts the files
if nflag == false
	#Make directories for the sorter
	#Make letter directories if they don't exist
	begin
    for i in letters
      if(File.directory?(i) == false)
        Dir.mkdir(i)
      end
    end
  
    #Make directory for number entries if it doesn't exist
    if(File.directory?("0-9") == false)
      Dir.mkdir("0-9")
    end
    
    #Exit if there is an error
    rescue Exception
      $stderr.write "\n An Error occured while creating directories \n\nExiting Program\n"
      exit
    
  end


	#sorts the files into directories
  begin
    for j in letters
      for i in fileList
        if(File.directory?(i) == false)
          #Sort files that start with a letter
          if(i.upcase.index(j) == 0)
            if(File.exist?(File.join(j, i)) == false or fflag == true)
              cp(i, File.join(j, i))
              rm(i)
            end
          end
  
          #sort files that start with a digit
          if(i.index(/[0123456789]/) == 0)
            if(File.exist?(File.join("0-9", i)) == false or fflag == true)
              cp(i, File.join("0-9", i))
              rm(i)
            end
          end
        end
      end
    end
    
    #Exit program if there is an error
    rescue Exception
      $stderr.print "\nAn Error has occured while processing file " + i + "\n\n"
      $stderr.print "Exiting Program \n"
      exit
    
  end
end