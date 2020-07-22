#!/bin/bash

# Print content of a directory
echo "Content of directory /app inside the container"
ls -lah /app

printf "\n==================\n"

# Check if a package is installed
echo "Checking whether package wget is installed"
apt-cache search wget

printf "\n==================\n"

# Print value of an environment variable
echo "The value of \$NAME is [${NAME}]"
