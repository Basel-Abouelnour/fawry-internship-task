#!/bin/bash

#My custom grep command

#variables
search_string=""
filename=""
option_one=""
option_two=""



#<<validation #"""input scenarios

#In case the first argument is the file
        # then only execute the grep function

#else if there's a flag or two flags
        # then execute the grep function with the use of the flags

#else if there's no file name passed to the script
        # output that's the filename should be passed and exit the script
#validation

# Validating Input
#echo " inputs number 	$#"
#echo " inputs 		$1 $2 $3 $4"; echo ; echo ;

## validating if there's no input at all
if [[ -z $1 ]] || [[ $1 = "--help" ]]; then

  echo "Usage: 	./mygrep.sh	[Options] SearchString	Filename"
  echo "Options	-n 		show line numbers for each match"
  echo "      	-v		invert the match (print lines that do not match"
  echo "	--help		show command usage and options"
  exit 1

fi

## validating arguments in case there're 3 inline variables
if [ $# -eq 4 ]; then
  
  option_one=$1
  option_two=$2
  search_string=$3
  filename=$4

  if [[ "$1" = "-n" && "$2" = "-v" && -e $filename ]] || [[ "$2" = "-n" && "$1" = "-v" && -e $filename ]]; then
    #echo "correct 4 arguments"
    echo; 
  else
    echo "Please, provide valid arguments."
  fi

## validating arguments in case there're 2 inline variables
elif [ $# -eq 3 ]; then
  option_one=$1
  option_two=""
  search_string=$2
  filename=$3
  if [[ "$1" = "-n" || "$1" = "-v" || "$1" = "-vn" || "$1" = "-nv" ]] && [[ -e $filename ]]; then
    #echo "correct 3 arguments"
    echo;
  else
    echo "Please, Provide valid arguments or filename"
  fi

## validating filename in case there's only 1 inline argument
elif [ $# -eq 2 ] && [ -e $2 ]; then
  search_string=$1
  filename=$2
  #echo "correct filename" 

else 

  echo "File does not exist!"

fi
 

#echo; echo; echo; echo; echo "##################";
#echo "search string is $search_string , and filename is $filename" #Trying to add colour here

# command characteristics 
#<<body 	# the body of the grep function
	# should be case insensitive
	# finding the words inside the file
	# outputing the words with a color
	# impleminting the -n flag ( line number for each match )
	# impleminting the -v flag ( invert the match - print lines that doesn't match - )

#body
#cat -n $filename | awk -v pat="$search_string" '$0 ~ pat'; echo " basic command output" 
# read entire file with line numbers --pass-it-to-awk--> printing lines containing the given searsh-string in variable


# command 
echo;
if [[ $option_one && $option_two ]] || [[ $option_one = "-vn" ]] || [[ $option_one = "-nv" ]] ; then
  
  #echo "-vn option"
  # here comes the command with -vn option , didn't figure it out, yet.
  # just needed to "not" the search_string
  cat -n $filename |  awk -v pat="$search_string" 'BEGIN { IGNORECASE=1 } !($0 ~ pat) { print }'
 
elif [[ $option_one = "-n" || $option_two = "-n" ]]; then
  
  cat -n $filename |  awk -v pat="$search_string" 'BEGIN { IGNORECASE=1 } $0 ~ pat { print }'

elif [[ $option_one = "-v" || $option_two = "-v" ]]; then
  
  #echo " -v option "	
  cat  $filename |  awk -v pat="$search_string" 'BEGIN { IGNORECASE=1 } !($0 ~ pat) { print }'  

else
  
  awk -v pat="$search_string" 'BEGIN { IGNORECASE=1 } $0 ~ pat { print }' "$filename"

fi




