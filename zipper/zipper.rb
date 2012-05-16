#**********************************************************************
# Program Name: Zipper 1.2.0
# Author: James Hollingshead
# Purpose: To individually zip files.  Also has options for replacing spaces and underscores
# Date Released: February 25, 2007
# Requirements: Ruby interpreter (Tested on 1.8)
#		Rubyzip - http://raa.ruby-lang.org/project/rubyzip/
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

require 'zip/zip'
require 'optparse'
require 'fileutils'
include FileUtils

#initalize flag variables
aflag = false #About flag
dflag = false #Delete old files flag
hflag = false #Help flag
nflag = false #NoZip flag
sflag = false #Spaces flag
uflag = false #Underscore flag

#check for command line flags
opts = OptionParser.new
opts.on("-a")	{|val| aflag = true}
opts.on("-d")	{|val| dflag = true}
opts.on("-h")	{|val| hflag = true}
opts.on("-n")	{|val| nflag = true}
opts.on("-s")	{|val| sflag = true}
opts.on("-u")	{|val| uflag = true}

rest = opts.parse(ARGV)


#get list of files
fileList = Dir.entries(".")


#Help instructions
if hflag == true
	nflag = true
	puts "	useage: zipper -flags
	flags:
		-a About this program
		-d Delete origional files after they're zipped
		-h Help (in other words, this)
		-n Do not zip files (generally used with -s or -u)
		-s Replace underscores with spaces
		-u Replace spaces with underscores"
end


#About this program
if aflag == true
	nflag = true
	puts "	About Zipper
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
  begin
    for i in fileList
      zipFileName = File.basename(i, ".*") +".zip"
      if(File.directory?(i) == false)
  
        if(File.exist?(zipFileName) == false)
          Zip::ZipFile.open(zipFileName, Zip::ZipFile::CREATE) {
            |zipfile| zipfile.add(i, i) 
          }
        end
        
        if(dflag == true)
          rm(i)
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