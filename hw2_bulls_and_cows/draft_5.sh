# Set variables
NUMBER=$(( RANDOM % 10 ))
NEW_NUMBER=$(( RANDOM % 10 ))
COUNTER=-1
STEP_COUNTER=0

# Get an user input
echo "Здравствуйте! Это игра Быки и коровы.\
  Мы загадали для вас специальное число, состоящее из 4 уникальных цифр.\
  Попробуйте его разгадать:"
read USER_INPUT

while [[ "$USER_INPUT" -ne "q" ]]
do
  elif [ ${#USER_INPUT} -gt 4 ] || [ ${#USER_INPUT} -lt 4 ]
  then
    echo "К сожалению, Вы ввели число, состоящее не из 4 цифр.\
      Пожалуйста, повторите попытку".

  else
    STEP_COUNTER=$(( STEP_COUNTER + 1 ))

    # Generate a number with 4 unique digits
    while [ ${#NUMBER} -lt 4 ];
    do
      COUNTER=$(( $COUNTER + 1 ))
      
      # Make sure in uniqueness of a digit
      while [[ ${NUMBER:COUNTER:1} == $NEW_NUMBER ]] || \
        [[ ${NUMBER:COUNTER-1:1} == $NEW_NUMBER ]] || \
        [[ ${NUMBER:COUNTER-2:1} == $NEW_NUMBER ]];
      do
        NEW_NUMBER=$(( RANDOM % 10 ))
      done

      NUMBER="$NUMBER$NEW_NUMBER"
    done

    # Show conclusion
    echo "$STEP_COUNTER. $NUMBER (Коров - 3, Быков - 1)\
      Введите 4-х значное число с не повторяющимися цифрами (q - закончить): _"
    read USER_INPUT
    if [ $USER_INPUT == "q" ]
    then
      exit 0
    fi
  fi
done