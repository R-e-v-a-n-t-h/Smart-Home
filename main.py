
from fastapi import FastAPI, Path
from typing import Optional

from fastapi import FastAPI, Path, HTTPException, Request
from fastapi.middleware.cors import CORSMiddleware

from config.database import conn


from routes.Ac import getAcStatus, getAcTimerStatus, ac
from routes.Charger import getChargerStatus, getChargerTimerStatus, ch
from routes.CoffeeMachine import getCoffeeMachineStatus, getCoffeeMachineTimerStatus, cm
from routes.Kettle import getKettleStatus, getKettleTimerStatus, kt
from routes.Lamp import getLampStatus, getLampTimerStatus, lp
from routes.Microwave import getMicrowaveStatus, getMicrowaveTimerStatus, mw
from routes.VacuumCleaner import getVacuumCleanerStatus, getVacuumCleanerTimerStatus, vc
from routes.WaterHeater import getWaterHeaterStatus, getWaterHeaterTimerStatus, wh

app = FastAPI()

origins = ['http://localhost:8000']

app.add_middleware(
    CORSMiddleware,
    allow_origins=origins,
    allow_credentials=True,
    allow_methods=["*"],
    allow_headers=["*"]
)


@app.get('/get-home')
async def getHome():

    return {
        "Home1": {
            "Hall": {"Ac": ["Ac000001"], "Charger": ["Ch000001"], "VacuumCleaner": ["Vc000001"]},
            "Kitchen": {"Kettle": ["Kt000001"], "Microwave": ["Mw000001"], "CoffeeMachine": ["Cm000001"]},
            "Bedroom": {"Ac": ["Ac000002"], "Lamp": ["Lp000001"]},
            "Inside Bathroom": {"WaterHeater": ["Wh000001"]},
            "Outside Bathroom": {"WaterHeater": ["Wh000002"]}
        }
    }


@app.get('/get-all-status')
async def getAllStatus():
    return {
        "Ac000001": [getAcStatus("Ac000001"), "0"],
        "Ch000001": [getChargerStatus("Ch000001"), "1"],
        "Vc000001": [getVacuumCleanerStatus("Vc000001"), "2"],
        "Kt000001": [getKettleStatus("Kt000001"), "3"],
        "Mw000001": [getMicrowaveStatus("Mw000001"), "4"],
        "Cm000001": [getCoffeeMachineStatus("Cm000001"), "5"],
        "Ac000002": [getAcStatus("Ac000002"), "6"],
        "Lp000001": [getLampStatus("Lp000001"), "7"],
        "Wh000001": [getWaterHeaterStatus("Wh000001"), "8"],
        "Wh000002": [getWaterHeaterStatus("Wh000002"), "9"]
    }


@app.get('/get-all-timer-status')
async def getAllTimerStatus():
    return {
        "Ac000001": getAcTimerStatus("Ac000001"),
        "Ch000001": getChargerTimerStatus("Ch000001"),
        "Vc000001": getVacuumCleanerTimerStatus("Vc000001"),
        "Kt000001": getKettleTimerStatus("Kt000001"),
        "Mw000001": getMicrowaveTimerStatus("Mw000001"),
        "Cm000001": getCoffeeMachineTimerStatus("Cm000001"),
        "Ac000002": getAcTimerStatus("Ac000002"),
        "Lp000001": getLampTimerStatus("Lp000001"),
        "Wh000001": getWaterHeaterTimerStatus("Wh000001"),
        "Wh000002": getWaterHeaterTimerStatus("Wh000002")
    }

app.include_router(ac)
app.include_router(ch)
app.include_router(vc)
app.include_router(kt)
app.include_router(mw)
app.include_router(cm)
app.include_router(lp)
app.include_router(wh)
