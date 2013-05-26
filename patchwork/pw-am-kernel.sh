#!/bin/bash - 
#===============================================================================
#
#          FILE:  pw-am.sh
# 
#         USAGE:  ./pw-am-kernel.sh 
# 
#   DESCRIPTION:  fetch an 'mbox' patch from patchwork and git am it
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR: YOUR NAME (), 
#       COMPANY: 
#       CREATED: 05/21/2013 11:26:16 AM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#!/bin/sh
#
# Idea and implementation:  Koen Kooi
# Multiple patches support: Marcin Juszkiewicz
#
# This script will fetch an 'mbox' patch from patchwork and git am it
# usage: pw-am.sh <number>
# example: 'pw-am.sh 221' will get the patch from http://patchwork.openembedded.org/patch/221/

for patchnumber in $@;
do
	wget -nv https://patchwork.kernel.org/patch/$patchnumber/mbox/ -O pw-am-kernel-$patchnumber.patch
	git am -s pw-am-kenrel-$patchnumber.patch
	rm pw-am-kernel-$patchnumber.patch
done
