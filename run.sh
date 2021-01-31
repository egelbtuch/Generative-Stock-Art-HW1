#!/usr/bin/env bash

DISPLAY=:0 processing-java --sketch='/home/pi/Desktop/RainingMoney' --present & 
sudo python3 /home/pi/stockrgb.py &
python3 /home/pi/stockpi/main.py &