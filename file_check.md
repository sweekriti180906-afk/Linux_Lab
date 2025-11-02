## ~ CHECK_FILE ~
![img](<Screenshot from 2025-09-19 12-57-13.png>)


 ---
### EXPLANATION
## ln 5   if [ $# -ne 1 ];
## $# is to tell the count of total number of argument.
## this is to take a single argument.
## if ln 5 is false ,then the code will execute.

## variable file will store the first argument i.e $1 
## ln 11 checks if the $file exists. if true ,it goes to line 12 -14.if false,it goes to line 15.
## ln 17 read  takes input
## ln 17 -p "create this now" - shows this prompt before waiting for input.
## answer - variable where response is stored