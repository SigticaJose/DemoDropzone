#!/bin/sh
# to spin up this repo as a Cloud Run service on Google Cloud
# https://cloud.google.com/sdk/gcloud/reference/run/deploy

# navigate into the app 
cd app 

# GCP project ID
PROJECTID=''

# cloud run does not allow underscores (_)
SERVICENAME=''

# cloud build on gcp
gcloud builds submit --tag gcr.io/$PROJECTID/$SERVICENAME

# deploy as cloud run service
gcloud run deploy \
$SERVICENAME \
--region us-west1 \
--concurrency 3 \
--cpu 1 \.
--memory 512Mi \
--min-instances 0 \
--max-instances 1 \
--port 8080 \
--timeout 20 \
--allow-unauthenticated \
--ingress all \
--image gcr.io/$PROJECTID/$SERVICENAME --platform managed \
--add-cloudsql-instances staging-272106:us-central1:webappdb2 \
--update-env-vars INSTANCE_CONNECTION_NAME="staging-272106:us-central1:webappdb2" 

# notice link to Cloud SQL above.
# region: somewhere in the US (so that it can seamlessly integrate with our US multi-region buckets)
# allow unauthenticated requests: yes
# Allow unauthenticated requests (so that it is publicly available on the web to anyone with the link)
# --ingress internal <------- this will only allow GCP project-internal traffic (e.g. compute instance triggering cloud run)
# region options: us-central1, us-east1, us-east4, us-west1, us-west2, us-west3, us-west4
