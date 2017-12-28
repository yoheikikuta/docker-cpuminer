#!/bin/sh

usage() {
  echo Usage: docker run --rm -it IMAGENAME -o POOLURL -u USERNAME -w WORKERNAME -p PASSWORD
  exit 1
}

while getopts o:u:w:p: OPT
do
  case $OPT in
    "o" ) FLG_A="TRUE" ; VALUE_A="$OPTARG" ;;
    "u" ) FLG_B="TRUE" ; VALUE_B="$OPTARG" ;;
    "w" ) FLG_C="TRUE" ; VALUE_C="$OPTARG" ;;
    "p" ) FLG_D="TRUE" ; VALUE_D="$OPTARG" ;;
  esac
done

if [ "$FLG_A" != "TRUE" ] && [ "$FLG_B" != "TRUE" ] && [ "$FLG_C" != "TRUE" ] && [ "$FLG_D" != "TRUE" ] ; then
  usage
else
  ./minerd -a yescrypt -o $VALUE_A -u $VALUE_B.$VALUE_C -p $VALUE_D
fi
exit 0
