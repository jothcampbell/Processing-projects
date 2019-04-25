class Frog{

  //initialize the frogger X and Y variables (ints)
  int froggerX = 0;
  int froggerY = 50;
  int froggerSpeed = 10;
  
  int froggerHeight = 40;
 
 
  //death variable
  boolean dead = false;
  boolean won = false;
  //boolean to keep the jump animation from happening constantly
  boolean jumpStop = true;
  boolean clickStop = true;
  int jumpStopIncrement = 0;
  
  
  Frog(int initX, int initY){
    froggerX = initX;
    froggerY = initY;
  }
  
  void animate(){
    //this push/pop matrix pair makes the translate apply only to the shapes between them
    pushMatrix();
    
    if (dead){
      //froggerX = 480;
      //froggerY = 550;
      fill(218,50,50);
    }
    
    else if (froggerY == 0){
      won = true;
      fill(255,239,0);
    }
    
    else fill(255);
    //fill(250);
    translate(froggerX, froggerY);
    rect(0,0, froggerHeight, froggerHeight);
    popMatrix();
    
    
    
    //initiates movement from the key being pressed, and then the movment will ignore what the key does after that
    if (keyPressed && clickStop) {
      jumpStop =true;
      clickStop = false;
    }
    
  
    
    
    
    
      //if statement only runs five times because of an incrementing var switches the jumpStop var to false after 5 times
      if((jumpStop)){
        
        //switch moves frog in direction according to WASD controlls
        switch(key){
          case'w':
            if(froggerY > 0)
              froggerY -= froggerSpeed;
            break;
        
        case 's':
            if(froggerY  < 500 + froggerHeight + 10)
              froggerY+= froggerSpeed;
            break;
            
        case 'a':    
            if(froggerX > 0)
              froggerX -= 2*froggerSpeed;
            break;
            
        case 'd':
            if(froggerX + froggerSpeed * 5 < 960)
              froggerX += 2*froggerSpeed;
            break;
        }
        
        jumpStopIncrement ++;
        //turns if statement off when it runs 5 times
        
    }
    
    //resets the movement initializing variable when the key is no longer being pressed
    if(!keyPressed){
      clickStop = true;
      
    }
    //resets the incrementing variable and movement sustain variable when the incrementing variable exceeds the limit, meaning that the move code will run precisely 5 times and then stop, no matter what the key is doing
    if (jumpStopIncrement >= 5){        
          jumpStop = false;
          jumpStopIncrement = 0;
        }
    
    
  }
  
  
  void update(boolean deathUpdate){
    
    //because this method gets the collision variable from every car every frame, this if statement is needed to make the frog's death variable stay that way
    //otherwise the frog would only "die" if it was hit by the last car in the array
    if(!dead)
    dead = deathUpdate;
    if (mousePressed)
    dead = false;
      
    
  }
  
  //method that keeps track of when a frog is on a log and moves the frog when it is on a log
  void manageLogs(boolean logMount, int logSpeed){
    //stops the frog from getting carried off the screen by logs
    if(froggerX > 0 && froggerX < width - froggerHeight)
      //moves the frog at the same speed as the log that it's on
      if(logMount) froggerX += logSpeed*pow(-1,logSpeed)*-1;
  }
  
  
  
  
  
  
  
}