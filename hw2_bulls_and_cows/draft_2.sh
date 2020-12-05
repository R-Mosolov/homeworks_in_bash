NUMBER_1=$(( RANDOM % 10 ))

NUMBER_2=$(( RANDOM % 10 ))
if [ "$NUMBER_2" -eq "$NUMBER_1" ]
  then
    NUMBER_2=$(( RANDOM % 10 ))
    if [ "$NUMBER_2" -eq "$NUMBER_1" ]
      then
        NUMBER_2=$(( RANDOM % 10 ))

NUMBER_3=$(( RANDOM % 10 ))
if [ "$NUMBER_3" -eq "$NUMBER_1" ] || [ "$NUMBER_3" -eq "$NUMBER_2" ]
  then
    NUMBER_3=$(( RANDOM % 10 ))
    if [ "$NUMBER_3" -eq "$NUMBER_1" ] || [ "$NUMBER_3" -eq "$NUMBER_2" ]
      then
        NUMBER_3=$(( RANDOM % 10 ))

NUMBER_4=$(( RANDOM % 10 ))
if [ "$NUMBER_4" -eq "$NUMBER_1" ] || [ "$NUMBER_4" -eq "$NUMBER_2" ] || [ "$NUMBER_4" -eq "$NUMBER_3" ]
  then
    NUMBER_4=$(( RANDOM % 10 ))
    if [ "$NUMBER_4" -eq "$NUMBER_1" ] || [ "$NUMBER_4" -eq "$NUMBER_2" ] || [ "$NUMBER_4" -eq "$NUMBER_3" ]
      then
        NUMBER_4=$(( RANDOM % 10 ))

RESULT="$NUMBER_1$NUMBER_2$NUMBER_3$NUMBER_4"
echo $RESULT