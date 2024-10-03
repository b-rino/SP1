class Ball{
int ballColor;
float xpos;  //Declaring the instance variables 
float ypos;

  
Ball(int ballColor){ //Constructor which takes one argument
  this.ballColor = ballColor;
  this.xpos = width/2;               //I use a calculation with width and height instead of just giving the exact coordinates, so you can change the size of the sketch while it still spawns correctly
  this.ypos = height * 0.812;
}

void drawBall(){
  noStroke();
  fill(ballColor);  //The parameter of the constructor defines the initial color of the ball
  ellipse(xpos, ypos, width/13.5, height/13.5); //As above i used width and height calculation to make the program more resistant to changes in size of sketch
  
}

void moveBall(){     //Simple method for making the ball move according to which key is pressed
  if (keyPressed){
    if(keyCode == LEFT){
      xpos -= 5;
    } else if (keyCode == RIGHT){
      xpos += 5; 
    }
    xpos = constrain(xpos, 0 + (width/13.5) / 2, width -( width/13.5) / 2);  //making sure the ball can't go too far left or right
  }
}

void changeBallColor(){
  ballColor = color((int) random(255), (int) random(255), (int) random(255));  //color change to a random color
}

}
