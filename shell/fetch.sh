#! /bin/sh

# fetch the code
fetch_remote()
{
	# Do code fetch operation
	echo "git fetch"
}

# Check whether is git mirror repository
#   - if it is a git, do code fetch operation
#   - if not, then recursive the directory
check_git()
{
	result=`echo $1 | grep ".git"`
	if [ "$result" != "" ]
	then
		pushd $1 >> /dev/null
		current_dir=${PWD};
		echo "current directory: $current_dir"
		echo
		echo
		popd >> /dev/null
	else
		pushd $1 >> /dev/null
		recursive_directory $1;
		popd >> /dev/null
	fi
}

# recursive all the sub directory
recursive_directory()
{
	for i in *;
	do
		if [ -d $i ]
		then
			check_git $i;
		fi
	done
}

# main process
recursive_directory ${PWD}

# check we still at the directory where we start
# echo ${PWD}
