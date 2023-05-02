#! /bin/bash
#Checks from user input if the number is divisible by 2 or not

read -p "Enter the number which needs to be checked" num1

divisible(){

    local num=$num1
    echo "you wrote $num"

    if [ $(( $num%2)) -eq 0 ]
    then
        echo "the number is divisible by 2"
    else
        echo "the number is not divisible by 2"
    fi
}
divisible
