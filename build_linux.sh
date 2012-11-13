#! /bin/sh

checkcmd() {
	if [ $? == 0 ]
	then
		echo
		echo [ $1 $2 ] command execute successfully
		echo
	else
		echo
		echo [ $1 $2 ] command execute failed
		echo
		exit -1
	fi
	
}

# main progress

# check the parameters
parameters=$#
if [ $parameters == 2 ]
then
	default_config=$1
	dtb=$2
fi

if [ $parameters == 1 ]
then
	# check whether the parameter is configuration file
	echo $1 | grep -q "defconfig"
	if [ $? == 0 ]
	then
		default_config=$1
		echo Using [ $default_config ] to configure the Linux kernel
		echo
	fi
	
	# check whether the parameter is dtb file
	echo $1 | grep -q "dtb"
	if [ $? == 0 ]
	then
		dtb=$1
		echo Will generate [ $dtb ] file after successfully build
		echo
	fi
fi

# check whether need clean
echo Whether need to clean the source tree
echo -n " [ Y or N ] : "
read mrproper
if [ "$mrproper" == "Y" ] || [ "$mrproper" == "y" ]
then
	# clean the build tree
	make mrproper
	checkcmd make mrproper
fi

# configure the kernel

if [ -z "$1" ] & [ -z "$default_config" ]
then
	echo Using old configuration file
	echo
else
	default_config=$1
	echo make [ $default_config ] configuration
	echo
	make $default_config
	checkcmd make $default_config
fi

echo Whether need to menuconfig the source tree
echo -n " [ Y or N ] : "
read menuconfig
if [ "$m" == "Y" ] || [ "$menuconfig" == "y" ]
then
	make menuconfig
	checkcmd make menuconfig
fi

# Builid the Linux kernel
make uImage -j8 
checkcmd make uImage

cp arch/arm/boot/uImage /tftproot/bshen/
checkcmd cp arch/arm/boot/uImage

# Build the dtb file
if [ -z "$2" ] & [ -z "$dtb" ]
then
	echo Will not generate dtb file
	echo
else
	make $dtb 
	checkcmd make $dtb
	cp arch/arm/boot/$dtb /tftproot/bshen/
	checkcmd cp arch/arm/boot/$dtb
fi
