# Model Deployment Using GCP Cloud Run

This is the module for model deployment to Cloud Run on the Google Cloud Platform using the Gunicorn framework with support for multi-threading.

This repo consists of a Dockerfile using a base image of `python:3.8` (please alter for your own use case) and runs a Flask app wrapped in Gunicorn with multi-threading capabilities (rather than eventlet), as [recommended by GCP](https://cloud.google.com/run/docs/tips/python#optimize_gunicorn). This makes it easy for models to be wrapped and served in a container running Gunicorn that returns model predictions in JSON format.


## Getting started

To get started, simply copy the repo to GCP Cloud Shell or somewhere else where you have the gcloud SDK installed. After cloning this repo, make sure you tweak the content in the `start.sh` file with the proper parameters for your use case. Specifically, make sure you specify parameter values for:
- `PROJECTID`
- `SERVICENAME`
- `CLOUDSQLINSTANCE` (if applicable)

If you do not know the values for these parameters, it is best to leave them as an empty string.

Once done, then in shell, simply type:
```shell
bash start.sh
```
to both build the image and to deploy the service on GCP Cloud Run.


## Support 

This template uses Google Cloud Platform's [Cloud Build](https://cloud.google.com/build/docs) and [Cloud Run](https://cloud.google.com/run/docs/deploying) features. Please see GCP's documentation for more details. 

