#!/bin/bash
set -e

# Set up secrets and configs
mkdir -p /cloud_run_playground/configs
cp /configs/config.yaml /cloud_run_playground/configs/config.yaml
cp /secrets/secrets.yaml /cloud_run_playground/configs/secrets.yaml

exec python /cloud_run_playground/src/main.py