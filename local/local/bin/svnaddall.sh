svn st |grep "^?" |awk -F "      " '{print $2}'|xargs svn add
