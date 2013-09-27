#! /bin/sh

# The process ID of shell
echo -n "The process ID of shell: "
echo $$

# The Shell name
echo -n "The shell name: "
echo $0

# The shell parameter's number
echo -n "The shell parameter's number: "
echo $#

# The shell parameter's list
echo -n "The shell parameter's list: "
echo $@

echo -n "The shell parameter's list: "
echo $*

# list each parameter
echo "list each parameter:"
echo $0
echo $1
echo $2
echo $3
echo $4
echo $5
