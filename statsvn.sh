#!/bin/bash
#
# svn log -v --xml  -r {2015-1-1}:{2015-3-1}
# statsvn.sh <author> <start date> <end date> <path> <out dir>
#
AUTHOR=$1
SDATE=$2
EDATE=$3
SVN_PATH=$4
OUT=$5
LOG=`mktemp svnlogXXX.xml`
echo $AUTHOR $SDATE $EDATE $SVN_PATH $OUT
svn log $SVN_PATH -v --xml -r{$SDATE}:{$EDATE} > $LOG
java -jar /home/jingxian/util/statsvn.jar   -include "**/*.java;**/*.xml" -output-dir $OUT $LOG $SVN_PATH
