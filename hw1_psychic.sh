# Set the initial variables
CURRENT_RANDOM_NUMBER=""
RANDOM_NUMBERS=""

GUESSED_COUNTER=0
NOT_GUESSED_COUNTER=0
SUMMARY_COUNTER=0

GUESSED_STAT=0
NOT_GUESSED_STAT=0
STATISTICS=""

# Get an initial user's input data
echo "Здравствуйте! Это игра Экстрасенс. Пожалуйста, угадайте число от 0 до 9: "
read USER_INPUT

while [[ "$USER_INPUT" -ne "q" ]]; do
  
  # Add an error handler
  if [ "$USER_INPUT" -gt "9" ] || [ "$USER_INPUT" -lt "0" ]
    then
      echo "К сожалению, Вы ввели число меньше 0 или больше 9. Пожалуйста, повторите попытку и введите корректное число: "
      read USER_INPUT
  
  else
    # Generate random number
    CURRENT_RANDOM_NUMBER=$(( RANDOM % 10 ))

    # Check conformity between an user's number and random number
    if [ "$USER_INPUT" -eq "$CURRENT_RANDOM_NUMBER" ]
      then
        GUESSED_COUNTER=$(( $GUESSED_COUNTER + 1 ))
    elif [ "$USER_INPUT" -ne "$CURRENT_RANDOM_NUMBER" ]
      then
        NOT_GUESSED_COUNTER=$(( $NOT_GUESSED_COUNTER + 1 ))
    fi

    # Calculate statistics
    SUMMARY_COUNTER=$(( $GUESSED_COUNTER + $NOT_GUESSED_COUNTER ))
    GUESSED_STAT=$(( $GUESSED_COUNTER * 100 / $SUMMARY_COUNTER ))
    NOT_GUESSED_STAT=$(( $NOT_GUESSED_COUNTER * 100 / $SUMMARY_COUNTER ))
    STATISTICS="$GUESSED_STAT% / $NOT_GUESSED_STAT%"

    # Show the statistics
    RANDOM_NUMBERS="$RANDOM_NUMBERS $CURRENT_RANDOM_NUMBER"
    echo "Статистика (угадано/не угадано): $STATISTICS"
    echo "Загаданные числа:$RANDOM_NUMBERS"
    echo "Какое число от 0 до 9 загадано сейчас (q - закончить)? _";

    # Get an user's input data
    read USER_INPUT
  fi
done