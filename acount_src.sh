awk -F: '
$1 == "B" {
BAL=$NF ;
next ;
			}
			$1 == "D" {
			BAL += $NF ;
		}
		($1 == "C") || ($1 == "W") {
		BAL-=$NF ;
	}
	($1 == "C") || ($1 == "W") || ($1 == "D") {
	printf "%10s %8.2f\n",$2,BAL ;
}
END {
printf "-\n%10s %8.2f\n","Total",BAL ;
											}
											' acount.txt ;
