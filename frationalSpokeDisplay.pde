//fraction of a turn value; delta theta
float turn = (2*PI)/1.61803398874989;
//radius of seeds; delta r
int rad = 20;
//initial r and theta vals
float r = 10;
float theta = 0;
//loop control bool
boolean done = false;
//coordinate vals
float x;
float y;


void setup(){
  textSize(20);
  size(1280,960);
  background(0);
  rectMode(CORNERS);
  ellipseMode(CENTER);
  stroke(0);
  frameRate(60);
}

void draw(){
  background(0);
  text(turn/(2*PI), 20,20);
  
  
  while(!done){
    
    //print("process is ", (r/(height/2)*100), "% done. \n");
    //calculate x and y vals from theta and r
    y = sin(theta)*r+height/2;
    x = cos(theta)*r + width/2;
    //draw a circle at current point
    ellipse(x,y,rad,rad);
    //increment theta given amount
    theta += turn;
    //if theta is at zero or greater than or equal to 2 pi, increment r and subtract 2 pi from current theta
    r+= rad / 5.;
    //if r has reached critical leangth reset r and theta, increment turn val and let current frame display
    if(r >= height/2){done = true;}
  }
  
  //reset loop control var
  done = false;
  theta = 0;
  r = 0;
  //turn +=.00001;
  print("current turn rate is ", turn,'\n');
}


//polar to cartesian function?
