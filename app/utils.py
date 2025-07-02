import httpx
from zxcvbn import zxcvbn
import hashlib

HIBP_API = "https://api.pwnedpasswords.com/range/"

def analyze_password(password: str):
    analysis = zxcvbn(password)
    score = analysis['score']
    feedback = analysis.get('feedback', {})
    weaknesses = feedback.get('warning', [])
    suggestions = feedback.get('suggestions', [])
    if isinstance(weaknesses, str):
        weaknesses = [weaknesses]
    return score, weaknesses, suggestions

async def check_breach(password: str):
    sha1 = hashlib.sha1(password.encode('utf-8')).hexdigest().upper()
    prefix, suffix = sha1[:5], sha1[5:]
    async with httpx.AsyncClient() as client:
        response = await client.get(HIBP_API + prefix)
    for line in response.text.splitlines():
        hash_suffix, count = line.split(":")
        if hash_suffix == suffix:
            return True
    return False
