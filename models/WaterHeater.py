from pydantic import BaseModel
from datetime import date, datetime, time, timedelta


class WaterHeater(BaseModel):
    Id: str
    Status: bool = False
    TimerStatus: bool = False
    OnTimer: str = "00:00:00"
    OffTimer: str = "00:00:00"


def WaterHeaterEntity(item) -> dict:
    return {
        "Id": item["Id"],
        "Status": item["Status"],
        "TimerStatus": item["TimerStatus"],
        "OnTimer": item["OnTimer"],
        "OffTimer": item["OffTimer"]
    }


def WaterHeatersEntity(items) -> list:
    return [WaterHeaterEntity(item) for item in items]
