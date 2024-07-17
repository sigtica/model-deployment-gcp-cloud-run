#!/bin/sh

# to spin up this repo as a Cloud Run service on Google Cloud
# https://cloud.google.com/sdk/gcloud/reference/run/deploy

# region: please see GCP for a full list of regions supported by Cloud Run

# if the flag for "allow unauthenticated" is present, then unauthenticated requests are allowed
# i.e., Allow unauthenticated requests (so that it is publicly available on the web to anyone with the link)

# --ingress internal <------- this will only allow GCP project-internal traffic (e.g. compute instance triggering cloud run)
# region options: us-central1, us-east1, us-east4, us-west1, us-west2, us-west3, us-west4


######################################
# navigate into the app 
cd app 

# GCP project ID
PROJECTID=''

# NOTE: cloud run does not allow underscores (_)
SERVICENAME=''

# cloud sql instance name, if applicable
CLOUDSQLINSTANCE=''

# cloud build on gcp
gcloud builds submit --tag "gcr.io/$PROJECTID/$SERVICENAME"

# deploy as cloud run service
gcloud run deploy \
$SERVICENAME \
--region us-west1 \
--concurrency 100 \
--cpu 4 \
--memory 16G \
--min-instances 0 \
--max-instances 2 \
--port 8080 \
--timeout 3600 \
--allow-unauthenticated \
--ingress all \
--image gcr.io/$PROJECTID/$SERVICENAME --platform managed \
--add-cloudsql-instances $CLOUDSQLINSTANCE \
--update-env-vars INSTANCE_CONNECTION_NAME="$CLOUDSQLINSTANCE" 

# done
echo "Cloud Run deployed."

