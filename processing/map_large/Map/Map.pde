int partie=0;    
int xbox=800;       //largeur boite ( Mettre valeur X de size()  )
int ybox=800;      //hauteur boite  ( Mettre valeur Y de size()  )
PImage level1;
PImage level2;
PImage level3;
PImage menu;

void setup()
{
 size(800,800);
 background(255);
 menu = loadImage("menu.png");
 MessMort = loadImage("MessMort.png");
 Perso = loadImage("persobas2.png");
 level1=loadImage("level1v2.jpg");
}

void draw()
{
  level1();
  mondeDrawGRILLE();
  mort();
  deplacement();
  //ennemi();
  vie();
 }