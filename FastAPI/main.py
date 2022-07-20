from anyio import current_time
from fastapi import FastAPI
from pydantic import BaseModel
import requests

app = FastAPI()

db = []

class City(BaseModel):
    name: str
    timezone: str

# 폴더에서 나라 이름을 읽어온다
@app.get("/")
def root():
    return {"message":"World"}

@app.get('/cities')
def get_cities():
    results = []
    for city in db:
        strs = f"http://worldtimeapi.org/api/timezone/{city['timezone']}"
        print(str)
        r = requests.get(strs)
        cur_time = r.json()['datetime']
        results.append({'name':city['name']}, {'timezone':city['timezone']}, {'current_time':cur_time})

    return results

@app.get('/cities/{city_id}')
def det_city(city_id: int):
    city = db[city_id-1]
    r = requests.get(f"http://worldtimeapi.org/api/timezone/{city['timezone']}")
    cur_time = r.json()['datetime']
    return { 'name':city['name'], 'timezone':city['timezone'], 'current_time':cur_time }


@app.post('/cities')
def create_city(city: City):
    db.append(city.dict())
    
    return db[-1]


@app.delete('/cities/{city_id}')
def delete_city(city_id: int):
    db.pop(city_id-1)

    return {}