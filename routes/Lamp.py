from fastapi import APIRouter, HTTPException
from models.Lamp import Lamp, LampsEntity, LampEntity
from config.database import conn


lp = APIRouter()
document = conn.SmartHome.Lamp


@lp.get('/lp/details/{id}')
async def getLampDetails(id: str):
    return LampEntity(document.find_one({"Id": id}))


@lp.get('/lp/all')
async def getAllLamp():
    return LampsEntity(document.find())


@lp.post('/lp/create')
async def createLamp(item: Lamp):
    document.insert_one(dict(item))
    return LampsEntity(document.find())


@lp.put('/lp/update/{id}')
async def updateLamp(id: str, item: Lamp):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return LampEntity(document.find_one({"Id": id}))


@lp.delete('/lp/delete/{id}')
async def deleteLamp(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Sulp item found")


def getLampStatus(id):
    return LampEntity(document.find_one({"Id": id}))["Status"]


def getLampTimerStatus(id):
    x = LampEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
