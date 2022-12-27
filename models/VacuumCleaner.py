from pydantic import BaseModel
from datetime import date, datetime, time, timedelta


class VacuumCleaner(BaseModel):
    Id: str
    Status: bool = False
    TimerStatus: bool = False
    OnTimer: str = "00:00:00"
    OffTimer: str = "00:00:00"


def VacuumCleanerEntity(item) -> dict:
    return {
        "Id": item["Id"],
        "Status": item["Status"],
        "TimerStatus": item["TimerStatus"],
        "OnTimer": item["OnTimer"],
        "OffTimer": item["OffTimer"]
    }


def VacuumCleanersEntity(items) -> list:
    return [VacuumCleanerEntity(item) for item in items]
