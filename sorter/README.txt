On occasion, I've had large numbers of files that have needed to be sorted into directories as well as stripping out underscores from the file names.

Sorter is a command line program to sort files into directories based on file name.  In addition, it also has options to rename the files, replacing spaces with underscores and vice versa.

Like Zipper, this program came in handy when setting up my entertainment center pc.  Instead of dragging and dropping files, I just have to navigate to the directory they're all in and run one simple command.  This was quite nice when setting up the directory structure for my old consoles as well as for sorting the music which I had ripped from my (some say oversized) CD collection.

Directions:  Add Sorter to your PATH.  Navigate to the directory containing the files you want to sort and run Sorter with any flags that you require.  Without any flags, Sorter simply sorts the files into directories.

List of flags:

    -a About this program
    -f Force files to be overwritten
    -h Help
    -n Do not sort files (generally used with -s or -u)
    -s Replace underscores with spaces
    -u Replace spaces with underscores


Notes: This program was tested with Ruby version 1.8.  Sorter is released under version 2 of the GPL (and only version 2).