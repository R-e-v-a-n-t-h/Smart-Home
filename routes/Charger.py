from fastapi import APIRouter, HTTPException
from models.Charger import Charger, ChargersEntity, ChargerEntity
from config.database import conn


ch = APIRouter()
document = conn.SmartHome.Charger


@ch.get('/ch/details/{id}')
async def getChargerDetails(id: str):
    return ChargerEntity(document.find_one({"Id": id}))


@ch.get('/ch/all')
async def getAllCharger():
    return ChargersEntity(document.find())


@ch.post('/ch/create')
async def createCharger(item: Charger):
    document.insert_one(dict(item))
    return ChargersEntity(document.find())


@ch.put('/ch/update/{id}')
async def updateCharger(id: str, item: Charger):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return ChargerEntity(document.find_one({"Id": id}))


@ch.delete('/ch/delete/{id}')
async def deleteCharger(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Such item found")


def getChargerStatus(id):
    return ChargerEntity(document.find_one({"Id": id}))["Status"]


def getChargerTimerStatus(id):
    x = ChargerEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
