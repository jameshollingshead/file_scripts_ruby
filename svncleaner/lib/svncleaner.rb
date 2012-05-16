# To change this template, choose Tools | Templates
# and open the template in the editor.

require 'fileutils'
include FileUtils

def removeSvn(myDir)

  begin
    if File::directory?(File.join(myDir, ".svn"))
      FileUtils.rm_rf(File.join(myDir, ".svn"))
    end
  rescue
    $stderr.print "\nAn Error has occured while processing directory " + myDir + "\n\n"
  end


  dirList = Dir.entries(myDir)

  for i in dirList
    if File::directory?(File.join(myDir, i) )
        if ((i.to_s != '.') && (i.to_s != '..'))
          newDir = File.join(myDir, i)
          removeSvn(newDir)
        end
    end
  end
end


removeSvn(Dir.pwd)