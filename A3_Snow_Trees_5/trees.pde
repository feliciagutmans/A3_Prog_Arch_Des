class Wood
{
  PVector p, wh;
  color b;
  color g;
  
  Wood()
  {
    p= new PVector(width/2, height);
    wh= new PVector(width/10, height/2);
  }
  
  Wood(float px, float h)
  {
    p= new PVector(px, height);
    wh=new PVector(width/10, h);
    b= color(139,69,19);
    g=color(0,128,0);
  }  
  
  void display()
  {
   pushMatrix(); 
    camera(width/2.0, height/4.0, (height/2.0) / tan(PI*30.0 / 180.0), 
    width/2.0, height/1.0, 0, 0, 2, 0);
    fill(b);
    stroke(b);
    rect(p.x, p.y, -wh.y, wh.x, wh.y);
    fill(g);
    stroke(g);
    ellipse(p.x, p.y, wh.x, wh.y);
  popMatrix();  
  }  
  
}  