#!/bin/bash

################
# Source utils #
################
source ./utils.sh

########################
# Function definitions #
########################

# Sequential steps
# 1) Fetches latest manifest timestamp and checks for validity
# 2) Executes manifest shell file with same name
function sequential {
  manifest=$(head -n1 ./.manifest)
  manifest_path="./manifests/$manifest.sh"

  # Ensure the manifest is valid
  if [ -z "$manifest" ] && [ ! -d "$manifest_path" ]; then
    cecho $RED "Invalid manifest file and/or manifest path did not resolve!"
    cecho $YELLOW "Manifest string: '$manifest'"
    cecho $YELLOW "Manifest path: '$manifest_path'"
    exit 1
  fi    

  cecho $GREEN "There is a newer manifest, updating..."
  echo "Running the following manifest file: " $manifest
  /bin/bash $manifest_path
}


# No operation; executed when there are no updates
function nop {
  cecho $GREEN "There is no updates, environment upto date!"
  exit 0
}


###############
# Main Script #
###############
echo "Executing Bootstrap script..."

# Check if current manifest exists
if [ ! -f ./.manifest_current ]; then
  cecho $YELLOW "Running initial script and stamping manifest..."
  /bin/bash ./initial.sh
  cp ./.manifest ./.manifest_current
fi

## Check if there is a manifest update
#echo "Cloning remote..."
#git pull --rebase

if ! cmp -s .manifest .manifest_current;
then
  # Differ
  sequential
else
  nop      
fi
echo "Have a good day..."
exit 0;
