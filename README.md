# CloudRunPlayground
A small script for testing set up on GCP Cloud Run

To run the docker image, volume mount the configs directory:
`docker run --rm -v ./configs/config.yaml:/configs/config.yaml -v ./configs/secrets.yaml:/secrets/secrets.yaml --add-host host.docker.internal:host-gateway sheffieldsolar/cloud_run_playground:20251025`
