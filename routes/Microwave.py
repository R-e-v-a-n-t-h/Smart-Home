from fastapi import APIRouter, HTTPException
from models.Microwave import Microwave, MicrowavesEntity, MicrowaveEntity
from config.database import conn


mw = APIRouter()
document = conn.SmartHome.Microwave


@mw.get('/mw/details/{id}')
async def getMicrowaveDetails(id: str):
    return MicrowaveEntity(document.find_one({"Id": id}))


@mw.get('/mw/all')
async def getAllMicrowave():
    return MicrowavesEntity(document.find())


@mw.post('/mw/create')
async def createMicrowave(item: Microwave):
    document.insert_one(dict(item))
    return MicrowavesEntity(document.find())


@mw.put('/mw/update/{id}')
async def updateMicrowave(id: str, item: Microwave):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return MicrowaveEntity(document.find_one({"Id": id}))


@mw.delete('/mw/delete/{id}')
async def deleteMicrowave(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Such item found")


def getMicrowaveStatus(id):
    return MicrowaveEntity(document.find_one({"Id": id}))["Status"]


def getMicrowaveTimerStatus(id):
    x = MicrowaveEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
