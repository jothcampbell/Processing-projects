class Log{
  
  int xPosition = -50;
  int i;

  
  int fill = 255;
  

   
  int logLength = int(random(50,200));;
  int logHeight = 40;

  int lane;// = int(random(0,int(height/logHeight)));   
  int yPosition;// = (height - (lane * (logHeight + 20))); 
  int speed;// = lane + 1;//int(random(2,8));  
  
  int gapBetween;
  float direction = -1;

  int initX;
  int initY;
  int k = 0;
  //booleans for collision detection;
  boolean vertAlign;
  boolean horizAlign;
  boolean mountedLog;
  boolean splash;
  //allows the initial X Y and speed values to be set when the object is first called
  Log(float arrayIndex){
    
    //for loop that assigns the log's lane based on array index number
    for (i = 0; i < arrayIndex; i ++){
      k++;
      //every time the incrementer gets larger than the max number of lanes that can fit on the screen
      //the k variable resets to 0, allowing there to be even distribution of logs throughout the lanes
      if (k > ((height/logHeight) -6)) k = 0;
      
      
    }
    //lane defined by previous set of for loop 
    lane = k;
    
    
    
    
    //alternates the direction of the logs by rasing -1 to the power of the array index, meaning it will be negative for odd numbers, positive for even
    direction = pow(direction,arrayIndex);
    
    yPosition = ((height - 100) - (lane * (logHeight + 10)));
    speed = lane +1;
    xPosition = 0;
    fill = int(random(0,255));
   
    
    }
  
    
  //moves rectangles
  void animate(){
    
    //moves the object along with its predetermined speed
    xPosition += speed * direction;
    
    
  
    
    //draws the rectangles from the values stored in the arrays
    
    
      
      pushMatrix();
      fill(186,fill,0);
      translate(width/2,0);
      rect(xPosition, yPosition, logLength, logHeight);
      popMatrix();
    
    
      //when the log exits to the screen, respawn on the right side
     if (abs(xPosition) > (960/2) + (logLength)) {
        //instead of a strict wrap, I have the log respawn at a  random spot to the left of the screen
        if(direction == 1){
          xPosition = -500-logLength;
          logLength = int(random(50,100));
          fill = int(random(0,255));
        }
       
        
        else{
          xPosition = 500+ logLength;
          logLength = int(random(50,100));
          fill = int(random(0,255));
        }
       
        }
    
          
           
    
      } 
    
    
  
  
  void collisionDetection(int froggerX, int froggerY){
    
      
      //collision detection if statement set
      if ( froggerX >= xPosition +width/2 && froggerX <= xPosition + width/2 + logLength) horizAlign = true;
      
      if ( froggerX + 40 >= xPosition  + width/2 && froggerX + 40 <= xPosition + width/2 + logLength) horizAlign = true;
                  
      if ( froggerY >= yPosition && froggerY <= yPosition + 40) vertAlign = true;
      
      if ( froggerY + 40 >= yPosition && froggerY + 40 <= yPosition + 40) vertAlign = true;
      
      
      //sets the mounted log variable to true if two of the previous thigs return true
      if( horizAlign && vertAlign) {
        mountedLog = true;
        fill = 0;
      }
      
      //if the frog is vertically alligned but not horizontally alligned, it must be in the water, so this if statement sets the splash var to true
      else if(!horizAlign &&  vertAlign) splash = true;
        
      //if the frog is neither vertically alligned or horizontally alligned, then it must be off the log, thus the mountLog var is set to false  
      if(!horizAlign || !vertAlign) mountedLog = false;
      
      if (!horizAlign && !vertAlign) splash = false;
      vertAlign = false;
      horizAlign = false;
      
      
      
      if(mousePressed){
        fill = 250;
        splash = false;
      }
    }

  }
  
  
  
  