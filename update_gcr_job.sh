echo "Updating cloudrunplayground on GCR"

ARGS=(
        # use this service account to run this job
        --service-account=sa-cloudrunplayground@pvlive.iam.gserviceaccount.com
        # Change this image to make new release
        --image=europe-west2-docker.pkg.dev/pvlive/cloudrunplayground-dockerhub/sheffieldsolar/cloud_run_playground:20251021
        # change secrets version here!
        --update-secrets=/configs/config.yaml=cloudrunplayground_config_yml:1
        --update-secrets=/secrets/secrets.yaml=cloudrunplayground_secrets_yml:1
)

CMD="gcloud run jobs update cloudrunplayground"
echo ${CMD}  ${ARGS[@]} 
read -p "Do you want to proceed? (y/N) " yn
case $yn in 
    yes|y|Y ) ${CMD}  ${ARGS[@]} ;;
esac
