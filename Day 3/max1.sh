max() {
	a=$1
	b=$2
	r=$(( a > b ? a : b ));
	return $r;
}

echo "$(max "$(max 3 4)" 1)"