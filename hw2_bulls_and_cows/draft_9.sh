# Set variables
STEP_COUNTER=0
CURRENT_RESULT=""
TOTAL_RESULT=()
CALL_TO_ACTION="Введите 4-значное число с неповторяющимися цифрами (q - закончить): _"

# Get an user input
echo "Здравствуйте! Это игра Быки и коровы. Мы загадали для вас специальное число, состоящее из 4 уникальных цифр. Попробуйте его разгадать:"
read USER_INPUT

while [[ "$USER_INPUT" -ne "q" ]]
do
  # The preparations to check uniqueness of digits
  IS_NONUNIQUE_NUMBERS=false
  for (( i=0; i<${#USER_INPUT}; i++ ));
  do
    for (( j=0; j<${#USER_INPUT}; j++ ));
    do
      if [ ${USER_INPUT:$i:1} == ${USER_INPUT:$j:1} ] && [ $i != $j ]
      then
        IS_NONUNIQUE_NUMBERS=true
      fi
    done
  done
  
  # Add an error handler: a wrong number
  if [ ${#USER_INPUT} -gt 4 ] || [ ${#USER_INPUT} -lt 4 ]
  then
    echo "К сожалению, Вы ввели число, состоящее не из 4 цифр. Пожалуйста, повторите попытку:".
    read USER_INPUT

  # Add an error handler: nonunique digits of a number
  elif [ $IS_NONUNIQUE_NUMBERS == true ]
  then
    echo "К сожалению, Вы ввели число, некоторые цифры которого повторяются. Пожалуйста, повторите попытку:"
    read USER_INPUT

  else
    # Clear variables of a last loop 
    NUMBER=""
    NEW_NUMBER=""
    COUNTER=-1

    STEP_COUNTER=$(( STEP_COUNTER + 1 ))

    # Generate a number with 4 unique digits
    while [ ${#NUMBER} -lt 4 ];
    do
      COUNTER=$(( $COUNTER + 1 ))
      
      # Make sure in uniqueness of a digit
      while [[ ${NUMBER:COUNTER:1} == $NEW_NUMBER ]] \
        || [[ ${NUMBER:COUNTER-1:1} == $NEW_NUMBER ]] \
        || [[ ${NUMBER:COUNTER-2:1} == $NEW_NUMBER ]] \
        || [[ ${NUMBER:COUNTER-3:1} == $NEW_NUMBER ]];
      do
        NEW_NUMBER=$(( RANDOM % 10 ))
      done

      NUMBER="$NUMBER$NEW_NUMBER"
      CURRENT_RESULT="$STEP_COUNTER. $NUMBER (Коров - 3, Быков - 1)"
    done

    TOTAL_RESULT+=("$CURRENT_RESULT")

    # Show conclusion
    for VALUE in "${TOTAL_RESULT[@]}"
    do
      echo $VALUE
    done
    echo $CALL_TO_ACTION
    read USER_INPUT
  fi
done