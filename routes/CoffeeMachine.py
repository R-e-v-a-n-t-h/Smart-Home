from fastapi import APIRouter, HTTPException
from models.CoffeeMachine import CoffeeMachine, CoffeeMachinesEntity, CoffeeMachineEntity
from config.database import conn


cm = APIRouter()
document = conn.SmartHome.CoffeeMachine


@cm.get('/cm/details/{id}')
async def getCoffeeMachineDetails(id: str):
    return CoffeeMachineEntity(document.find_one({"Id": id}))


@cm.get('/cm/all')
async def getAllCoffeeMachine():
    return CoffeeMachinesEntity(document.find())


@cm.post('/cm/create')
async def createCoffeeMachine(item: CoffeeMachine):
    document.insert_one(dict(item))
    return CoffeeMachinesEntity(document.find())


@cm.put('/cm/update/{id}')
async def updateCoffeeMachine(id: str, item: CoffeeMachine):
    item.Id = id
    document.update_one({"Id": id}, {"$set": dict(item)})
    return CoffeeMachineEntity(document.find_one({"Id": id}))


@cm.delete('/cm/delete/{id}')
async def deleteCoffeeMachine(id: str):
    response = document.delete_one({"Id": id})
    if response:
        return "Successfully deleted item Id: {id}"
    raise HTTPException(404, "No Such item found")


def getCoffeeMachineStatus(id):
    return CoffeeMachineEntity(document.find_one({"Id": id}))["Status"]


def getCoffeeMachineTimerStatus(id):
    x = CoffeeMachineEntity(document.find_one({"Id": id}))
    return {"TimerStatus": x["TimerStatus"], "OnTimer": x["OnTimer"], "OffTimer": x["OffTimer"]}
