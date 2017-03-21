#!/bin/bash

tail -n +$(($(wc -l < bdays.txt)+1)) dates-u.txt | while read n; do ../pibirthday.sh $n; done
