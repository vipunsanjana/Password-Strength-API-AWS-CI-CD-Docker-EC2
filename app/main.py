from fastapi import FastAPI
from app.schemas import PasswordRequest, PasswordResponse
from app.utils import analyze_password, check_breach
import uvicorn

app = FastAPI(title="Password Strength Analyzer")

@app.post("/analyze", response_model=PasswordResponse)
async def analyze(data: PasswordRequest):
    score, weaknesses, suggestions = analyze_password(data.password)
    breached = await check_breach(data.password)
    return PasswordResponse(
        score=score,
        weaknesses=weaknesses,
        suggestions=suggestions,
        breached=breached
    )

if __name__ == "__main__":
    uvicorn.run("app.main:app", host="0.0.0.0", port=8000, reload=True)
