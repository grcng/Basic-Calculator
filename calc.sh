
echo 'Enter Commands (MR, MC, Clear (C), Off (X)) or any integer as Operand.'
echo 'Enter Commands (+, -, *, /) or (MS, M+, MC, Clear (C), Off (X)) as Operator.'
echo 'If an integer is typed in as an Operator, it will continue the previous Operator with such integer.'

#$input will evaluate whether the types in an operand or operator
input=''
operator=''

#first and second number in a calculation
num1=''
num2=''

result=0
memory=0
echo -n 'Enter operand: '
read input

#because if $input is X, the script will exit
while [ "$input" != 'X' ]
do

    if [ "$input" == 'C' ]
    then
        result=0
        num1=''
        num2=''
        echo  'Result cleared'
        echo -n 'Enter operand: '
        read input

    elif [ "$input" == 'MC' ]
    then
        memory=0
        echo "$memory" ' -> M'
        echo -n 'Enter operator: '
        read input

    elif [ "$input" == 'MR' ]
    then
#if num1 is empty, we will need the operator and another input
        if [ "$num1" == '' ]
        then
            num1="$memory"
            echo 'M -> ' "$num1"
        else
            echo 'M -> ' "$memory"
#check for division of 0
            if [ "$memory" == 0 ]
            then
                if [ "$operator" == '/' ]
                then
                    echo 'Cannot divide by 0. Please re-enter divisor:'
                    echo -n 'Enter operand: '
#while loop to make sure the input will not be 0
                    while read input
                    do
                        if [ "$input" == 0 ]
                        then
                            echo 'Cannot divide by 0. Please re-enter divisor: '
                            echo -n 'Enter operand: '
                        else
                            break
                        fi
                    done
                    num2="$input"
                else
                    num2="$memory"
                fi
            else
                 num2="$memory"
            fi
            if [ "$operator" == '+' ]
            then
                 result=$(($num1+$num2|bc))

            elif [ "$operator" == '-' ]
            then
                 result=$(($num1-$num2|bc))

            elif [ "$operator" == '*' ]
            then
                 result=$(($num1*$num2|bc))

            elif [ "$operator" == '/' ]
            then
                 result=$(($num1/$num2|bc))
            fi
            echo "$num1" "$operator" "$num2" '=' "$result"
            num1="$result"

        fi

        echo -n 'Enter operator: '
        read input

    elif [ "$input" == 'MS' ]
    then
        memory="$result"
        echo "$memory" ' -> M'
        echo -n 'Enter operator: '
        read input

    elif [ "$input" == 'M+' ]
    then
        oldmem="$memory"
        memory=$(($oldmem+$result|bc))
        echo "$oldmem" ' + ' "$result" ' = ' "$memory" '-> M'
        echo -n 'Enter operator: '
        read input

    elif [ "$input" == '+' ] || [ "$input" == '-' ] || [ "$input" == '*' ] || [ "$input" == '/' ]
    then
        operator="$input"
        echo -n 'Enter operand: '
        read input

#check if $input is an integer, including negative numbers
#If the prompt asks for an operand but the user types in an integer,
#the calculator will use such number as num2 to continue the previous calculation
#this is because there is 1 type of input and digits are not invalid
    elif [[ "$input" =~ ^-?[0-9]+$ ]]
    then

        if [ "$num1" == '' ]
        then
            num1="$input"
        else
#check for division of 0
            if [ "$input" == 0 ]
            then
                if [ "$operator" == '/' ]
                then
                    echo 'Cannot divide by 0. Please re-enter divisor: '
                    echo -n 'Enter operand: '
                    while read input
                    do
                        if [ "$input" == 0 ]
                        then
                            echo 'Cannot divide by 0. Please re-enter divisor: '
                            echo -n 'Enter operand: '
                         else
                            break
                         fi
                    done
                    num2="$input"
                else
                    num2="$input"
                fi
            else
                num2="$input"
            fi

            if [ "$operator" == '+' ]
            then
                result=$(($num1+$num2|bc))

            elif [ "$operator" == '-' ]
            then
                result=$(($num1-$num2|bc))

            elif [ "$operator" == '*' ]
            then
                result=$(($num1*$num2|bc))

            elif [ "$operator" == '/' ]
            then
                result=$(($num1/$num2|bc))
            fi

            echo "$num1" "$operator" "$num2" '=' "$result"
            num1="$result"
        fi
        echo -n 'Enter operator: '
        read input

#everything else would become invalid operators
    else
        operator="$input"
        echo 'Sorry,' "$operator" ', is not a valid operator. Please re-enter operator.'
        echo -n 'Enter operator: '
        read input

    fi
done

if [ "$input" == 'X' ]
then
    echo 'Goodbye'
    exit
fi
