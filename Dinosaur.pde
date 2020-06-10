class Dinosaur extends Enemy {

  float speed = 2f/2;
  float currentSpeed = speed;
  final float TRIGGERED_SPEED_MULTIPLIER = 5;
  int status=0;

  Dinosaur(float x, float y) {
    super(x, y);
  }

  void display() {

    pushMatrix(); 



    if (currentSpeed>0) {
      image(dinosaur, x, y);
    } else {
      scale(-1, 1); 
      image(dinosaur, -x-w, y);
    }
    popMatrix();
  }

  void update() {
    x += currentSpeed;

    //  if (x >= width-w) {


    //  if (DinosaurDetect(player)==true) {
    //  currentSpeed=speed*TRIGGERED_SPEED_MULTIPLIER*-1;
    //  }

    //  if (DinosaurDetect(player)==false) {
    //  currentSpeed=-speed;
    //  } 

    //  }



    //if (x<=0) { 

    //  if (DinosaurDetect(player)==true) {
    //    currentSpeed=speed*TRIGGERED_SPEED_MULTIPLIER;
    //  }

    //  if (DinosaurDetect(player)==false) {
    //  currentSpeed=speed;
    //  } 
    //}


    if (x >= width-w) {
      currentSpeed=-speed;
    }

    if (x<=0) { 
      currentSpeed=speed;
    }
    
     if (DinosaurDetect(player)==true) {
       if(player.x>x&& currentSpeed>0){
      currentSpeed=speed*TRIGGERED_SPEED_MULTIPLIER;
  }

  
      if(player.x<x && currentSpeed<0){
      currentSpeed=-speed*TRIGGERED_SPEED_MULTIPLIER;
  }
      
     }else{
   
       
    if(DinosaurDirect(x,y)){  
    currentSpeed=speed;
    }else{
    currentSpeed=-speed;
    }
    
  }
    
    
  }//update

  boolean DinosaurDetect(Player player) {
    if (player.row==floor(y/SOIL_SIZE)) {

      return true;
    } else {

      return false;
    }
  }
  
 boolean DinosaurDirect(float x,float y){
    if (currentSpeed>0) {
      return true;
    } else {
      return false;
    }
 
 } 


  // HINT: Player Detection in update()
  /*
	float currentSpeed = speed
   	If player is on the same row with me AND (it's on my right side when I'm going right OR on my left side when I'm going left){
   		currentSpeed *= TRIGGERED_SPEED_MULTIPLIER
   	}
   	*/
}
