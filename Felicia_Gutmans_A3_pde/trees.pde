/*creating an array of Italian Cypress trees that the avatar can walk 
through*/

class Wood 
{
  //defining constants
  PVector p, wh;
  color b;
  color g;
  
  Wood()
  {
    //using vectors to represent trees
    p= new PVector(width/2, height); 
    wh= new PVector(width/10, height/2);
  }
  
  Wood(float px, float h)
  {
    //new constructor takes x position and tree hight as an argument
    p= new PVector(px, height);
    wh=new PVector(width/10, h);
    g=color(0,100,0); //colour of leaves
  }  
  
  //visualising the trees
  void display()
  {
   pushMatrix(); 
    camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
    width/2.0, height/0.7, 0, 0, 1, 0);
    fill(g);
    stroke(g);
    ellipse(p.x, p.y, wh.x, wh.y);
  popMatrix();  
  }  
  
}  