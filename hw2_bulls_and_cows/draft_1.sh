# Set initial variables
IS_FIRST_NUMBER=true
ARE_NUMBERS_UNIQUE=false
FOUR_UNIQUE_NUMBERS=""

# Create the unique numbers generator
while [ "$ARE_NUMBERS_UNIQUE" == "true" ]; do
  UNIQUE_NUMBER=$(( RANDOM % 10 ))
  echo "$UNIQUE_NUMBER"
  ARE_NUMBERS_UNIQUE=true
  
  # if [ IS_FIRST_NUMBER == true ]
  #   then
  #     UNIQUE_NUMBER

  # else
  #   then
  #     FOUR_UNIQUE_NUMBERS="$FOUR_UNIQUE_NUMBERS$UNIQUE_NUMBER"
  #     echo FOUR_UNIQUE_NUMBERS

  # fi
done