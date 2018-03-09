#Yearly iPhoto export to Dropbox
#Thoughout the year, sync photos from Andy's iPhone and iPad into Andy's iPhoto. Do the same for Jen's iPhone and iPad into her account's iPhoto.
#Perform the following steps on both Andy and Jen's accounts. Final destination should be shared Dropbox though.

#Open iPhoto
##select Last 12 months in iPhoto
##select all photos
##deselect any photos from previous or next year
##choose File -> Export from the top menu
###Kind: JPEG
###JPEG Quality: Maximum
###Size: Full Size
###File Name: Sequential
###Prefix for sequential: andy- OR jen-
###Subfolder: None

#images are written to ~/Dropbox/Media/2014/07/25/ etc
#exiftool "-Directory<DateTimeOriginal" -d "$HOME/Dropbox/Media/%Y/%m/%d" $HOME/tmp/iPhoto_export/.DS_Store 
# Run ~/Dropbox/bin/exiftool_iphoto_to_dropbox_shuffle.sh (this file)

#no suffix
#exiftool '-filename<CreateDate' -d %Y_%m_%d_%H_%M_%S%%-c.%%le -r -ext MOV -ext JPG .

#with andys_iphone suffix
#exiftool '-filename<CreateDate' -d %Y_%m_%d_%H_%M_%S_andys_iphone%%-c.%%le -r -ext MOV -ext JPG .
#exiftool "-Directory<CreateDate" -o dummy/ -d "$HOME/tmp/Media/%Y/%m/%d" -ext jpg *
#exiftool "-Directory<CreationDate" -o dummy/ -d "$HOME/tmp/Media/%Y/%m/%d" -ext mov *

#exiftool "-Directory<DateTimeOriginal" -o dummy/ -d "$HOME/tmp/Media/%Y/%m/%d" $HOME/tmp/iPhoto_export/* &> dummy.log

#Open the dummy.log. Any files listed were moved to #the dummy directory.
#Move this directory manually to ~/tmp/Media.
#Then, try to put each one in the correct date directory manually before the rsync.

#rsync -avzn $HOME/tmp/Media/ ~/Dropbox/Media/
