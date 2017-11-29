//matrix for tracking position, orientation, etc
int viewHeight = 100;

void setup()
{
    //3D rendering
    size(500, 500, P3D);
    //white fill
    fill(255);
}

void draw()
{  
    background(0);
    //makes u turn like drone view
   // camera(width*cos(frameCount*0.01), width*sin(frameCount*0.01), width, 0,0,0, 0,0,-1);
    camera(500, 0, 200, 0,0,0, 0,0,-1);
    drawGrid();
    translate(100,0,viewHeight);
    drawMatch();
    
    //rotate around X axis NOT USING THIS HERE 
    //rotate(frameCount*0.01);
}

//method for drawing the grid:
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
  
  // makes the avatar turn around in a circle
  rotate(frameCount*0.01);
}

//create a simple avatar (matchgirl)
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

void keyPressed()
{
    if(key=='f') saveFrame("images/image.png");
}