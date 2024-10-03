class Snow{
  
  //Making sure in these instance variables that each Snow instances are spawning in different places so it can represent real snow
  int x = (int) random(0, width);  
  int y = (int) random(-10000, 0);
  
  Snow(){
   
  }
  
  void drawSnow(){
  noStroke();
  fill(255, 255, 255); //white color
  ellipse(x, y, 15, 15); //the snow's size is hard coded to 15, because it doesn't need to be as resistant to changes in size as the other surroundings
  if(y < height * 0.85){ //Makes the snow drop towards the ground. This "normal" snow will go 1% lower before resetting compared to the ToxicSnow, as I think it looks more natural
  y++;
  }
  else{
    y = (int) random(-10000, 0); //When the snow hits the ground it will once again spawn somewhere between the top of the window and 10000 on y-axis above the window
  }
}
}
