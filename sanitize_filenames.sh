#!/bin/sh
# Author : Felix Xavier
# Replace or remove special character in given list of file names

if [ -z "$1" ]
then
   echo "Please provide the arguments :- file names with comma separated values and double quotes prefixed and suffixed."
   echo "For Example: ./sanitize_filenames.sh \"analysis%fir#.py,report@2020.xl\""

else
   echo "Files: $1"
   
   # Remove the special characters that cannot be replaced - space, ', ".
   FILES_STRING="$(echo -e "${1}" | tr -d '[:space:]')"
   FILES_STRING="$(echo -e "${FILES_STRING}" | tr -d '"')"
   FILES_STRING="$(echo -e "${FILES_STRING}" | tr -d "'")"

   declare -A replacements
   # Here comes the list of replcaements
   replacements["#"]=pound
   # Modifythe list if you want to add new replcaement or change text
   replacements+=( ["%"]=percent ["&"]=ampersand ["{"]=leftCurlBr ["}"]=rightCurlBr ["<"]=leftBr [">"]=rightBr )
   replacements+=( ["*"]=asterisk ["?"]=question ["!"]=exclam [":"]=colon )
   replacements+=( ["@"]=at ["+"]=plus ["|"]=pipe ["="]=eq )
   #replacements+=( [";"]=semicoln ) # Uncomment this line to add semicolen
   #
   # Do find and replace on filestring while reading 
   # replacements bash array
   #
   for key in "${!replacements[@]}"
   do
	  #echo $key
	  replace=${replacements[${key}]}
	  #echo $replace
	  FILES_STRING=$(echo $FILES_STRING | sed "s/${key}/${replace}/g")
	  #echo $FILES_STRING
   done

   # Some special characters follow different espacing while replacement
   FILES_STRING=$(echo $FILES_STRING | sed "s/\`/backTick/g")
   FILES_STRING=$(echo $FILES_STRING | sed "s#/#forSlash#g")
   FILES_STRING=$(echo $FILES_STRING | sed 's#\\#backSlash#g')


   #echo "File string after replace $FILES_STRING"
   IFS=',' read -r -a fileArray <<< "$FILES_STRING"

   echo "File list :-"
   for element in "${fileArray[@]}"
   do
	   echo "$element"
   done
fi
