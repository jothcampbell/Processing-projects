//gamboard matrix so I can reuse the code from my previous game
String[][] GameBoard = new String[3][3];//{{"a","a","a"},{"a","a","a"}};
//X and Y arrays 

int[] activatedXcoords = new int[]{100,300,500};
int[] activatedYcoords = new int[9];{

//fills board matrix with blank spaces to print
           for (int rowSelect = 0; rowSelect<=2; rowSelect++)
            {
                for (int columnSelect = 0; columnSelect <=2; columnSelect++)
                {
                    GameBoard[rowSelect][ columnSelect] = " ";
                }

                
            }
}

//gameBoard[2][2] = "a";

void setup(){
  size(600,600);
  background(150);
}

//declare coordinate select variables
int Xselect = 0;
int Yselect = 0;
int Xcoord = -500;
int Ycoord = -500;

//copied code
            //declare loop control variables
            int columnSelect = 0;
            int rowSelect = 0;
            //declare check loop control variable (int)
            int checkLoopControl = 0;
            //declare set of vars to use to check for 3 in a row
            String winCheck1 = "X";
            String winCheck2 = "y";
            String winCheck3 = "x";
            
            
                        //declare set of variables used in the single player game to collect coordinates of where AI is going to place letter
            int AIcolumnSelect1 = 0;
            int AIcolumnSelect2 = 0;
            int AIcolumnSelect3 = 0;
            int AIrowSelect1 = 0;
            int AIrowSelect2 = 0;
            int AIrowSelect3 = 0;
            //bool used to make sure AI only puts one letter in per turn
            boolean letterAlreadyPutIn = true;
            //ints used for random spot selection when there are no 2 in a rows
            float AIrowSelectRandom;
            float AIcolumnSelectRandom;





//declare turn swapping varible

boolean itsXsTurn = true;
//varaible that the win check loops switch to true if there is a win
boolean endOfGame = false;
//varaible the tie loop sets to true in case of a tie
boolean tie = false;
//variable the decides which set of if statements to run
boolean singlePlayer = true;
int gameBoardFull = 0;
//declare board matrix
String letterToPutIn = "X";
//used to keep the mousePressed statment from running constantly
int stop = 0;



