class Robot extends Enemy {
  // Requirement #5: Complete Dinosaur Class

  float speed = 2f;
  final int PLAYER_DETECT_RANGE_ROW = 2;
  final int LASER_COOLDOWN = 180;
  final int HAND_OFFSET_Y = 37;
  final int HAND_OFFSET_X_FORWARD = 64;
  final int HAND_OFFSET_X_BACKWARD = 16;

  float laserTimer;
  Laser laser;
  
  Robot(float x, float y) {
    super(x, y);
    laser = new Laser();
    
  }



  void display() {

    pushMatrix(); 
    if (speed>0) {
      image(robot, x, y);
    } else {
      scale(-1, 1); 
      image(robot, -x-w, y);
    }
    popMatrix();
  }

  void update() {  

    //boudary reverse
    x += speed;
    if (RobotXDetection(player)==true && RobotYDetection(player)==true) {
      speed=0;
      
          
          laser.fire(this.x, this.y, player.x, player.y);
          laser.isAlive=true;
          laser.display();
          laser.update();
          laserTimer++;
          
    } else {

      if (x >= width-w) {
        speed*=-1;
      }
      if (x <= 0) {
        speed*=-1;
      }
    }

  }//update


  boolean RobotYDetection(Player player) {
    if (player.row-2<=floor(y/SOIL_SIZE) && floor(y/SOIL_SIZE)<=player.row+2) {

      return true;
    } else {

      return false;
    }
  }

  boolean RobotXDetection(Player player) {
    if (player.x>x && speed>0 || player.x<x&&speed<0  ) {

      return true;
    } else {

      return false;
    }
  }

  boolean RobotDirect() {

    if (player.x>x || player.x<x  ) {

      return true;
    } else {

      return false;
    }
  }


  void Trigger(Laser laser){
  
         laser.isAlive=true;
          laser.fire(this.x, this.y, player.x, player.y);
          laser.display();
          laser.update();
          laserTimer++;
  }//trigger
  

  // HINT: Player Detection in update()
  /*

   	boolean checkX = ( Is facing forward AND player's center point is in front of my hand point )
   					OR ( Is facing backward AND player's center point (x + w/2) is in front of my hand point )
   
   
   	if(checkX AND checkY){
   		Is laser's cooldown ready?
   			True  > Fire laser from my hand!
   			False > Don't do anything
   	}else{
   		Keep moving!
   	}
   
   	*/
}
