#!/usr/bin/env python3

import finnhub
import os
import time
from dotenv import load_dotenv

load_dotenv()

STOCK = "NIO"
g = open("/home/pi/stockpi/stockprice2.txt","r")
old_price = float(g.read())
g.close()
t = 0
# Setup of the Finnhub
configuration = finnhub.Configuration(
    api_key={
        'token': os.getenv("FINNHUB_TOKEN")
    })

# Finnhub client
finnhub_client = finnhub.DefaultApi(finnhub.ApiClient(configuration))




stockName = STOCK

if t < 1:
    time.sleep(1)
    t = t + 1

while True:
    # Fetches Stock Data
    stockData = finnhub_client.quote(stockName)
    current_price = stockData.c
    g = open("/home/pi/stockpi/stockprice2.txt","w+")
    price = str(current_price) 
    g.write(price)
    g.close()
    print(current_price)

    if current_price > old_price:
        f= open("/home/pi/stockpi/stockprice.txt","w+")
        f.write("1")
        f.close()
        old_price = current_price
        
    elif current_price < old_price:
        f= open("/home/pi/stockpi/stockprice.txt","w+")
        f.write("0")
        f.close()
        old_price = current_price
        
    time.sleep(60)