# pi-birthdays

Positions of birth dates from 1902 to 2020 in the Pi digits.

It's written in Bash. The scripts has been working for 5 days
mostly in the night.

Thank to the site http://www.subidiom.com/pi/
we can find the positions of any sequence in
the initial 2 Billion digits of the famous `Pi` number.

I've checked all dates from 1902-01-01 through 2020-12-31
and all of them were there. The complete list of dates and the places of
first occurrences in Pi is in the `bdays.txt` file.

Its size is 2.2M. There is 109K of lines because all dates are
checked in 3 variants ('YYYYmmdd', 'ddmmYYYY', and
american 'mmddYYYY').

## Explanation of work 

The `dates-gen.sh` generates the list of dates without repetitions. It uses
the ability of the `date` programm to calculate relative dates
(for example, try `date -d "1902-01-01 +40 days"`).
The output is `date-u.txt`.

Then `run.sh`. It takes dates from `date-u.txt`, finds their places
in Pi and puts the records to the `bdays.txt`. Interrupt it sometimes
and run `fix.sh`. It will check for missing dates inside bdays.txt and
correct it.

I've used the property of `diff -e` to generate ed-script for adding 
the missing lines.
