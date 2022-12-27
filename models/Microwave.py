from pydantic import BaseModel
from datetime import date, datetime, time, timedelta


class Microwave(BaseModel):
    Id: str
    Status: bool = False
    TimerStatus: bool = False
    OnTimer: str = "00:00:00"
    OffTimer: str = "00:00:00"


def MicrowaveEntity(item) -> dict:
    return {
        "Id": item["Id"],
        "Status": item["Status"],
        "TimerStatus": item["TimerStatus"],
        "OnTimer": item["OnTimer"],
        "OffTimer": item["OffTimer"]
    }


def MicrowavesEntity(items) -> list:
    return [MicrowaveEntity(item) for item in items]
