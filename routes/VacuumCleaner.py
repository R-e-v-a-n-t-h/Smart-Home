from fastapi import APIRouter, HTTPException
from models.VacuumCleaner import VacuumCleaner, VacuumCleanersEntity, VacuumCleanerEntity
from config.database import conn


vc = APIRouter()
document = conn.SmartHome.VacuumCleaner


@vc.get('/vc/details/{id}')
async def getVacuumCleanerDetails(id: str):
    return VacuumCleanerEntity(document.find_one({"Id": id}))


@vc.get('/vc/all')
async def getAllVacuumCleaner():
    return VacuumCleanersEntity(document.find())


@vc.post('/vc/create')
async def createVacuumCleaner(item: VacuumCleaner):
    document.insert_one(dict(item))
    return VacuumCleanersEntity(document.find())


@vc.put('/vc/update/{id}')
async def updateVacuumCleaner(id: str, item: VacuumCleaner):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return VacuumCleanerEntity(document.find_one({"Id": id}))


@vc.delete('/vc/delete/{id}')
async def deleteVacuumCleaner(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Sulp item found")


def getVacuumCleanerStatus(id):
    return VacuumCleanerEntity(document.find_one({"Id": id}))["Status"]


def getVacuumCleanerTimerStatus(id):
    x = VacuumCleanerEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
