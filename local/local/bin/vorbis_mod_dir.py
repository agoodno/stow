#!/usr/bin/env python

import os,sys
import ogg.vorbis
from vorbis_mod_file import updateTag

"""
Wrote this script with help from /usr/share/doc/python-pyvorbis/README.

./vorbis_mod_dir.py "./ripped/Orchestral Manoeuvres In The Dark/Crush" ARTIST OMD
Sets every ARTIST tag in the Crush album to 'OMD'

./vorbis_mod_dir.py "./ripped/Orchestral Manoeuvres In The Dark/Crush" GENRE Synthpop
Sets every GENRE tag in the Crush album to 'Synthpop'
"""

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
