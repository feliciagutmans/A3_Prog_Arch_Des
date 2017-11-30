class Snow
{

//SNOW
int amount= 200;
float[] xPos= new float [amount];
float[] yPos = new float [amount];
int [] flakeWidth= new int [amount];
int [] direction= new int [amount];
int minFlakeWidth= 1;
int maxFlakeWidth= 6;

  Snow ()
{
  //SNOW
    frameRate(25); 
    noStroke();
    smooth();
}  

  Snow (float a, float b) 
  {
    for(int i= 0; i<amount; i++)
    {
     xPos[i]= random(0, width);
     yPos[i]= random(0, height);
     flakeWidth[i]= round(random(minFlakeWidth, maxFlakeWidth));
     direction[i]= round(random(0,1));
    }
  } 


void display()
{
  pushMatrix();
  camera(width/2.0, height/2.0, (height/2.0) / tan(PI*30.0 / 180.0), 
  width/2.0, height/2.0, 0, 0, 1, 0);
  for(int i=0; i<xPos.length; i++)
  {
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
}