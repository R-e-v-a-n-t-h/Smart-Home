from pydantic import BaseModel
from datetime import date, datetime, time, timedelta


class Lamp(BaseModel):
    Id: str
    Status: bool = False
    TimerStatus: bool = False
    OnTimer: str = "00:00:00"
    OffTimer: str = "00:00:00"


def LampEntity(item) -> dict:
    return {
        "Id": item["Id"],
        "Status": item["Status"],
        "TimerStatus": item["TimerStatus"],
        "OnTimer": item["OnTimer"],
        "OffTimer": item["OffTimer"]
    }


def LampsEntity(items) -> list:
    return [LampEntity(item) for item in items]
