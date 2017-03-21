# START=$(date -d "$(tail -n 1 dates-u.txt) +1 day" +"%Y-%m-%d")
START=1902-01-01
YRS=118
DAYS=$((365 * $YRS + 31 - 3))
FL=dates-u.txt
touch $FL

for i in $(seq 0 $DAYS); 
  do date -d "$START +$i day" +"%Y%m%d%n%d%m%Y%n%m%d%Y";
done |\
while read i;
  do if grep -q $i $FL;
     then echo $i;
     else echo $i >> $FL;
     fi
done
# grep -bo -m 1 -E "16041960" pi-billion.txt
