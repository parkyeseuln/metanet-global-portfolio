#!/bin/bash

echo "Exporting GCLOUD_PROJECT"
export GCLOUD_PROJECT=$DEVSHELL_PROJECT_ID

echo "Installing Python libraries"
pip install --upgrade pip
pip install -r requirements.txt

echo "Authorizing conatiner with SA"
gcloud auth activate-service-account container-sa@custom-rampart-336907.iam.gserviceaccount.com \
--key-file='./key.json' --project=$DEVSHELL_PROJECT_ID
export GOOGLE_APPLICATION_CREDENTIALS="/home/zzzz67239/bts_review_app_source_code/key.json"

echo "Creating Cloud Pub/Sub topics"
gcloud pubsub topics create review --project custom-rampart-336907
gcloud pubsub subscriptions create worker-subscription --topic review1 --project custom-rampart-336907

echo "Creating Cloud Spanner Instance, Database, and Table"
gcloud spanner instances create review-instance --config=regional-asia-northeast3 --description="review instance" --nodes=1 --project custom-rampart-336907
gcloud spanner databases create review-database --instance review-instance --project custom-rampart-336907 --ddl "CREATE TABLE review ( reviewId STRING(100) NOT NULL, review STRING(MAX), rating INT64, score FLOAT64, timestamp INT64 ) PRIMARY KEY (reviewId);"

echo "Project ID: $DEVSHELL_PROJECT_ID"