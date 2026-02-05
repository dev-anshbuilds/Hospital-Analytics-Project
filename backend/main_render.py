from fastapi import FastAPI

app = FastAPI(title="Hospital Analytics API")

@app.get("/")
def home():
    return {"message": "Hospital Analytics API is live"}

@app.get("/health")
def health():
    return {"status": "OK"}

@app.get("/info")
def info():
    return {
        "project": "Hospital Analytics Dashboard",
        "status": "Backend deployed successfully",
        "note": "Full database-backed APIs are demonstrated locally and in the demo video"
    }
