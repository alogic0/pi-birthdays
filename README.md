# pi-birthdays
The places in the Pi number where all dates (1902-2020) appear.

The language of scripts is Bash. The scripts worked during 5 days  
mostly in night.

Thanks to the site http://www.subidiom.com/pi/  
we can check occurences of any sequence of digits in  
the initial 2 Billion part of the famous `Pi` number.  

I've checked all dates from 1902-01-01 through 2020-12-31  
and all of them were there. The complete list of dates and the  
first places of appearance inside `Pi` is in the `bdays.txt` file.  
Its size is 2.2M. There is 109K of lines because all dates are  
checked in 3 variants of writings ('YYYYmmdd', 'ddmmYYYY', and  
american 'mmddYYYY').

## Explanation of work 

To generate not duplicated dates use the `dates-gen.sh`. It's based  
on the ability of the `date` to calculate relative dates 
(for example, try ```date -d '1902-01-01 +40 days'```). The `date-u.txt`  
is the result.

Then `run.sh`. It takes dates from the `date-u.txt`, finds it appearance  
in Pi and put records to the `bdays.txt`. Interrupt it sometimes and run  
`fix.sh`. It checks missings of dates inside `bdays.txt` and corrects it.  
I used the property of `diff -e` to generate ed-script for adding lines.
