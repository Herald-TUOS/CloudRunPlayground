echo "Deploying cloudrunplayground to GCR"

ARGS=(
	# use this service account to run this job
	--service-account=sa-cloudrunplayground@pvlive.iam.gserviceaccount.com
	# uset this image
	--image=europe-west2-docker.pkg.dev/pvlive/cloud-run-source-deploy/cloud_run_playground:20251021
	# volume mount these secrets
	--set-secrets=/configs/config.yaml=cloudrunplayground_config_yml:1
	--set-secrets=/secrets/secrets.yaml=cloudrunplayground_secrets_yml:1
)

CMD="gcloud run jobs create cloudrunplayground"
echo ${CMD}  ${ARGS[@]} 
read -p "Do you want to proceed? (y/N) " yn
case $yn in 
    yes|y|Y ) ${CMD}  ${ARGS[@]} ;;
esac
