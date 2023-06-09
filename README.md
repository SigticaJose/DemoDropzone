# Placeholder

This is a placeholder flask app for Cloud Run to establish the link given by Cloud Run and also for easy custom domain mapping (so that you have a placeholder custom mapped link ahead of time while developing the real service).

## Setup 

Step 1: git clone this repo to Cloud Shell.

Step 2: navigate into the folder and type `bash cloud_build.sh`. This will spin up a cloud run service.
Please make sure PROJECTID and SERVICENAME are filled out in `cloud_build.sh` before proceeding.

## Content

The content of the placeholder flask app simply says "placeholder" on the front page.
