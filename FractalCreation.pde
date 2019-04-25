//Fractal experimentation, inspired by the chaos game numberphile episode

//initilizing all the varialbes needed
int sidesInit = 3;
int sides = sidesInit;
int[] vertXs = new int[sides];//{580,290,970};
int[] vertYs = new int[sides];//{200,780,780};
int ptCh;
float pointX;
float pointY;
boolean iteration = false;
boolean clickReset = true;

//get the window, background, main loop,etc. set up
void setup(){
  size(1080,960);
  background(0);
  rectMode(CORNERS);
  ellipseMode(CENTER);
  stroke(255);
  frameRate(300);
}

void draw(){
  //generate points, through user input, rng, and store the values for later use
  //take startingpoint coordinates from a mouse click
  
  if((mousePressed && clickReset) && sides > 0){
    vertXs[sides-1]=mouseX;
    vertYs[sides-1]=mouseY;
    sides --;
    clickReset = false;
  }
  
  if(sides==0){
    for (int i =0; i <= vertXs.length-1; i++){
      point(vertXs[i],vertYs[i]);//draw vertex points
    }
  }
  //ellipse(200,200,50,50);
  if((mousePressed && clickReset)&&sides==0){
    clickReset = false;
    pointX=mouseX;
    pointY=mouseY;
    sides --;
  }
  //dot drawing loop will draw dots until a mouse click ends the loop
  if(!mousePressed && sides == -1){
    point(pointX*(vertXs.length-2.),pointY*(vertXs.length-2.));//put a point on screen at the calculated values
    ptCh = int(random(0,vertXs.length));//random number will generate an int from 0 to the number of vertecies chosen less 1
    pointX = ((vertXs[ptCh]+pointX)/(vertXs.length-1.));//midpoint calculations will update the point x and y vals 
    pointY = ((vertYs[ptCh]+pointY)/(vertXs.length-1.));//using the generated random number as an index selector
    print((vertXs[ptCh]-pointX)/(vertXs.length-1.),'\n');
    iteration = true;// value that activates reset if statement
  }
  
  //if statement that clears the board when the mouse is clicked a after the iteration has begun 
  if((mousePressed && clickReset) && iteration){
    sides = sidesInit;
    //background(0);
    clickReset = false;
  }
    
  if(!mousePressed && !clickReset){
    clickReset = true;// to make sure exactly one statement will be activated per mouse click
    
  }
  
}
