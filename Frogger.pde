//this will be a frogger remake for now
//I'll reconsider my point-to-aim 2D shooter later
//and see if I can figure out pong as well

//to start I'll declare all the variable I'll be using
//the two for loop incrementer variables that I use for 
int i;
int k;
int j = 0;
Frog frog1 = new Frog(480,550);
boolean logMount = false;


//variable that controls how many cars there are, and the array that holds the cars
int carAmount = 30;
Car[] cars = new Car[carAmount];
Log[] logs = new Log[carAmount];



//do the setup thing
void setup(){
  //fill the car array
  for(i = 0; i < carAmount; i ++){
    cars[i] = new Car(i);
  }
  //fill the log array
  for(i = 0; i < carAmount; i ++){
    logs[i] = new Log(i);
  }

  size(960,600);
  noStroke();
}



//---start the draw loop---

void draw(){
  //set the background to a light green
  background(128,230,131);
  pushMatrix();
  fill(228,250,230);
  //bars at the top and bottom of screen indicating start and end zones
  rect(0,0,width, cars[0].carHeight + 5); 
  rect(0, height - 55 , width, 55);
  
  popMatrix();







  //for loop that allows the frog to stay alive if its on any log
  //before the logs were "splashing" the frog whenever it was in the same lane as themselves
  //now it will only splash if the "mountLog" variable is false for all the logs
  for(i = 0; i < carAmount; i ++){
    
    
    logs[i].collisionDetection(frog1.froggerX,frog1.froggerY);
    
     //switches true and stays true if one of the logs mountedLog var is true    
    if (!logMount) logMount = logs[i].mountedLog;  
    
    //increments the j var every time the loagMount var is false
    if(!logs[i].mountedLog) j++;
     
    //if the logMount var is false for as many times as there are logs, the frog is not on any of the logs 
    if (j == carAmount) logMount = false;
    
    //for loop that checks the position of every car in the array against the position of every other car to make sure they don't overlap, and that there is a gap
    for(k = 1; k < carAmount; k++){
  
      //if statement that makes sure that the two cars I'm pulling are in the same lane
      if(cars[i].lane == cars[k].lane && i != k){
                                      
        //if statement that checks the difference between two xPositions and moves the car if they're too close together        
        if(cars[i].xPosition - cars[k].xPosition <= cars[i].carLength && cars[i].xPosition - cars[k].xPosition >= 0){
          cars[i].xPosition += cars[i].carLength + 180;                                
        }
        
        if(logs[i].xPosition - logs[k].xPosition <= logs[i].logLength && logs[i].xPosition - logs[k].xPosition >= 0){
          logs[i].xPosition += logs[i].logLength + 180;
          
        }                        
      }                    
    }
    
    
    
    //sends the crash var from the cars to the frog object
    frog1.update(cars[i].collided);
    
    //if the frog is not on any logs,  
    if (!logMount) frog1.update(logs[i].splash);
    
    
    frog1.manageLogs(logs[i].mountedLog, logs[i].speed);
    
    
    logs[i].animate();
    
    
    //cars[i].animate();
    //cars[i].collisionDetection(frog1.froggerX,frog1.froggerY);    
}

//resets the incrementing var for the logMount checking if statement
j=0;
frog1.animate();

   


}
  
  
  
  



//at some point have the opening menu draw code inside an if statement
//use carVertPosition control variable same as that choose your own adventure game

//have the car and frogger functions drawn here

//all the movement code will be part of the function code