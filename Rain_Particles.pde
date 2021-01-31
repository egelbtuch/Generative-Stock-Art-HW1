public class Rain
{
  PVector position, pposition, speed;
  public Rain(float i)
  {
    position = new PVector(i ,0);
    pposition = position;
    speed = new PVector(0,0);
  }
  
  void calculate()
  {
    pposition = new PVector(position.x,position.y);
    gravity();

  }
  
  void gravity()
  {
     speed.y += 1;
     speed.x += .01;
     position.add(speed);
  }
  
  void show1()
  { 
    PImage img = loadImage("download1.png");
    image(img, position.x, position.y);
  }
  
  void show0()
  { 
    PImage img = loadImage("burn3.png");
    image(img, position.x, position.y);
  }
}

public class Splash
{
  PVector position, speed;
  
  public Splash(float x, float y)
  {
    float angle = random(PI, TWO_PI);
    float distance = random(1, 5);
    float xx = cos(angle)*distance;
    float yy = sin(angle)*distance;
    position = new PVector(x, y);
    speed = new PVector(xx, yy);
    
  }
  
  public void draw1()
  {
    strokeWeight(1);
    stroke(0, 255, 0);
    fill(100, 100);
    ellipse(position.x, position.y, 4, 4);
  }
  
    public void draw0()
  {
    strokeWeight(1);
    stroke(255, 0, 0);
    fill(100, 100);
    ellipse(position.x, position.y, 4, 4);
  }
  
  public void calculate()
  {
    gravity();
    speed.x *= 0.98;
    speed.y *= 0.98;
    position.add(speed);
  }
  
  void gravity()
  {
    speed.y += .2;
  }
  
}
