REPO_NAME=$1
BRANCH_NAME=$2

COMMAND_EXTENSION='--set-env-vars USE_TARGET_PARAM=true,ACTIVE_PROFILE=Test'
REPO2=${REPO_NAME,,}
BRANCH2=${BRANCH_NAME,,}

echo "deploying into CLOUD RUN"

gcloud run deploy $REPO2-$BRANCH2 --image gcr.io/nextjsproject-7b9be/$REPO2-$BRANCH2  $COMMAND_EXTENSION --region=us-central1  --allow-unauthenticated

gcloud beta run services add-iam-policy-binding --region=us-central1 --member=allUsers --role=roles/run.invoker $REPO2-$BRANCH2
