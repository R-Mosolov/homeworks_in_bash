# Set variables
step_counter=0
current_result=""
total_result=()
call_to_action="Введите 4-значное число с неповторяющимися цифрами (q - закончить): _"

# Get an user input
echo "Здравствуйте! Это игра Быки и коровы. Мы загадали для вас специальное число, состоящее из 4 уникальных цифр. Попробуйте его разгадать:"
read user_input

while [[ "$user_input" -ne "q" ]]
do
  # The preparations to check uniqueness of digits
  is_nonunique_digits=false
  for (( i=0; i<${#user_input}; i++ ));
  do
    for (( j=0; j<${#user_input}; j++ ));
    do
      if [ ${user_input:$i:1} == ${user_input:$j:1} ] && [ $i != $j ]
      then
        is_nonunique_digits=true
      fi
    done
  done
  
  # Add an error handler: a wrong number
  if [ ${#user_input} -gt 4 ] || [ ${#user_input} -lt 4 ]
  then
    echo "К сожалению, Вы ввели число, состоящее не из 4 цифр. Пожалуйста, повторите попытку:".
    read user_input

  # Add an error handler: nonunique digits of a number
  elif [ $is_nonunique_digits == true ]
  then
    echo "К сожалению, Вы ввели число, некоторые цифры которого повторяются. Пожалуйста, повторите попытку:"
    read user_input

  else
    # Clear variables of a last loop 
    number=""
    new_number=""
    counter=-1
    cows_counter=0
    bulls_counter=0

    step_counter=$(( step_counter + 1 ))

    # Generate a number with 4 unique digits
    while [ ${#number} -lt 4 ];
    do
      counter=$(( $counter + 1 ))
      
      # Make sure in uniqueness of a digit
      while [[ ${number:counter:1} == $new_number ]] \
        || [[ ${number:counter-1:1} == $new_number ]] \
        || [[ ${number:counter-2:1} == $new_number ]] \
        || [[ ${number:counter-3:1} == $new_number ]];
      do
        new_number=$(( RANDOM % 10 ))
      done

      # Generate statistics: satisfying positions (bulls)
      for (( i=0; i<${#number}; i++ ));
      do
        echo "${number:$i:1}-${user_input:$i:1}"

        # if [ "${number:$i:1}" == "${user_input:$i:1}" ]
        # then
        #   bulls_counter=$(( $bulls_counter + 1 ))
        # fi
      done

      number="$number$new_number"
      current_result="$step_counter. $number (Коров - 3, Быков - $bulls_counter)"
    done

    total_result+=("$current_result")

    # Show conclusion
    for value in "${total_result[@]}"
    do
      echo $value
    done
    echo $call_to_action
    read user_input
  fi
done