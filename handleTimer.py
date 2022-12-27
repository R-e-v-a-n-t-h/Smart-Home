from datetime import datetime,timedelta
import requests

def handleTimer(response: dict):
    items=response.keys()
    url="http://127.0.0.1:8000"
    finder={
        "Ac": ("/ac/details/","/ac/update/"),
        "Ch": ("/ch/details/","/ch/update/"),
        "Cm": ("/cm/details/","/cm/update/"),
        "Kt": ("/kt/details/","/kt/update/"),
        "Lp": ("/lp/details/","/lp/update/"),
        "Mw": ("/mw/details/","/mw/update/"),
        "Vc": ("/vc/details/","/vc/update/"),
        "Wh": ("/wh/details/","/wh/update/")
    }
    currentFullTime = datetime.now()

    currentTimeWithSeconds=currentFullTime.strftime("%H:%M:%S")
    print(currentTimeWithSeconds)
    currentTime = set({})
    currentTime.add((currentFullTime-timedelta(seconds=1)).strftime("%H:%M:%S"))
    currentTime.add(currentTimeWithSeconds)
    currentTime.add((currentFullTime+timedelta(seconds=1)).strftime("%H:%M:%S"))
    for item in items:
        currentItem=response[item]
        if currentItem["TimerStatus"]==True:
            if currentItem["OnTimer"] in currentTime:
                detailEndpoint=url+finder[item[0:2]][0]+item
                detail=requests.get(detailEndpoint).json()
                detail["Status"]=True
                updateEndpoint=url+finder[item[0:2]][1]+item
                requests.put(updateEndpoint,json = detail,headers = {"Content-Type": "application/json"})

            if currentItem["OffTimer"] in currentTime:
                detailEndpoint = url + finder[item[0:2]][0] + item
                detail = requests.get(detailEndpoint).json()
                detail["Status"] = False
                updateEndpoint = url + finder[item[0:2]][1] + item
                requests.put(updateEndpoint, json=detail,headers = {"Content-Type": "application/json"})

