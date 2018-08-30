#!/bin/bash

# List of programs that get aliased by default.
ALIASPROGRAMS=(apt-get bash sh nano emacs vi vim passwd cd cat ls zsh rbash csh exit sudo su head tail ssh wget curl python perl kill echo env mv grep cp set export ruby irb lua pico git zip apt expect mutt php scp gdb more less man find tee grep ps netstat nc ftp iptables telnet sed awk whoami rm rmdir command alias)

# Create the kiosk user in group www-data with rbash shell
echo "We are going to create a Kiosk user for you!"
useradd -G www-data -m -s /bin/rbash kiosk

# Alias most commands/programs so kiosk user cannot escape the restricted shell
echo "!!!! Warning !!!!" 
echo "Giving the kiosk user access to commands or programs may allow the user to escape the restricted shell and do other malicious things."; echo
echo "Please enter a list of commands/programs that the kiosk user should have access to separated by commas and a space (i.e. vim, nano, less): "; read PROGRAMLIST

# Reads the PROGRAMLIST input from user and splits the string into an array.
IFS=', ' read -r -a PROGRAMARRAY <<< $PROGRAMLIST

# Iterate through the ALIASPROGRAMS array (default programs to be aliased), See if there the command/program is in the user input.
# If so then skip the program so the user has access. Otherwise alias the command/program.
for program in "${ALIASPROGRAMS[@]}"; do
	if [[ "${PROGRAMARRAY[@]}" =~ "${program}" ]]; then
		echo "Skipping $program.."
		continue
	else
		echo "$program will be aliased."
		echo alias $program=\'$program: command not found\' >> /home/kiosk/.bash_aliases
	fi
done
