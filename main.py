from fastapi import FastAPI
from os import environ as env

app = FastAPI()

test_key = env['TEST_KEY']
BUILD_MODE = env['BUILD_MODE']

@app.get("/")
async def root():
    return {"message": f"Hello from your FastAPI Dev Container 😊! - {test_key} {BUILD_MODE}"}
