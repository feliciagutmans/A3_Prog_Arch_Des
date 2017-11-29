//matrix for tracking position, orientation, etc
int viewHeight = 100;

//matrix to capture position and orientation of match
PMatrix3D eye = new PMatrix3D();

float [] trees; //Array of trees.

void setup()
{
    //3D rendering
    size(500, 500, P3D);
    //white fill
    fill(255);
    
    //translate eye matrix
    eye.translate(100,100,viewHeight);
    eye.rotate(PI/6);
}

void draw()
{  
    background(0);
    camera(500, 0, 200, 0,0,0, 0,0,-1);
    
    /*
        Create a new matrix to transform the ****whole scene****
        except the match, which we're not drawing
        because we're in the head of the match!
    */
    PMatrix3D matrix = new PMatrix3D();
    //(when we apply this, it will) drag the origin up to the camera
    matrix.translate(500, 0, 200);
    
    /*
        Invert the match transformation; or, move the whole scene
        so the origin is at the matchhead and it's
    */
    PMatrix3D inv =  new PMatrix3D(eye);
    inv.invert();
    
    matrix.apply(inv);
    applyMatrix(matrix);
    
    
    
    drawGrid();
    
    //translate(100,0,100);
    /*
        This is equivalent to the above, 
        but allows more complex transformations and paths.
    */
    //applyMatrix(eye);
    //drawMatch();
    
    
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

void keyPressed()
{
    if(key=='f') saveFrame("images/image.png");
    if(keyCode==LEFT) eye.rotateZ(-0.05);
    if(keyCode==RIGHT) eye.rotateZ(0.05);
    if(keyCode==UP) eye.translate(-10,0,0);
    if(keyCode==DOWN) eye.translate(10,0,0);
}