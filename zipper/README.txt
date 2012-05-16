There are times that I need to individually zip a bunch of files.  That’s where this program comes in handy.

Zipper is a command line program to individually zip files.  In addition, like Sorter, it also has options to rename the files, replacing spaces with underscores and vice versa. 

"Why?" you ask?  Simple.  Some programs, such as emulators, can read their associated files in a zip format in order to allow hard drive space to be saved.  This program saved me a lot of time when I was setting up my entertainment center PC (after all, who wants to have a ton of old consoles sitting in the living room when you can put them in a single box?).  

Directions:  Add Zipper to your PATH.  Navigate to the directory containing the files you want to zip and run Zipper with any flags that you require.  Without any flags, Zipper simply zips the files

List of flags:

    -a About this program
    -d Delete original files after they’ve been zipped
    -h Help
    -n Do not zip files (generally used with -s or -u)
    -s Replace underscores with spaces
    -u Replace spaces with underscores


Notes: This program was tested with Ruby version 1.8

In order to run this program from source, rubyzip by Thomas Sondergaard (http://raa.ruby-lang.org/project/rubyzip/) is required and is included in this repository as rubyzip-0.9.4.zip.  Zipper is released under version 2 of the GPL (and only version 2).