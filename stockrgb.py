import board
import neopixel
import time

pixel_pin = board.D21
pixels = neopixel.NeoPixel(board.D21, 8)

green_or_red = "0"
t = 0

if t < 1:
    time.sleep(1)
    t = t + 1

while True:

    f = open("/home/pi/stockpi/stockprice.txt","r")
    green_or_red = f.read(1)
    print(green_or_red)
    f.close()
    
    if green_or_red == "1":
        
        pixels[0] = (0, 255, 0)
        pixels[1] = (0, 255, 0)
        pixels[7] = (0, 255, 0)
        pixels[3] = (0, 255, 0)
        pixels[5] = (0, 255, 0)
        pixels[2] = (0, 0, 0)
        pixels[4] = (0, 0, 0)
        pixels[6] = (0, 0, 0)
        
    elif green_or_red == "0":
        
        pixels[7] = (255, 0, 0)
        pixels[1] = (255, 0, 0)
        pixels[4] = (255, 0, 0)
        pixels[3] = (255, 0, 0)
        pixels[5] = (255, 0, 0)
        pixels[2] = (0, 0, 0)
        pixels[6] = (0, 0, 0)
        pixels[0] = (0, 0, 0)
        
    time.sleep(70)