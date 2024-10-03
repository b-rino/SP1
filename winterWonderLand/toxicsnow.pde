//Only a few changes from the Snow class. Look in Snow class for more in-depth comments.

class ToxicSnow{
  
  int x = (int) random(0, width); 
  int y = (int) random(-10000, 0);
  
  ToxicSnow(){
   
  }
  
  void drawToxicSnow(){
  noStroke();
  fill((int)random(255), (int)random(255), (int)random(255));  //fill with random color 
  ellipse(x, y, 15, 15);
  if(y < height * 0.84){ //resets 1% earlier than normal snow to make a proper animation
  y++;
  }
  else{
    y = (int) random(-10000, 0);
  }
}
} 
  
