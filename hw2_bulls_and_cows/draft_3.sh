number=0
FLOOR=1000
RANGE=9999

while [ "$number" -le $FLOOR ]
do
  number=$RANDOM
  let "number %= $RANGE"
done
echo "Случайное число в диапазоне от $FLOOR до $RANGE: $number"
echo ${number[0]}