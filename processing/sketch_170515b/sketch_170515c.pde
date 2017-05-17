
boolean [] keys ;
Player player;

void setup() {
  size(600, 600);
  player = new Player();
  keys = new boolean[128];
}

void draw(){
  background(0);
  move();
  player.drawPlayer();
}

void move() {
  int xDelta = 0;
  int yDelta = 0;
  
  if(keys['z'])
    yDelta--;
    if(keys['s'])
    yDelta++;
    if(keys['q'])
    xDelta--;
    if(keys['d'])
    xDelta++;
    
    player.updatePlayer(xDelta,yDelta);
}

void keyPressed() {
  keys[key] = true;
}
    
void keyReleased() {
  keys[key] = false;
}