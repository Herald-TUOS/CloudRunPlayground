# CloudRunPlayground
A small script for testing set up on GCP Cloud Run

To run the docker image, volume mount the configs directory:
`docker run --rm -v ./configs:/cloud_run_playground/configs sheffieldsolar/cloud_run_playground`