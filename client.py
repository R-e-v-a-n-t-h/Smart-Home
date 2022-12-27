import requests
import serial
import serial.tools.list_ports
import time
from handleTimer import handleTimer


def handleStatus(response: dict):
    items = response.keys()
    itemsStr = ""
    statusStr = ""
    for item in items:
        if response[item][0]:
            statusStr += "1"
        else:
            statusStr += "0"
        itemsStr += response[item][1]
    return itemsStr, statusStr


statusAPI = "http://127.0.0.1:8000/get-all-status"
timerStatusAPI = "http://127.0.0.1:8000/get-all-timer-status"

serialInst = serial.Serial()
portVar = "COM3"
serialInst.baudrate = 9600
serialInst.port = portVar
serialInst.open()

while True:
    timerStatusResponse = requests.get(timerStatusAPI).json()
    statusResponse = requests.get(statusAPI).json()
    handleTimer(timerStatusResponse)
    items, status = handleStatus(statusResponse)

    command = items+"|"+status

    serialInst.write(command.encode("utf-8"))
    print(command)

    time.sleep(1)
