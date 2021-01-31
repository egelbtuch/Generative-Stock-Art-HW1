int rainNum = 1000;
ArrayList rain = new ArrayList();
ArrayList splash = new ArrayList();
float num = 0;
int number_rain = 1;
int new_input = 0;
int count = 0;
int up_or_down = 0;
String[] lines;
String[] price;
float stock_price = 0;

public void settings() {
  fullScreen();

}

void setup()
{
  background(0);
  lines = loadStrings("/home/pi/stockpi/stockprice.txt");
  up_or_down = Integer.parseInt(lines[0]);
  price = loadStrings("/home/pi/stockpi/stockprice2.txt");
  stock_price = Float.parseFloat(price[0]);
}

void draw()
{
    textSize(400);
    fill(24, 159, 4);
    text(" NIO:", width*2.4/5, height*2.1/5 + 200);
    textAlign(CENTER, CENTER);
    textSize(100);
    text(stock_price, width*2.4/5, height - 300);
    textAlign(CENTER, BOTTOM);
    


    blur(50);
    if (num < displayWidth && count < 28)
    {
      rain.add(new Rain(num));
      number_rain++;
      num += 100;
      count++;
    }
    else if (count < 300) {
      count++;
    }
    else {
      background(0);
      textSize(500);
      fill(24, 159, 4);
      text("NIO", width*2.4/5, height*2.1/5);
      textAlign(CENTER, CENTER);
      num = 0;
      lines = loadStrings("/home/pi/stockpi/stockprice.txt");
      up_or_down= Integer.parseInt(lines[0]);
      count = 0;
    }
  
    for (int i=0 ; i < rain.size() ; i++)
    {
      Rain rainT = (Rain) rain.get(i);
      rainT.calculate();
      if (up_or_down == 1){
        rainT.show1();
      }
      else if (up_or_down == 0){
        rainT.show0();
      }
      
      if (rainT.position.y > height)
      {
        
        for (int k = 0 ; k < random(5,10) ; k++)
        {
          splash.add(new Splash(rainT.position.x, height));
        }    
        rain.remove(i);
      }
    }
  
    for (int i=0 ; i < splash.size() ; i++)
    {
      Splash spl = (Splash) splash.get(i);
      spl.calculate();
      if (up_or_down == 1){
        spl.draw1();
      }
      else if (up_or_down == 0){
        spl.draw0();
      }
      if (spl.position.y > height)
      splash.remove(i);
    }
}

void blur(float trans)
{
  noStroke();
  fill(0, trans);
  rect(0, 0, width,height);
}
