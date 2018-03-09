#!/usr/bin/env python

import os,sys
import ogg.vorbis

"""
Wrote this script with help from /usr/share/doc/python-pyvorbis/README.

./vorbis_mod_file.py "./ripped/Orchestral Manoeuvres In The Dark/Crush/01-So In Love.ogg" ARTIST OMD
Sets the ARTIST tag in the Crush song to 'OMD'

./vorbis_mod_file.py "./ripped/Orchestral Manoeuvres In The Dark/Crush/01-So In Love.ogg" GENRE Synthpop
Sets the GENRE tag in the Crush song to 'Synthpop'
"""

def updateTag(filename, key, value):
   f = ogg.vorbis.VorbisFile(filename)
   commdict = f.comment().as_dict()
   commdict[key] = [value]
   comments = ogg.vorbis.VorbisComment(commdict)
   try:
      comments.write_to()
   except TypeError:
      pass
   comments.write_to(filename)

if __name__ == "__main__":
   vorbisfilename = sys.argv[1]
   tagKey = sys.argv[2]
   tagValue = sys.argv[3]

   updateTag(vorbisfilename, tagKey, tagValue)
