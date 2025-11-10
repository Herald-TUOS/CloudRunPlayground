# CloudRunPlayground
A small script for testing set up on GCP Cloud Run

To run the docker image, volume mount the configs directory:
`docker run --rm -it -v ./configs/config.yaml:/cloud_run_playground/configs/config.yaml -v ./configs/secrets.yaml:/cloud_run_playground/configs/secrets.yaml --add-host host.docker.internal:host-gateway sheffieldsolar/cloud_run_playground:20251110`