void draw(){
  background(400,400,400);
  

  strokeWeight(10);
  
  //this if/else set fades the board to a light grey when the game ends so the endgame message pops out
  if(endOfGame || tie){
    fill(200);
    stroke(200);
  }
  
  else {
    fill(0);
    
    stroke(0);
  }
  
  
  //draws board lines  
  //vertical lines
  line(200,20,200,580);
  line(400,20,400,580);
  //horizontal lines
  line(20,200,580,200);
  line(20,400,580,400);
  

  
 //the code will be very similar to the console based game
 //I'll use a set of if statements to define the Xinput and Yinput
 //I'll see if I can have the letter that's about to be placed 
 //stick to the cursor so that it is clear who's turn it is
 
 if ((mousePressed && stop == 0) && (!endOfGame && !tie)){
   
   //determines what the X value is
   if(mouseX > 0 && mouseX < 200){
     Xselect = 0;
     Xcoord = 100;
   }
   
   if (mouseX > 200 && mouseX < 400){
     Xselect = 1;
     Xcoord = 300;
   }
   
   if(mouseX > 400 && mouseX < 600){
     Xselect = 2;
     Xcoord = 500;
   }
 
 
 //determines what the Y value is
    if(mouseY > 0 && mouseY < 200){
     Yselect = 0;
     Ycoord = 100;
   }
   
   if (mouseY > 200 && mouseY < 400){
     Yselect = 1;
     Ycoord = 300;
   }
   
   if(mouseY > 400 && mouseY < 600){
     Yselect = 2;
     Ycoord = 500;
   }
   
   
   //keeps letter from being put in an toggling if the space already has a letter in it
   if (GameBoard[Xselect][Yselect] == " "){
     
     //puts letter in board space
    GameBoard[Xselect][Yselect] = letterToPutIn;
   //toggles the turn variable
   if(!singlePlayer)itsXsTurn = !itsXsTurn;
   letterAlreadyPutIn = false;
   }
   //keeps this statment from running constantly
   stop ++;
   
  
 }
 
 
 //Keeps the previous if statement from t\running constantly

 
 
 //alternates letters 
 
   if(itsXsTurn) letterToPutIn = "X";
   
   else letterToPutIn = "O";
   
   
 //println(Xselect + "," + Yselect);
 println(mouseX + "," + mouseY);
  
  //makes the letters the right size
 textSize(200);
 
 //
 text(letterToPutIn, mouseX - 60, mouseY + 70);
 //text(letterToPutIn, Xcoord - 60, Ycoord + 70);
 
                 //print game board
                //if(!endOfGame && !tie)
                for (int columnSelect = 0; columnSelect <= 2; columnSelect++)
                {

                    for (int rowSelect = 0; rowSelect <= 2; rowSelect++)
                    {
                        text(GameBoard[columnSelect][ rowSelect],activatedXcoords[columnSelect] - 60 , activatedXcoords[rowSelect] + 70 );
                       
                       
                    }                  
                }
                

 
 println(GameBoard[Xselect][Yselect]);
 
 
 
 
 
 
 
 
 
 
 //copied code for win checking
 
 if(singlePlayer == false){
 
                //checks for vertical win state
                for (columnSelect = 0; columnSelect <= 2; columnSelect++)
                {

                    for (rowSelect = 0; rowSelect <= 2; rowSelect++)
                    {
                        //switch statement gathers values of the items in a column to check for a win state later in the loop
                        switch (rowSelect)
                        {
                            case 0:
                                winCheck1 = GameBoard[rowSelect][ columnSelect];
                                break;

                            case 1:
                                winCheck2 = GameBoard[rowSelect][columnSelect];
                                break;

                            case 2:
                                winCheck3 = GameBoard[rowSelect][columnSelect];
                                break;

                        }
                        
                    }                   
                    //uses a = b, b = c, a = c mathamatacal law to check if the 3 values pulled from board are equal
                    if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                    {
                        //if the values aren't asterisks, then they must be the letters in the win formation
                        if (winCheck1 != " ")
                            endOfGame = true;
                    }




                    checkLoopControl = 1;
                }


                //checks for win in horizontal direction
                for (rowSelect = 0; rowSelect <= 2; rowSelect++)
                {

                    for (columnSelect = 0; columnSelect <= 2; columnSelect++)
                    {
                        switch (columnSelect)
                        {
                            case 0:
                                winCheck1 = GameBoard[rowSelect][ columnSelect];
                                break;

                            case 1:
                                winCheck2 = GameBoard[rowSelect][ columnSelect];
                                break;

                            case 2:
                                winCheck3 = GameBoard[rowSelect][ columnSelect];
                                break;

                        }

                    }

                    //same win check if statement as x loop
                    if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                    {
                        if (winCheck1 != " ")
                            endOfGame = true;
                    }




                    checkLoopControl = 1;
                }

                //***while loop to check for 3 in a row in diagonal direction***
                //same as other two loops, just have columnSelect in both coord slots
                //and have a second loop where columnSelect starts at 4 and decrements
                //thus both diagonal spot directions will be checked
                for (rowSelect = 2; rowSelect <= 2; rowSelect++)
                {

                    for (columnSelect = 0; columnSelect <= 2; columnSelect++)
                    {
                        switch (columnSelect)
                        {
                            case 0:
                                winCheck1 = GameBoard[columnSelect][ columnSelect];
                                break;

                            case 1:
                                winCheck2 = GameBoard[columnSelect][ columnSelect];
                                break;

                            case 2:
                                winCheck3 = GameBoard[columnSelect][ columnSelect];
                                break;

                        }

                    }


                    if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                    {
                        if (winCheck1 != " ")
                            endOfGame = true;
                    }




                    checkLoopControl = 1;
                }

                //second diag check loop. Checks positive slope diagonal

                for (rowSelect = 2; rowSelect <= 2; rowSelect++)
                {

                    for (columnSelect = 0; columnSelect <= 3 ; columnSelect++)
                    {
                        switch (columnSelect)
                        {
                            case 0:
                                winCheck1 = GameBoard[0][2];
                                break;

                            case 1:
                                winCheck2 = GameBoard[1][1];
                                break;

                            case 2:
                                winCheck3 = GameBoard[2][0];
                                break;

                        }

                    }


                    if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                    {
                        if (winCheck1 != " ")
                            endOfGame = true;
                    }




                    checkLoopControl = 1;
                }


                //for loop to check see if board it is full
               
                for (columnSelect = 0; columnSelect <= 2; columnSelect++)
                {

                    for (rowSelect = 0; rowSelect <= 2; rowSelect++)
                    {
                        //increments variable every time an index in the board is an asterisk
                        if (GameBoard[columnSelect][ rowSelect] == " ")
                            gameBoardFull++;
                    }

                    //if there are no asterisks on the board, its full
                    if (gameBoardFull == 0 && columnSelect == 2)
                    {
                        tie = true;
                    }
                    checkLoopControl = 0;
                }
                //resets asterisk counting variable so that it only counts the asterisks once per loop
                gameBoardFull = 0;
                
 }
             
                
                
                /*
                ----------------------------------------
                
                        Begin single player loop
                
                
                -----------------------------------
                */
                
                //singleplayer set of loops
                
      if(singlePlayer){
        
                //for loop goes through check loops three times so that if O wins the win if statements will switch true on O's turn and allow the AI to check the whole board for 
                //an O tow in a row before putting a letter down
                for (checkLoopControl = 0; checkLoopControl <= 5; checkLoopControl++)

                {
                    
                    
                    //checks for vertical win state
                    for (columnSelect = 0; columnSelect <=  2; columnSelect++)
                    {

                        for (rowSelect = 0; rowSelect <=  2; rowSelect++)
                        {
                            //switch statement gathers values of the items in a column to check for a win state later in the loop
                            switch (rowSelect)
                            {
                                case 0:
                                    winCheck1 = GameBoard[rowSelect][ columnSelect];
                                    AIrowSelect1 = rowSelect;
                                    break;

                                case 1:
                                    winCheck2 = GameBoard[rowSelect][ columnSelect];
                                    AIrowSelect2 = rowSelect;
                                    break;

                                case 2:
                                    winCheck3 = GameBoard[rowSelect][ columnSelect];
                                    AIrowSelect3 = rowSelect;
                                    break;

                            }

                        }

                        //sets the row that the AI will but the letter into
                        AIcolumnSelect1 = columnSelect;



                        //uses a = b, b = c, a = c mathamatacal law to check if the 3 values pulled from board are equal
                        if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                        {
                            //if the values aren't asterisks, then they must be the letters in the win formation
                            if (winCheck1 != " ")
                            {
                                //makes it so that the win message is the right letter
                                endOfGame = true;
                                letterToPutIn = winCheck1;
                            }
                        }





                        //this makes sure that the AI will only put a letter in if a letter has not been put in this round
                        else if (letterAlreadyPutIn || endOfGame)
                        {
                            winCheck1 = " ";
                            winCheck2 = " ";
                        }




                        //set of else ifs check for 2 in a row and put an O in the spot that is left over if there is one
                        else if (winCheck1 == winCheck2 && winCheck1 != " ")
                        {

                            //this se of if and else if makes sure that if there is an O two in a row in the board, the AI will put the O there first
                            if (GameBoard[AIrowSelect3][ AIcolumnSelect1] == " " && winCheck1 == "O")
                            {
                                GameBoard[AIrowSelect3][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }

                            else if (GameBoard[AIrowSelect3][ AIcolumnSelect1] == " " && checkLoopControl >= 2)
                            {
                                GameBoard[AIrowSelect3][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }



                        else if (winCheck2 == winCheck3 && winCheck2 != " ")
                        {
                            if (GameBoard[AIrowSelect1][ AIcolumnSelect1] == " " && winCheck2 == "O")
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }

                            else if (GameBoard[AIrowSelect1][ AIcolumnSelect1] == " " && checkLoopControl >= 2)
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }



                        else if (winCheck3 == winCheck1 && winCheck1 != " ")
                        {
                            if (GameBoard[AIrowSelect2][ AIcolumnSelect1] == " " && winCheck1 == "O")
                            {
                                GameBoard[AIrowSelect2][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }

                            else if (GameBoard[AIrowSelect2][ AIcolumnSelect1] == " " && checkLoopControl >= 2)
                            {
                                GameBoard[AIrowSelect3][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }
                    }







                    //checks for horizontal win state
                    for (rowSelect = 0; rowSelect <= 2; rowSelect++)
                    {


                        for (columnSelect = 0; columnSelect <= 2; columnSelect++)
                        {
                            switch (columnSelect)
                            {
                                case 0:
                                    winCheck1 = GameBoard[rowSelect][ columnSelect];
                                    AIcolumnSelect1 = columnSelect;
                                    break;

                                case 1:
                                    winCheck2 = GameBoard[rowSelect][ columnSelect];
                                    AIcolumnSelect2 = columnSelect;
                                    break;

                                case 2:
                                    winCheck3 = GameBoard[rowSelect][ columnSelect];
                                    AIcolumnSelect3 = columnSelect;
                                    break;

                            }

                        } 


                        //selects the row the AI will be putting its letter into
                        AIrowSelect1 = rowSelect;


                        //If statement for when a letter has already been put in so that the ai can't cheat
                        //same win check if statement as x loop
                        if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                        {
                            if (winCheck1 != " ")
                            {
                                endOfGame = true;
                                letterToPutIn = winCheck1;
                            }
                        }



                        //this makes sure that the AI will only run if a letter has not been put in this round
                        else if (letterAlreadyPutIn || endOfGame)
                        {
                            winCheck1 = " ";
                            winCheck2 = " ";
                        }




                        //set of else ifs check for 2 in a row and put an O in the spot that is left over if there is one
                        else if (winCheck1 == winCheck2 && winCheck1 != " ")
                        {
                            if (GameBoard[AIrowSelect1][ AIcolumnSelect3] == " " && winCheck2 == "O")
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect3] = "O";
                                letterAlreadyPutIn = true;
                            }

                            else if (GameBoard[AIrowSelect1][ AIcolumnSelect3] == " " && checkLoopControl >= 2)
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect3] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }



                        else if (winCheck2 == winCheck3 && winCheck2 != " ")
                        {
                            if (GameBoard[AIrowSelect1][ AIcolumnSelect1] == " " && winCheck2 == "O")
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }

                            else if (GameBoard[AIrowSelect1][ AIcolumnSelect1] == " " && checkLoopControl >= 2)
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }



                        else if (winCheck3 == winCheck1 && winCheck1 != " ")
                        {
                            if (GameBoard[AIrowSelect1][ AIcolumnSelect2] == " " && winCheck1 == "O")
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect2] = "O";
                                letterAlreadyPutIn = true;
                            }

                            else if (GameBoard[AIrowSelect1][ AIcolumnSelect2] == " " && checkLoopControl >= 2)
                            {
                                GameBoard[AIrowSelect1][ AIcolumnSelect2] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }
                       
                    }

         
                    
                    
                    //***while loop to check for 3 in a row in diagonal direction***
                    //same as other two loops, just have columnSelect in both coord slots
                    //and have a second loop where columnSelect starts at 4 and decrements
                    //thus both diagonal spot directions will be checked
                    for (rowSelect = 3; rowSelect <= 3; rowSelect++)
                    {

                        for (columnSelect = 0; columnSelect <= 2; columnSelect++)
                        {
                            switch (columnSelect)
                            {
                                case 0:
                                    winCheck1 = GameBoard[columnSelect][ columnSelect];
                                    AIcolumnSelect1 = columnSelect;
                                    break;

                                case 1:
                                    winCheck2 = GameBoard[columnSelect][ columnSelect];
                                    AIcolumnSelect2 = columnSelect;
                                    break;

                                case 2:
                                    winCheck3 = GameBoard[columnSelect][ columnSelect];
                                    AIcolumnSelect3 = columnSelect;
                                    break;

                            }

                        }


                        if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                        {
                            if (winCheck1 != " ")
                            {
                                endOfGame = true;
                                letterToPutIn = winCheck1;
                            }
                        }

                        //this makes sure that the AI will only run if a letter has not been put in this round
                        else if (letterAlreadyPutIn || endOfGame)
                        {
                            winCheck1 = " ";
                            winCheck2 = " ";
                        }

                        //set of else ifs check for 2 in a row and put an O in the spot that is left over if there is one
                        else if (winCheck1 == winCheck2 && winCheck1 != " ")
                        {
                            if (GameBoard[AIcolumnSelect3][ AIcolumnSelect3] == " ")
                            {
                                GameBoard[AIcolumnSelect3][ AIcolumnSelect3] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }

                        else if (winCheck2 == winCheck3 && winCheck2 != " ")
                        {
                            if (GameBoard[AIcolumnSelect1][ AIcolumnSelect1] == " ")
                            {
                                GameBoard[AIcolumnSelect1][ AIcolumnSelect1] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }

                        else if (winCheck3 == winCheck1 && winCheck1 != " ")
                        {
                            if (GameBoard[AIcolumnSelect2][ AIcolumnSelect2] == " ")
                            {
                                GameBoard[AIcolumnSelect2][ AIcolumnSelect2] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }                       
                    }







                    //second diag check loop. Checks positive slope diagonal

                    for (rowSelect = 3; rowSelect <= 3; rowSelect++)
                    {

                        for (columnSelect = 3; columnSelect >= 1; columnSelect--)
                        {
                            switch (columnSelect)
                            {
                                case 0:
                                    winCheck1 = GameBoard[0][ 2];
                                    break;

                                case 1:
                                    winCheck2 = GameBoard[1][ 1];
                                    break;

                                case 2:
                                    winCheck3 = GameBoard[2][ 0];
                                    break;

                            }

                        }
                        

                        if (winCheck3 == winCheck2 && winCheck2 == winCheck1)
                        {
                            if (winCheck1 != " ")
                            {
                                endOfGame = true;
                                letterToPutIn = winCheck1;
                            }
                        }


                        //this makes sure that the AI will only run if a letter has not been put in this round
                        else if (letterAlreadyPutIn || endOfGame)
                        {
                            winCheck1 = " ";
                            winCheck2 = " ";
                        }

                        //set of else ifs check for 2 in a row and put an O in the spot that is left over if there is one
                        else if (winCheck1 == winCheck2 && winCheck1 != " ")
                        {
                            if (GameBoard[2][ 0] == " ")
                            {
                                GameBoard[2][ 0] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }

                        else if (winCheck2 == winCheck3 && winCheck2 != " ")
                        {
                            if (GameBoard[0][ 2] == " ")
                            {
                                GameBoard[0][ 2] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }

                        else if (winCheck3 == winCheck1 && winCheck1 != " ")
                        {
                            if (GameBoard[1][ 1] == " ")
                            {
                                GameBoard[1][ 1] = "O";
                                letterAlreadyPutIn = true;
                            }
                        }




                        
                    }







                //for loop to check see if board it is full

                for (columnSelect = 0; columnSelect <= 2; columnSelect++)
                {

                    for (rowSelect = 0; rowSelect <= 2; rowSelect++)
                    {
                        //increments variable every time an index in the board is an asterisk
                        if (GameBoard[columnSelect][ rowSelect] == " ")
                            gameBoardFull++;
                    }

                    //if there are no asterisks on the board, its full
                    if (gameBoardFull == 0 && columnSelect == 2)
                    {
                        tie = true;
                    }
                    
                }





                    //if there are no two in a rows, use a while loop and a pair of random numbers to put a letter in
                //random() rnd = new Random();
                    while (!letterAlreadyPutIn && checkLoopControl >=4)
                    {
                        //makes random numbers for entry
                        
                        AIcolumnSelectRandom = random(0, 3);
                        AIrowSelectRandom = random(0, 3);

        

                        //if statement to make this random place loop stop if there is a tie or win
                        if (tie || endOfGame)
                            letterAlreadyPutIn = true;

                        if (GameBoard[int(AIrowSelectRandom)][ int(AIcolumnSelectRandom)] == " ")
                        {
                            GameBoard[int(AIrowSelectRandom)][ int(AIcolumnSelectRandom)] = "O";
                            letterAlreadyPutIn = true;
                        }


                      
                    }

                    

                    
                }







                //resets asterisk counting variable so that it only counts the asterisks once per loop
                gameBoardFull = 0;
        
  
        
      }
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                //end of game message print and retry setup
                if(endOfGame){
                  textSize(100);
                  fill(0);
                  text(letterToPutIn + " won.", 200,300); 
                  
                  
                }
                
                else if(tie){
                  textSize(100);
                  fill(0);
                  text("Tie", 200, 300);
                }
                
                if((tie || endOfGame) && stop == 0){
                  
                  
                  //print restart choice
                  textSize(100);
                  text("Play again?", 50, 400);
                  text("Yes", 50,484);
                  text("No", 430,484);
                  
                  
                  //click on the side with the yes, reset variable
                                  
                  if(mousePressed && mouseX<300){
                    //resets win/ tie variables
                    tie = false;
                    endOfGame = false;
                    //resets board matrix
                    for (int rowSelect = 0; rowSelect<=2; rowSelect++)
                {
                       for (int columnSelect = 0; columnSelect <=2; columnSelect++)
                {
                    GameBoard[rowSelect][ columnSelect] = " ";
                }

                
                }
                    
                  }
                  
                  
                  
                  if (mousePressed && mouseX >300){
                    //add quit command in here, whatever that is
                  }
                  stop++;
                }
  
  
   if(!mousePressed){
   stop = 0;
 }
}