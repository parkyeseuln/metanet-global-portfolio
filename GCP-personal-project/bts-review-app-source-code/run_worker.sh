echo "Exporting GCLOUD_PROJECT"
export GCLOUD_PROJECT=$DEVSHELL_PROJECT_ID

echo "Starting worker"
python -m review.console.worker
