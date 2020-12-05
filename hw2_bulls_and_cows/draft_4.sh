# Set variables
NUMBER=$(( RANDOM % 10 ))
NEW_NUMBER=$(( RANDOM % 10 ))
COUNTER=-1

# Generate a number with 4 unique digits
while [ ${#NUMBER} -lt 4 ];
do
  COUNTER=$(( $COUNTER + 1 ))
  
  # Make sure in uniqueness of a digit
  while [ ${NUMBER:COUNTER:1} == $NEW_NUMBER ] || \
    [ ${NUMBER:COUNTER-1:1} == $NEW_NUMBER ] || \
    [ ${NUMBER:COUNTER-2:1} == $NEW_NUMBER ];
  do
    NEW_NUMBER=$(( RANDOM % 10 ))
  done

  NUMBER="$NUMBER$NEW_NUMBER"
done

echo $NUMBER