read random
sed 's/\(.\)/\1\n/g' $random | sort | uniq -ic

