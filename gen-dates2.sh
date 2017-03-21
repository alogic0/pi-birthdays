# START=$(date -d "$(tail -n 1 dates-u.txt) +1 day" +"%Y-%m-%d")
START=2019-12-01
YRS=3
DAYS=$((365 * $YRS))
DAYS=31
FL_OLD=dates-u.txt
FL=dates-u2.txt
touch $FL

for i in $(seq 0 $DAYS); 
  do date -d "$START +$i day" +"%Y%m%d%n%d%m%Y%n%m%d%Y";
done |\
while read i;
  do if grep -q $i $FL $FL_OLD;
     then echo $i;
     else echo $i >> $FL;
     fi
done
# grep -bo -m 1 -E "16041960" pi-billion.txt
