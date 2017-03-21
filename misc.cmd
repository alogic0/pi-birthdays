sort -h -k 2 bdays.txt | tail

cat ../dates-ac.txt | while read i; do if grep -q $i dates-u.txt; then echo $i; else echo $i >> dates-u.txt; fi; done

tail -f -n +1 dates-u.txt | while read i; do grep -m 1 $i bdays.txt >> a-u.txt; echo $i; done

