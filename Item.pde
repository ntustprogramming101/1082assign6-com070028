class Item {
  boolean isAlive;
  float x, y;
  float w = SOIL_SIZE;
  float h = SOIL_SIZE;
  PImage img;


  Item(float x, float y) {
    isAlive = true;
    this.x = x;
    this.y = y;
  }//item

  void display(float x, float y ) {

    image(img, x, y, w, h);
  }//display
  
  void display() {
    image(img, x, y, w, h);
  }//display


  boolean checkCollision(Player player) {
    return  player.x + player.w > x &&    // a right edge past b left
      player.x < x + w &&    // a left edge past b right
      player.y + player.h > y &&    // a top edge past b bottom
      player.y < y + h 

      ?true:false;
  }//boolean
  
  void onIsAlive() {
      if (img==cabbage && player.health < player.PLAYER_MAX_HEALTH ) {

         player.health++;
        isAlive=false;
      }
      if (img==clock ) {
        addTime(CLOCK_BONUS_SECONDS);
         isAlive=false;         
        
      }

  }//void

}//class
