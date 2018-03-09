#!/usr/bin/env python

import os,sys
import ogg.vorbis

"""
Wrote this script with help from /usr/share/doc/python-pyvorbis/README.

./change_info.py "./ripped/Orchestral Manoeuvres In The Dark/Crush" ARTIST OMD
Sets every ARTIST tag in the Crush album to 'OMD'

./change_info.py "./ripped/Orchestral Manoeuvres In The Dark/Crush" GENRE Synthpop
Sets every GENRE tag in the Crush album to 'Synthpop'
"""

def updateTag(filename, key, value):
   f = ogg.vorbis.VorbisFile(fullname)
   commdict = f.comment().as_dict()
   commdict[key] = [value]
   comments = ogg.vorbis.VorbisComment(commdict)
   try:
      comments.write_to()
   except TypeError:
      pass
   comments.write_to(fullname)

if __name__ == "__main__":
   if len(sys.argv) == 3:
      mdir = "."
      tagKey = sys.argv[1]
      tagValue = sys.argv[2]
   else:
      mdir = sys.argv[1]
      tagKey = sys.argv[2]
      tagValue = sys.argv[3]

   for filename in os.listdir(mdir):
      fullname = os.path.abspath(os.path.join(mdir, filename))
      updateTag(fullname, tagKey, tagValue)
