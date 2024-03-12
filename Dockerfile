FROM python:3.10-slim-bullseye

WORKDIR /app

COPY . /app

RUN pip install -r requirements.txt

ARG BUILD_MODE

# Conditional logic based on BUILD_MODE
RUN if [[ "$BUILD_MODE" == "production" ]]; then \
    echo "Building for production"; \
    CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"] \
else \
    echo "Building for ${BUILD_MODE}"; \
fi

