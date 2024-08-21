#!/bin/awk -f

BEGIN { 
	RS = ""; FS="\n"
}

{
     #  print "{\""$1 "\",\n \""$2 "\",\n \""$3"\"}" 
	
     #  printf "{\"%s\",\n \"%s\",\n \"%s\"}", $1, $2, $3 
	
     printf "{\"secret\":\"%s\",\n \"domain\":\"%s\",\n \"expiry\":\"%s\"}\n", $1, $2, $3 


}

END   { 

}



