FROM python:3.13-slim

# Create a new user
USER root
RUN useradd -m -d /home/cloud_run_user -s /bin/bash -u 1001 cloud_run_user

RUN pip install --upgrade pip

# Switch user to newly created user
USER cloud_run_user

WORKDIR /cloud_run_playground

# Install all requirements
COPY requirements.txt /cloud_run_playground
RUN pip install --user --no-cache-dir -r /cloud_run_playground/requirements.txt > /dev/null

# Copy over scripts
COPY /src/*.py /cloud_run_playground/src/
COPY /entrypoint.sh /entrypoint.sh

ENV PYTHONPATH="/cloud_run_playground"
ENV PYTHONPATH="/home/cloud_run_user/.local/lib/python3.13/site-packages:$PYTHONPATH"

ENTRYPOINT ["/entrypoint.sh"]