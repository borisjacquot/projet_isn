int partie=0;
PImage level;
PImage menu;


void setup()
{
 size(800,800);
 
 menu = loadImage("menu.png");
 Perso = loadImage("persobas2.png");
 level=loadImage("level.jpg");
 level.resize(800, 800);
}
void draw()
{
  //Menu
  if(partie==0)
  {
  image(menu,0,0);
  }
   if (keyPressed || partie==0)    //lancer partie 
   {
   if (key == ENTER)
    {
      partie=1;            
    }
   }
   
    if(partie==1)
    {
       level1();
       mondeDrawGRILLE();
       deplacement();  
       enigme();
       vie();
       mort();
    }
 }