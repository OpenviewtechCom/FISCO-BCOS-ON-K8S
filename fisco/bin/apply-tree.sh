#! /bin/sh

applyTree(){
	if test -d $2
	then
		list=`ls $2`
		for item in $list;
		do
			applyTree $1  "$2/$item"
		done
	else
		echo "kubectl -n $1 apply -f $2"
		kubectl -n $1 apply -f $2
	fi
}

applyTree $1 $2