#ImageCapture tool exports file to ~/Pictures/andys_iphone/ or ~/Pictures/andys_ipad/
#images are copied from ~/Pictures/andys_iphone/ ~/tmp/andys_iphone/
#images are renamed to ~/tmp/andys_iphone/2014/07/25/2014_07_25_08_15_38_andys_iphone.jpg
#images are ultimately synced to Dropbox as ~/Dropbox/Media/2014/07/25/2014_07_25_08_15_38_andys_iphone.jpg
#
# Run this script like:
# exiftool_post_processing.sh ~/tmp/andys_iphone/ &> exiftool_post_processing.log
#
# Check the log for an errors. Any files listed were moved to #the dummy directory. Deal with problem files manually.

if [ -z "$1" -o -z "$2" ]; then
  echo "Must supply arguments for source pics directory and device tag"
  echo "./exiftool_post_processing.sh ~/tmp/dummy/ andys_iphone"
  exit
fi

SRC_PICS_DIR=$1
DEVICE=$2

if [ ! -d "$SRC_PICS_DIR" ]; then
  echo "Directory $SRC_PICS_DIR doesn’t exist"
  exit
fi

echo "Using $SRC_PICS_DIR as pics source"

TMP_PICS_DIR=`mktemp -t "$DEVICE" -d`

if [ ! -d "$TMP_PICS_DIR" ]; then
  echo "Unable to create directory $TMP_PICS_DIR"
  exit
fi

echo "Using $TMP_PICS_DIR as temporary pics target"

TMP_MEDIA_DIR=`mktemp -t "$DEVICE" -d`

echo "Using $TMP_MEDIA_DIR as temporary media target"

rsync -avz "$SRC_PICS_DIR" "$TMP_PICS_DIR"
echo "Copied pictures to $TMP_PICS_DIR/$DEVICE"
exiftool '-filename<CreateDate' -d "%Y_%m_%d_%H_%M_%S_$DEVICE%%-c.%%le" -r -ext MOV -ext JPG "$TMP_PICS_DIR"
echo "Renamed media"
exiftool "-Directory<CreateDate" -o dummy/ -d "$TMP_MEDIA_DIR/%Y/%m/%d" -ext jpg "$TMP_PICS_DIR"
echo "Moved pictures to $TMP_MEDIA_DIR"
exiftool "-Directory<CreationDate" -o dummy/ -d "$TMP_MEDIA_DIR/%Y/%m/%d" -ext mov "$TMP_PICS_DIR"
echo "Moved movies to $TMP_MEDIA_DIR"
rsync -avz "$TMP_MEDIA_DIR/" ~/Dropbox/Media/
echo "Synced media to Dropbox"
