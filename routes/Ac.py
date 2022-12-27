from fastapi import APIRouter, HTTPException
from models.Ac import Ac, AcsEntity, AcEntity
from config.database import conn


ac = APIRouter()
document = conn.SmartHome.Ac


@ac.get('/ac/details/{id}')
async def getAcDetails(id: str):
    return AcEntity(document.find_one({"Id": id}))


@ac.get('/ac/all')
async def getAllAc():
    return AcsEntity(document.find())


@ac.post('/ac/create')
async def createAc(item: Ac):
    document.insert_one(dict(item))
    return AcsEntity(document.find())


@ac.put('/ac/update/{id}')
async def updateAc(id: str, item: Ac):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return AcEntity(document.find_one({"Id": id}))


@ac.delete('/ac/delete/{id}')
async def deleteAc(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Such item found")


def getAcStatus(id):
    return AcEntity(document.find_one({"Id": id}))["Status"]


def getAcTimerStatus(id):
    x = AcEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
