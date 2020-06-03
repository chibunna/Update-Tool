#!/bin/bash

#For the mysterious funck master Chibunna
#Personal Macbook Pro System Update and Cleanup Tool, version 1.0.1
#Copyright (C) 2019 Chibunna.

#This is free software; you are free to change and redistribute it.
#There is NO WARRANTY, to the extent permitted by law.

#Run with sudo

#Exit the update utility on error
set -e

#Variables
phrase_self="me?"

#Defining functions
#Using softwareupdate utility to download and load updates

update(){
	echo "[+] Preparing to update and restart the system"
	read -s -p "Please enter secret phrase to continue " phrase
	if [[ $phrase == phrase_self ]]; then
	read -p "Are you sure you want to continue? [Y/*] " sure
	if [[ $sure == "y" || $sure == "Y" || $sure == "yes" || $sure == "Yes" || $sure == "YES" ]]; then
		echo
		softwareupdate --list
		#softwareupdate --download
		#softwareupdate --install --all
	else
		echo "[+] Exiting the program"
		sleep 2
		echo "Goodbye"
		exit 0
	fi
fi
}

cleanup(){
	echo "[+] Removing old Homebrew Packges & Formulas"
	brew cleanup -s
	echo "[+] Flushing DNS cache"
	sudo dscacheutil -flushcache
	exit 0
}

updatecleanup(){
	echo "Updating and cleaning up the system"
	sudo softwareupdate -di
	brew cleanup -s
	sleep 2

	exit 0
}

help(){
	# Display Help
	echo
	echo "For the mysterious funck master Chibunna."
	echo "Macbook Pro System Update and Cleanup Tool, version 1.0.1."
	echo "Copyright (C) 2019 Chibunna."

	echo "This is free software; you are free to change and redistribute it."
	echo "There is NO WARRANTY, to the extent permitted by law."

	echo
	echo "Syntax: case [1|2|3|5]"
	echo "options:"
	echo "1  Updates, cleans up and restarts the system."
	echo "2  Removes old Homebrew packages and formulas, flushes DNS cache"
	echo "3  Performs the update and cleanup function"
	#echo "2	Removes old Homebrew packages and formulas, flushes DNS cache"
	#echo "3	Performs the update and cleanup function "
	echo "4  Print this Help."
	echo "5  Quit the program"
	#echo "V     Print software version and exit." --feature for version 1.1
	echo


}

quit(){
	echo "[+] Exiting the program"
	sleep 2
	echo Goodbye
	exit
}

#Code execution starts here

#Ask the user to select an option.
#Future update to this tool should allow the use to either enter a number or the full word
#Chibunna take care of the above on or before 12/08/20

echo "Choose an action to perform: "
echo "1. Update"
echo "2. Cleanup"
echo "3. Update & Cleanup"
echo "4. Help"
echo "5. Quit"
echo ""
read action

#Uncomment the line below if you would like to use a select statement -- chibunna
#actions=("Update" "Cleanup" "Update & Cleanup" "Help" "Quit")

case $action in
			1)
				update
				;;

			2)
				cleanup
				;;

			3)
				updatecleanup
				;;

			4)
				help
				;;

			5)
	      quit
				;;
			*)
				echo "Invalid Option. Please Try Again"
				;;
esac


#update(){
#	echo "Are you sure you want to update & restart the system?"
#	select yn in  "Yes" "No"; do #"y" "Y" "yes"
#		case $yn in
#			Yes)
#				echo "[+] Preparing to Update & Restart the System"
#				sleep 3
#				sudo softwareupdate -d
#	      sudo softwareupdate -i
#				;;
#			No)
#				exit ;;
#		esac
#	done
#}
