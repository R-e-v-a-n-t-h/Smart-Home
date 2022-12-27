from pydantic import BaseModel
from datetime import date, datetime, time, timedelta


class Ac(BaseModel):
    Id: str
    Status: bool = False
    TimerStatus: bool = False
    OnTimer: str = "00:00:00"
    OffTimer: str = "00:00:00"
    Temperature: int = 24


def AcEntity(item) -> dict:
    return {
        "Id": item["Id"],
        "Status": item["Status"],
        "TimerStatus": item["TimerStatus"],
        "OnTimer": item["OnTimer"],
        "OffTimer": item["OffTimer"],
        "Temperature": item["Temperature"],
    }


def AcsEntity(items) -> list:
    return [AcEntity(item) for item in items]
