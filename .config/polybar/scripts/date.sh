YEAR=$(date +%G)
MONTH=$(date +%B)
WEEK=$(date +%u)
DAY=$(date +%d)
HOURS=$(date +%R)

case $WEEK in
   1) WEEK=Segunda ;;
   2) WEEK=Terça ;;
   3) WEEK=Quarta ;;
   4) WEEK=Quinta ;;
   5) WEEK=Sexta ;;
   6) WEEK=Sabado ;;
   7) WEEK=Domingo ;;
 esac
echo " $WEEK, $DAY de $MONTH de $YEAR - $HOURS"
