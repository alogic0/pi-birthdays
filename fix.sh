#!/bin/bash

DCUR=d-cur.txt
DORIG=d-orig.txt
EDCMD=ed-fix.cmd

FL=bdays.txt

cut -f1 $FL > $DCUR 

head -n $(wc -l < $DCUR) dates-u.txt > $DORIG

diff -e $DCUR $DORIG > $EDCMD 

diff $DCUR $DORIG | sed -n '/^>/s@^> @@p' |\
  while read n; 
    do ./pib.sh $n;
       str=$(sed 's@string <b>@@; s@</b> appears at the @\t@' ${n}.html)
       sed -i '/^'$n'$/c'"$str" $EDCMD
    done

sed -i '/d$/d' $EDCMD
echo "wq" >> $EDCMD

vim $EDCMD 

echo "Apply changes? (y/n)"
read ANS
if [ $ANS = "y" ]
  then
    cp $FL ${FL%.txt}-$(date +"%s").txt
    ed $FL < $EDCMD
  else echo 'Nothing changed.'
fi

rm $DORIG $DCUR
