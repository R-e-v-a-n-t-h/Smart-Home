from fastapi import APIRouter, HTTPException
from models.WaterHeater import WaterHeater, WaterHeatersEntity, WaterHeaterEntity
from config.database import conn


wh = APIRouter()
document = conn.SmartHome.WaterHeater


@wh.get('/wh/details/{id}')
async def getWaterHeaterDetails(id: str):
    return WaterHeaterEntity(document.find_one({"Id": id}))


@wh.get('/wh/all')
async def getAllWaterHeater():
    return WaterHeatersEntity(document.find())


@wh.post('/wh/create')
async def createWaterHeater(item: WaterHeater):
    document.insert_one(dict(item))
    return WaterHeatersEntity(document.find())


@wh.put('/wh/update/{id}')
async def updateWaterHeater(id: str, item: WaterHeater):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return WaterHeaterEntity(document.find_one({"Id": id}))


@wh.delete('/wh/delete/{id}')
async def deleteWaterHeater(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Sulp item found")


def getWaterHeaterStatus(id):
    return WaterHeaterEntity(document.find_one({"Id": id}))["Status"]


def getWaterHeaterTimerStatus(id):
    x = WaterHeaterEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
