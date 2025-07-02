from pydantic import BaseModel

class PasswordRequest(BaseModel):
    password: str

class PasswordResponse(BaseModel):
    score: int
    weaknesses: list[str]
    suggestions: list[str]
    breached: bool
