#!/bin/usr/bash

set -e

distro=$(cat /etc/os-release | grep -E "^ID=" | cut -d= -f2 | sed -e 's/"//g')

echo $distro
