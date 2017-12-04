/*
***************************************************************************************************
Felicia Gutmans- Student 13008920 UCL
BENVGACH- Introduction to Programming for Architecture and Design
Assessment 3- Wintery Scene (Friday 1 Dec 2017)
:Create a winter scene, with a movable/controllable avatar, trees, and a wintery agent
***************************************************************************************************
*/

//matrix for tracking position and orientation of viewer
int viewHeight = 100;

//matrix to capture position and orientation of avatar
PMatrix3D eye = new PMatrix3D();

//new class for array for snow
Snow[] manyFlakes;

//new class for array for trees
Wood[] manyTrees;

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
    manyFlakes= new Snow[2]; //low number= lower snow density
    for(int i= 0; i < manyFlakes.length; i++)
    {
      manyFlakes[i] = new Snow(random(width), random(height));
    }

   //TREES
   manyTrees= new Wood[15];
   for(int j=0; j<manyTrees.length; j++)
     {
       manyTrees[j]= new Wood(random(width), random(0.1*height, height));
     }
}

void draw()
{
    background(0);
    camera(500, 0, 200, 0,0,0, 0,0,-1); //sets the camera position so that objects can appear 3D

   //display grid to give illusion of depth
    drawGrid();

   //matrix to give illusion of depth
    applyMatrix(eye);

  //display moving avatar that can be controlled by user
    drawAvatar();

    //display snowfall
    for(int i=0; i<manyFlakes.length; i++)
    {
      manyFlakes[i].display();
    }

   //display Trees
   for(int j=0; j<manyTrees.length; j++)
     {
       manyTrees[j].display();
     }
   }


  void drawGrid()
    {
     //determining how far the lines should go
     int horizon = width*10;
     //separatin between the lines
     int sep = 100;

     stroke(255);
     for(int i=-100;i<100; i++)
       {
         //lines in x-direction
         line(-horizon, i*sep, horizon, i*sep);
         //lines in y-direction
         line(i*sep, -horizon, i*sep, horizon);
       }

     //Additional lines for the x and y axis, emphasising depth
     stroke(255,0,0);
     line(-horizon, 0, horizon, 0);

     stroke(0, 255, 0);
     line(0, -horizon, 0, horizon);

    /*Makes the avatar move in a contstant circle, making it easily remain in the frame.
    Also causes avatar to move slower when close to centre and faster when far from
    centre- another way user can control speed.*/
    rotate(frameCount*0.01);

  }

  //creating a simple avatar
  void drawAvatar()
  {
    pushMatrix();
     fill(220,20,60); //Make it a bright colour to stand out
     stroke(220,20,60);
     sphere(20);
     //start at the top - translate down half the height of the avatar
     translate(0, 0, -viewHeight/2);
     //draw the body
     fill(255,105,180);
     box(20, 20, viewHeight);
   popMatrix();
  }

  void keyPressed()
  {
    if(key=='p') saveFrame("images/image.png");
    if(key=='l') eye.rotateY(-0.2); //Makes the avatar flip left
    if(key=='k') eye.rotateY(0.2); //Makes the avatar flip right
    if(keyCode==LEFT) eye.translate(frameCount*-0.01,0,0); //makes avatar move left slowly
    if(keyCode==RIGHT) eye.translate(frameCount*0.01,0,0); //makes avatar move right slowly
    if(keyCode==UP) eye.translate(frameCount*0.06,0,0); //makes avatar move backward fast
    if(keyCode==DOWN) eye.translate(frameCount*-0.06,0,0); //makes avatar move forward fast
  }
