#!/bin/bash
#Debug Mode
#set -x
clear
#Define Colors

Green='\u001b[32m'
Red='\u001b[31m'
Blue='\u001b[34m'
White='\u001b[37m'
NC='\u001b[37m'
#Comments are added by #

#Prints welcome message
echo -e "${Red}"
if [ -f /usr/games/cowsay ]
then
        cowsay "Welcome"
        echo -e "\t... To NewEra Calculator App"

else
        echo -e  "Welcome to NewEra Calculator App\n\n"


fi

echo -e "${NC}"
#calculate () {
#read -p "Enter First Number: " num1
#read -p "Enter Second Number: " num2

#echo "$num1 $1 $num2 = $(expr $num1 $1 $num2)"
#}

#Multiplication function

calculate () {
read -p "Enter First Number: " num1
read -p "Enter Second Number: " num2
echo "$num1 $1 $num2 =  $(echo $(( $num1$1$num2 )))" >> /tmp/calc_history.txt
echo "$num1 $1 $num2 =  $(echo $(( $num1$1$num2 )))"
}

# Display Options Menu
PS3="Please select an option: "
select option in Addition Subtraction Multiplication Divison History Quit

do
        case $option in

                Addition)
                        calculate "+"
                        ;;
                Subtraction)
                        calculate "-"
                        ;;

                Multiplication)
                        calculate "*"
                        ;;
                Divison)
                        calculate "/"
                        ;;
                Quit)
                        echo -e "${Blue}"
                        if [ -f /usr/games/cowsay ]
                        then
                                cowsay "Goodbye"
                        else
                                echo "Goodbye"
                        fi
                        sleep 1
                        exit $?
                        ;;
                History)
                       echo "***************HISTORY**************"
		       	tail -20  /tmp/calc_history.txt 
			echo "***************HISTORY**************"
                esac

done
