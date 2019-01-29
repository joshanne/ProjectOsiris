#!/bin/bash

PROFILE_SCRIPT_DIR=~/.profile_scripts        # Set the profile script directory
FILE=$PROFILE_SCRIPT_DIR/00-MainSource.sh  # Set the master source file

mkdir -p $PROFILE_SCRIPT_DIR               # Create the directory to hold the scripts

echo "#!/bin/sh" > $FILE                   # Start by creating as a shell script
echo "" >> $FILE                           # Add blank line

# In a loop, over all the installable scripts do...
for filename in ./InstallShellScripts/*.sh; do
    # Echo the name of the script
	echo "Copying script: " $(basename $filename)

	# Configure the BASENAME and the LINE which will be added to the master source file
	BASENAME=$(basename $filename)
	LINE='source '$PROFILE_SCRIPT_DIR'/'$BASENAME

    # Copy the script to the scripts directory
	cp ${filename} ${PROFILE_SCRIPT_DIR}/
	# Grep the master source file checking if the base script already exists
	# If the line does not exist, add the script name to the master source
	grep -qF -- "$LINE" "$FILE" || echo "$LINE" >> "$FILE"
done

cr=`echo $'\n.'`
cr=${cr%.}

echo ""
echo ""
read -n 1 -s -r -p "Press any key to continue $cr"
