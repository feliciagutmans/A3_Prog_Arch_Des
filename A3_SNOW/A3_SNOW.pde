//matrix for tracking position, orientation, etc
int viewHeight = 100;

//matrix to capture position and orientation of match
PMatrix3D eye = new PMatrix3D();

int amount= 200;
float[] xPos= new float [amount];
float[] yPos = new float [amount];
int [] flakeWidth= new int [amount];
int [] direction= new int [amount];
int minFlakeWidth= 1;
int maxFlakeWidth= 6;

void setup()
{
    //3D rendering
    size(500, 500, P3D);
    //white fill
    fill(255);
    
    //translate eye matrix
    eye.translate(100,100,viewHeight);
    //rotate matrix
    eye.rotate(PI/6);
    
    //SNOW
    frameRate(25);
    noStroke();
    smooth();
    
    for( int i= 0; i<amount; i++)
    {
      flakeWidth[i]= round(random(minFlakeWidth, maxFlakeWidth));
      xPos[i]= random(0, width);
      yPos[i]= random(0, height);
      direction[i]= round(random(0,1));
    }  
    
}

void draw()
{  
    background(0);
    camera(500, 0, 200, 0,0,0, 0,0,-1);
   //Makes the matchstick rotate
    //eye.rotate(0.01);
    
    
    drawGrid();
    
    //translate(100,0,100);
    /*
        This is equivalent to the above, 
        but allows more complex transformations and paths.
    */
    applyMatrix(eye);
    
    //this makes the match walk around in some but rotate in others
    //rotate(frameCount*0.01);
     
    drawMatch();
    
    drawSnow();
    
   
}


void drawGrid()
{
     //how far should the lines go?
     int horizon = width*10;
     //line separation
     int sep = 100;
          
     stroke(255);
     for(int i=-100;i<100; i++)
     {
         //lines in x-direction
         line(-horizon, i*sep, horizon, i*sep);
         //lines in y-direction
         line(i*sep, -horizon, i*sep, horizon);
     }
     
     //I've added additional lines here for the x and y axis
     stroke(255,0,0);
     line(-horizon, 0, horizon, 0);
     
     stroke(0, 255, 0);
     line(0, -horizon, 0, horizon);  
     
     //Makes the match be in constant movement
     rotate(frameCount*0.01);
}

//create a simple avatar
void drawMatch()
{
  pushMatrix();
    sphere(20);
    //start at the top - translate down half the height of the match
    translate(0, 0, -viewHeight/2);
    //draw the stick
    box(20, 20, viewHeight);
  popMatrix();
}

void drawTrees()
{
  
}  


void drawSnow()
{
  pushMatrix();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
  width/2.0, height/2.0, 0, 0, 1, 0);
  for(int i=0; i<xPos.length; i++)
  {
    //makes the inside and border of snow white
    fill(255);
    stroke(255);
    ellipse(xPos[i], yPos[i], flakeWidth[i], flakeWidth[i]);
    
    if(direction[i]==0)
    {
      xPos[i] += map(flakeWidth[i], minFlakeWidth, maxFlakeWidth, .1, .7);
    }  
    else
    {
      xPos[i] -=map(flakeWidth[i], minFlakeWidth, maxFlakeWidth, .1,.7);
    }  
    yPos[i] += flakeWidth[i] + direction[i];
    
    if(xPos[i] > width +flakeWidth [i] || xPos[i]<-flakeWidth[i] || 
    yPos[i] > height + flakeWidth[i])
    {
      xPos[i] = random(0,width);
      yPos[i]= -flakeWidth[i];
    }    
  }
  popMatrix();
  
}  


void keyPressed()
{
    if(key=='f') saveFrame("images/image.png");
    //if(keyCode==LEFT) eye.rotateY(-0.05);
    //if(keyCode==RIGHT) eye.rotateY(0.05);
    if(keyCode==LEFT) eye.translate(frameCount*-0.1,0,0);
    if(keyCode==RIGHT) eye.translate(frameCount*0.1,0,0);
    if(keyCode==UP) eye.translate(-10,0,0);
    if(keyCode==DOWN) eye.translate(10,0,0);
}