#!/usr/bin/env bash

processing-java --sketch='/home/pi/Desktop/RainingMoney' --run & 

sudo python3 /home/pi/stockrgb.py &

python3 /home/pi/stockpi/main.py &