for i in $(ssh root@192.168.1.3 "find /media/Music -atime -60 -type f" |cut -d'/' -f1-5 |sort -r |uniq); do rsync -avz root@192.168.1.3:$i ~/Music; done
