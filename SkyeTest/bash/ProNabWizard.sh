#!/usr/bin/env bash

# Set variable to store current date
_now=$(date +"%Y_%m_%d"
printf "Enter configuration script below (Leave a blank line to mark the end of script):\n"
# Accept multiline input until blank line detected
config=$(sed '/^$/q')
read -p $'Destination device (hostname or IP):\x0a' device # ** DO SOME ERROR HANDLING AFTER THIS TO MAKE SURE A VALID NON-ZERO LENGTH STRING WAS ENTERED **
read -p $'\x0aEnter a job description (avoid spaces):\x0a' job # ** DO SOME ERROR HANDLING AFTER THIS TO MAKE SURE A VALID NON-ZERO LENGTH STRING WAS ENTERED **
# Create filename for output using job ref and date
filename="${_now}-${job}.txt"

# CommandCache.txt requires write permissions. This is a placeholder text file to store config to be used with clogin
echo "$config" > CommandCache.txt # ** PROBABLY BEST TO AVOID A FIXED FILENAME HERE, USE SOMETHING TIME BASED OR USE "mktemp" **

# Store command for execution
CLOGIN_STRING='echo -x CommandCache.txt '$device' 2>&1 > '$filename'' # ** DOUBLE QUOTE YOUR VARIABLES HERE.  PARTICULARLY IMPORTANT FOR "$filename" IN CASE THE USER DID PUT A SPACE IN.  ALSO TWO REDUNDANT SINGLE QUOTES AT THE END OF THE LINE SHOULD GO. **

printf "\nConfiguration loaded.\n\n1) Execute job now\n2) Schedule job\nOther value) Quit job scheduler (this will discard the current job)\n\n"
read -n1 ScheduleChoice
                        case "$ScheduleChoice" in # ** DOUBLE QUOTE THIS VARIABLE **
                                 1)             echo " "
                                                $CLOGIN_STRING
                                                printf "Job executed."
                                                sleep 1
                                                exit
                                                ;;

                                 2)             printf "\n'Schedule job' selected.\n Please enter desired time/date in Linux 'at' format, as per the following examples:\n \nExample 1  -  10:00 AM\nExample 2  -  now + 30 minutes\nExample 3  -  7:00 PM March 25\n\nEnter desired execution time/date below:\n"
                                                read desiredDate
                                                SCHEDULE_STRING='echo '$CLOGIN_STRING' | at '$desiredDate'' # ** DOUBLE QUOTE THESE VARIABLES **
                                                # "Eval" bad command? Check with linux pros
                                                eval "$SCHEDULE_STRING" ## ** DO SOME ERROR HANDLING AFTER THIS TO MAKE SURE IT WORKED **
                                                echo "Job submitted for execution at $desiredDate. Use the "atq" command to view pending jobs." # ** ESCAPE THE DOUBLE QUOTED "atq" OR SINGLE QUOTE THE WHOLE LOT INSTEAD OF DOUBLE. **
                                                sleep 1
                                                exit
                                                ;;

                                *)              printf "\nExiting job scheduler\n"
                                                sleep 1
                                                exit
                                                ;;
# ** MISSING "esac" **
