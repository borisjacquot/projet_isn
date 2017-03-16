int partie=0;    
int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
PImage level1;
PImage level2;
PImage level3;
PImage menu;

void setup()
{
 size(800,800);

 
 menu = loadImage("Menu.jpg");
 MessMort = loadImage("MessMort.png");
 Perso = loadImage("linkmarche.png");
 Perso.resize(30,30);
 level1=loadImage("level1.jpg");
 level1.resize(800, 800);
 level2=loadImage("level2.jpg");
 level2.resize(800, 800);
 level3=loadImage("level3.jpg");
 level3.resize(800, 800);
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
       mort();
       deplacement();
       //ennemi();
       vie();     
    }
      
    if(partie==2)
    {
     level2();
     mondeDrawGRILLE2();
     mort();
     deplacement();
     vie();
    }
    if(partie==3)
    {
     level3();
     mondeDrawGRILLE3();
     mort();
     deplacement();
     vie();
    }
 }