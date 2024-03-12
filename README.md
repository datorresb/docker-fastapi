
# Mini tutorial: FastAPI with Docker & Cloud Run

    This guide sets up your FastAPI project for local development, Docker Compose deployment, and Cloud Run.
    https://www.youtube.com/watch?v=CzAyaSolZjY

## Prerequisites

    * Docker (https://docs.docker.com/engine/install/)
    * Docker Compose (https://docs.docker.com/compose/install/)
    * Google Cloud project with Cloud Run enabled (https://cloud.google.com/run)

# Running Locally

**Specific Config:** `docker-compose -f docker-compose.[env_name].yaml up --build`  (Replace [env_name] with environment name)
Ex.
    ```
    docker compose up
    docker compose -f docker-compose.development.yaml up --build
    docker compose -f docker-compose.staging.yaml up --build
    docker compose -f docker-compose.production.yaml up --build -d
    ```

# Cloud Run

0. Edit your Dockerfile and add this line at the end:
    `CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]`
1. Build the image into the container registry (`docker login`):
    `docker build -t REPO/name-project:TAG .`
    Example:
    `docker build -t datorresb/docker-fastapi:1.0.0 .`
2. Push the image to Container Registry:
    `docker push REPO/name-project:TAG .`
    Example:
    `docker push datorresb/docker-fastapi:1.0.0 .`
3. Navigate to the Cloud Run console: <https://cloud.google.com/run>
    Provide the image URL from step 2.
    Choose a unique name, region, and authentication settings (often unauthenticated).
    Keep port 8000 (unless modified in FastAPI).
    Click "Create" to deploy.
    Or
    `gcloud run deploy name-project --image=REPO/name-project:TAG --platform managed --allow-unauthenticated`
