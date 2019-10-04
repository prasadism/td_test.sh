#!/bin/bash
# include this boilerplate
function jumpto
{
    label=$1
    cmd=$(sed -n "/$label:/{:a;n;p;ba};" $0 | grep -v ':$')
    eval "$cmd"
    exit
}

getTDPATH:  2> /dev/null
echo -n  "Type Thread Dump path , followed by [ENTER]:"


read TD_PATH
test -d $TD_PATH
tdp=$?

if [[  "$tdp" != 0 ]] ; then
		echo -e "${r}Invalid Thread Dump path${n}" >&2;
                jumpto getTDPATH

fi

