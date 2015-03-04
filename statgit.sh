#!/bin/bash
#
#
#  stat a git repository, output code changed by each author
#  this tool use the following git command:
#  git log --after=2015-2-1T0:0:0 --before=2015-3-2T0:0:0  --shortstat --pretty=format:"%an;%ai"
#
#
#  Usage: statgit.sh <start date> <end date> <git path> <out dir>
#
#  this shell script will output a .csv file with following data:
#  author, date, insertions, deletions
#

if [ $# -lt 4 ] ; 
then
	echo "Usage: statgit.sh <start date> <end date> <git repository path> <out dir>";
	exit -1;
fi
SDATE=$1T0:0:0
EDATE=$2T0:0:0
GPATH=$3
OUT=$4
TMP=`mktemp /tmp/GITLOG-XXX.log`
OUT_FILE=$3/gitstat.csv
git log --after=$SDATE --before=$EDATE --shortstat --pretty=format:"%an;%ai"  $GPATH > $TMP
echo "author, date, insertions, deletions" >> $OUT_FILE
author=""
day=""
function count() {
    local insert=0
    local delete=0
    while read line ; do
	echo "got line: [$line]"
	if [[ -z $line ]]; then
		echo "empty line"
		continue ;
	fi

	# get the author and date
        author=`echo $line| awk -F';' '{printf $1}' `
	day=`echo $line | awk -F';' '{printf $2}' `
	if [[ $line!=$author ]] && [[ $line!=$day ]] ; then
		echo "got  author $author and day $day"
		read line;
	else
		echo "not got author and day"
		continue;
	fi
        
	current=`echo $line | awk -F',' '{printf $2}' | awk '{printf $1}'`
        if [[ -n $current ]]; then 
            insert=`expr $current`
        fi
        current=`echo $line | sed -n 's/.*, //p' | awk '{printf $1}'`
        if [[ -n $current ]]; then
            delete=`expr $current`
        fi
	echo $line
    	echo "$author, $day, $insert insertions, $delete deletions"
	echo "$author, $day, $insert, $delete">>$OUT_FILE

    done < $TMP
}

count;
