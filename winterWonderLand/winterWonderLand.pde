Snow[] flakes = new Snow[2000]; //Creating an array than holds up to 2000 instances of the object Snow in global scope, as it's used in different methods
ToxicSnow[] toxicFlakes = new ToxicSnow[500]; ////Creating an array that holds up to 500 instances of the object ToxicSnow in global scope, as it's used in different methods
color colorBackground = color(108, 117, 214); //The inital background color of the program is initialized in global scope, as the variable is used in different methods
Ball movingBall; //declaring a variable of type Ball in global scope as it's used in different methods

void setup(){
 greeting("Signe"); //Calling method greeting() which takes a String argument
 frameRate(50); //frames per second is now 50 to make the speed of the program balanced
 size(800,800); //size of display window set
 smooth(); //to draw all geometry with smooth edges
 movingBall = new Ball(0); //Initializing movingBall with 0 as argument which makes the color of the ball black
 for(int j = 0; j <toxicFlakes.length; j++){ //for loop to iterate through toxicFlakes array and initalizing all of them
  toxicFlakes[j] = new ToxicSnow(); 
 }
 for(int i = 0; i < flakes.length; i++){ //for loop to iterate through flakes array and initalizing all of them
  flakes[i] = new Snow();
}
}

void draw(){
  //Background, drawGround and drawSun are all called in the draw method, as we need to refresh the background continously to make a proper animation
  background(colorBackground);
  drawGround();
  drawSun();
  
  //foreach loop iterating over flakes array calling the drawSnow method on each one
  for(Snow flake : flakes){  
    flake.drawSnow();
  }                 
 
 //for loop iterating over toxicFlakes array calling the drawToxicSnow method and if collisionCheck method is true then calling the changeBallColor method 
  for(int j = 0; j < toxicFlakes.length; j++){ 
  toxicFlakes[j].drawToxicSnow();
  if(collisionCheck(toxicFlakes[j])){
    movingBall.changeBallColor();
  }
}
  //drawBall and moveBall methods are called on our Ball instance "movingBall"
  movingBall.drawBall();
  movingBall.moveBall();
  
  //changeBackgroundColor is called in draw, as it needs to be refreshed continuously 
  changeBackgroundColor();
  
}









//Method for checking the distance between the movingBall and each toxicFlake with a bool as return value and ToxicSnow as parameter
boolean collisionCheck(ToxicSnow flakeCollision){
 float distance = dist(movingBall.xpos, movingBall.ypos, flakeCollision.x, flakeCollision.y);
 if(distance < ((width /13.5 / 2) + (15 / 2))){   // (width/13.5/2) is half the size of the movingBall. (15/2) is half the size of a ToxicFlake
   return true;
 }else{
   return false;
 }
}

String greeting(String name){   //greeting method which expects a name between 1 and 15 characters
  if(name.length() < 1 || name.length() > 15){
  println("Please choose a name with a minimum of one and a maximum of fifteen characters");
  }else{
 println("Welcome to Winter Wonder Land " + name + " :)");
 println("You can move the ball by using the left and right arrow on your keyboard!");
 println("Avoid touching the toxic snow flakes or you might get infected!");
  }
 return name;
}

void drawGround(){ //simple draw method 
 noStroke();
 fill(255);
 rect(0, height*0.85, width, height); //width and height calculation is used to make the program more resistant to changes in size of sketch
}

void drawSun(){ //simple draw method 
  noStroke();
  fill(233, 255, 0);
  arc(width, 0, width *0.4, height * 0.4, 0, PI); //width and height calculation is used to make the program more resistant to changes in size of sketch
}
  

  //Method with a switch for changing background color to pre-chosen colors for every 200th frame (4 seconds) using a switch
  void changeBackgroundColor(){ 
  switch(frameCount){
    case 200:
      colorBackground = color(135, 219, 154);
      break;
    case 400:
    colorBackground = color(229, 175, 237);
     break;
     case 600:
     colorBackground =  color(209, 144, 120);
     break;
     case 800:
     colorBackground =  color(108, 117, 214);
     frameCount = 0;
     break;
  }
  }
  
