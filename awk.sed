df -k | sed -n '/^\//p'
df -k | sed '/^[^\/]/d'
ls -l | sed -e '/^[^\-]/d' -e 's/ *[0-9].* / /'
ls -l | sed 's/[0-9].* / /'

cut -f2 sname > /tmp/sn.$$
cut -f2 smark > /tmp/sm.$$
paste sname smark
paste /tmp/sn.$$ /tmp/sm.$$
join sname smark
tr [a-z] [A-Z] < sname
tr a b < sname
awk '/a/{print $1" "$2}' sname
sed '/a/s//pretty good/g' < sname > /tmp/sn.sed.$$
uniq personname.txt > /tmp/personname.txt.$$
sort personname.txt | uniq > /tmp/personname.sort.txt.$$
grep am sname
grep 'am' sname
grep "am" sname
awk -f prn_pen inven.txt
awk '/Pen/ {print $3}' invent.txt
awk '$3<$4 {print $0}' inven.txt



