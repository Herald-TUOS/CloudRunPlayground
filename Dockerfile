# Docker multi-stage build

# Stage 1
FROM cgr.dev/chainguard/python:latest-dev as dev
WORKDIR /install

# Install all requirements
COPY requirements.txt .
RUN pip install --upgrade pip && pip install --no-cache-dir -r requirements.txt --target=/install


# Stage 2
FROM cgr.dev/chainguard/python:latest

# FROM python:3.13-slim AS runner
WORKDIR /cloud_run_playground

# Copy installed Python packages to the right place
COPY --from=dev /install /install

# Copy application code
COPY /src/*.py ./src/

ENV PYTHONPATH=/install
ENTRYPOINT ["python3", "./src/main.py"]