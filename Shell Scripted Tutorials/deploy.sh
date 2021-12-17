#!/usr/bin/bash

# Load the variables
source helpers.sh

SSH_CMD="ssh -i ${SSH_KEY_FILE} -p ${SSH_PORT} ${SSH_USER}@${TARGET} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
SCP_CMD="scp -i ${SSH_KEY_FILE} -P ${SSH_PORT} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null"
SCP_DEST="${SSH_USER}@${TARGET}:"

function provision_application {
    # BELOW ARE JUST SUGGESTIONS. YOU SHOULD THINK ABOUT YOUR DEPLOYMENT STRATEGY AND ADJUST THE SCRIPTS ACCORDINGLY!

    # Copy the setup scripts to the target
    $SCP_CMD deploy_backend.sh $SCP_DEST
    $SCP_CMD deploy_frontend.sh $SCP_DEST	

    # Copy all the files in the files folder to the target
    $SCP_CMD -r files/ $SCP_DEST

    # Run it
    $SSH_CMD bash deploy_backend.sh
    $SSH_CMD bash deploy_frontend.sh

}

provision_application
