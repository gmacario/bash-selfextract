#!/bin/bash

set -e
set -x

INFILE="iottlyagent_1.6.4_linux_raspberry-pi.bsx"
OUTFILE="iottlyagent_1.6.4_linux_raspberry-pi.tar.gz"
TMPDIR="./tmp-archive"

[ ! -e $INFILE ] && wget https://cloud.iottly.com/getagent/$INFILE

ARCHIVE=$(awk '/^__ARCHIVE_BELOW__/ {print NR + 1; exit 0; }' $INFILE)
tail -n+$ARCHIVE $INFILE >$OUTFILE
mkdir -p $TMPDIR
tar -C $TMPDIR -xvf $OUTFILE

# EOF
