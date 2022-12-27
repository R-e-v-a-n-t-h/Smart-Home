from fastapi import APIRouter, HTTPException
from models.Kettle import Kettle, KettlesEntity, KettleEntity
from config.database import conn


kt = APIRouter()
document = conn.SmartHome.Kettle


@kt.get('/kt/details/{id}')
async def getKettleDetails(id: str):
    return KettleEntity(document.find_one({"Id": id}))


@kt.get('/kt/all')
async def getAllKettle():
    return KettlesEntity(document.find())


@kt.post('/kt/create')
async def createKettle(item: Kettle):
    document.insert_one(dict(item))
    return KettlesEntity(document.find())


@kt.put('/kt/update/{id}')
async def updateKettle(id: str, item: Kettle):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return KettleEntity(document.find_one({"Id": id}))


@kt.delete('/kt/delete/{id}')
async def deleteKettle(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Such item found")


def getKettleStatus(id):
    return KettleEntity(document.find_one({"Id": id}))["Status"]


def getKettleTimerStatus(id):
    x = KettleEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
