# Docker multi-stage build

# Stage 1
FROM cgr.dev/chainguard/python:latest-dev as dev

USER root
RUN python -m venv /venv
ENV PATH="/venv/bin:$PATH"

# Install all requirements
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt


# Stage 2
FROM cgr.dev/chainguard/python:latest

WORKDIR /cloud_run_playground

# Copy installed Python packages to the right place
COPY --from=dev /venv /venv
ENV PATH="/venv/bin:$PATH"

# Copy application code
COPY /src/*.py ./src/

ENTRYPOINT ["python3", "./src/main.py"]
