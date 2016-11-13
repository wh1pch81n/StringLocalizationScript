#!/bin/sh

#  ToStringsFileScript.sh
#  Localization script
#
#  Created by Derrick Ho on 11/13/16.
#  Copyright © 2016 Derrick Ho. All rights reserved.



# arg: sourceFile The file that contains all the NS_STRING_ENUMS
# arg: stringsFile The file that will story the english DOT strings file
# arg: type the typedef name that aids in locating the correct string
#
# discussion: expects one typedef of NS_STRING_ENUM per sourceFile

echo $1
echo $2
echo $3

#read source and save to file
while read -r LINE; do
if [[ $LINE == "static $prefix"* ]] ; then
echo $LINE | sed -E "s/(.*)@\"(.*)\";/\"\2\" = \"\2\";/"
fi
done < "$1" > "$2"

