class Car{
  
  int xPosition = -50;
  int i;

  
  int fill = 255;
  

   
  int carLength = int(random(50,200));;
  int carHeight = 40;

  int lane;// = int(random(0,int(height/carHeight)));   
  int yPosition;// = (height - (lane * (carHeight + 20))); 
  int speed;// = lane + 1;//int(random(2,8));  
  
  int gapBetween;
  float direction = -1;

  int initX;
  int initY;
  int k = 0;
  boolean vertAlign;
  boolean horizAlign;
  boolean collided;
  
  //allows the initial X Y and speed values to be set when the object is first called
  Car(float arrayIndex){
    
    //for loop that assigns the car's lane based on array index number
    for (i = 0; i < arrayIndex; i ++){
      k++;
      //every time the incrementer gets larger than the max number of lanes that can fit on the screen
      //the k variable resets to 0, allowing there to be even distribution of cars throughout the lanes
      if (k > ((height/carHeight) - 6)) k = 0;
      
      
    }
    
    lane = k;
    
    
    //lane = abs(int(arrayIndex)-(height/carHeight));
    
    //alternates the direction of the cars by rasing -1 to the power of the array index, meaning it will be negative for odd numbers, positive for even
    direction = pow(direction,arrayIndex);
    //
    yPosition = ((height - 100) - (lane * (carHeight + 10)));
    speed = lane +1;
    xPosition = 0;// -(arrayIndex * (250));
    fill = int(random(0,255));
   
    
    }
  
    
  //moves rectangles
  void animate(){
    //if(yPosition!=0)
    //xPosition += int((speed*yPosition)/800);
    
    xPosition += speed * direction;
    
    
  
    
    //draws the rectangles from the values stored in the arrays
    
    
      
      pushMatrix();
      fill(fill);
      translate(width/2,0);
      rect(xPosition, yPosition, carLength, carHeight);
      popMatrix();
    
    
      //when the car exits to the screen, respawn on the right side
     if (abs(xPosition) > (960/2) + (carLength)) {
        //instead of a strict wrap, I have the car respawn at a  random spot to the left of the screen
        if(direction == 1){
          xPosition = -500-carLength;
          carLength = int(random(50,100));
          fill = int(random(0,255));
        }
       
        
        else{
          xPosition = 500+ carLength;
          carLength = int(random(50,100));
          fill = int(random(0,255));
        }
       
        }
    
          
           
    
      } 
    
    
  
  
  void collisionDetection(int froggerX, int froggerY){
    
      
      //checks for 
      if ( froggerX >= xPosition +width/2 && froggerX <= xPosition + width/2 + carLength) horizAlign = true;
      
      if ( froggerX + 40 >= xPosition  + width/2 && froggerX + 40 <= xPosition + width/2 + carLength) horizAlign = true;
                  
      if ( froggerY >= yPosition && froggerY <= yPosition + 40) vertAlign = true;
      
      if ( froggerY + 40 >= yPosition && froggerY + 40 <= yPosition + 40) vertAlign = true;
      
      if( horizAlign && vertAlign) {
        collided = true;
        fill = 0;
      }
        
      vertAlign = false;
      horizAlign = false;
      
      if(mousePressed){
        fill = 250;
        collided = false;
      }
    }

  }
  
  
  
  