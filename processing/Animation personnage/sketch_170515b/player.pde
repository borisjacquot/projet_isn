class Player {
  float x, y ;
  PImage spriteSheet;
  PImage [][] movement;
  boolean inMotion;
  int currentDirection;
  float currentFrame;
  final int UP = 0, LEFT = 1, DOWN = 2 , RIGHT = 3;
  
  Player() {
    inMotion = false;
    currentDirection = 1;
    currentFrame = 0 ;
    x = 300;
    y = 300; 
     setupSprites();
  }
 
      void setupSprites() {
        movement = new PImage[4][9];
        spriteSheet = loadImage("fullimage.png");
        for(int i = 0; i < 9; i++) {         
        movement[0][i] = spriteSheet.get(16 + 64 * i, 8, 32, 56);
        movement[1][i] = spriteSheet.get(16 + 64 * i, 72, 32, 56);  
        movement[2][i] = spriteSheet.get(16 + 64 * i, 136, 32, 56); 
        movement[3][i] = spriteSheet.get(16 + 64 * i, 200, 32, 56); 
        }
}

  void drawPlayer() {
     if(inMotion)
      image(movement[currentDirection][1 + int(currentFrame)], x, y);
      else 
      image(movement[currentDirection][1], x, y);

  }
  
  void updatePlayer(int xDelta, int yDelta){
    currentFrame = (currentFrame + 0.2) % 8;
    inMotion = true;
    
    if(xDelta == 0 && yDelta == 0)
      inMotion = false;
     else if(xDelta == -1)
      currentDirection = LEFT;
     else if(xDelta == 1)
      currentDirection = RIGHT;
     else if(yDelta == -1)
      currentDirection = UP;
     else if(yDelta == 1)
      currentDirection = DOWN;
     
    
    x = x + xDelta;
    y = y + yDelta;
  }  
}