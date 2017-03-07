int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
int ymur=25;      // hauteur y du bas des murs du haut
int epmur=10;    //epaisseur des murs
int hmurg=50;   //hauteur mur gauche
int hmurd = xbox-hmurg; // epaisseur mur droit
PImage Perso;
int persoX=100,persoY=100;


PImage soldetypeherbique;
PImage bordure;
PImage canapeplante;
PImage murpobon;
PImage lac;
PImage muret;



void setup()
{
 size(500,500);
 Perso = loadImage("linkmarche.png");
 
 lac = loadImage("lac.png");
 soldetypeherbique = loadImage("soldetypeherbique.png");
 bordure = loadImage("rangeedarbre.png");
 canapeplante= loadImage("canapeplante.png");
 murpobon= loadImage("murpobon.png");
 }

void draw()
{
 environnement();
 //mondeDrawGRILLE();
 position();
 deplacement();
 }

void position() 
{
  image(Perso,persoX-Perso.width,persoY-Perso.height);
}

void environnement()
{
  int soldetypeherbiqueX=hmurg+1;
  int soldetypeherbiqueY=ymur+1;
  
  image(soldetypeherbique,soldetypeherbiqueX,soldetypeherbiqueY);
  image(soldetypeherbique,soldetypeherbiqueX+100,soldetypeherbiqueY);
  image(soldetypeherbique,soldetypeherbiqueX+200,soldetypeherbiqueY);
  image(lac,soldetypeherbiqueX+300,soldetypeherbiqueY);
  
  image(bordure,soldetypeherbiqueX-100,soldetypeherbiqueY+50);
  image(bordure,soldetypeherbiqueX-100,soldetypeherbiqueY+150);
  image(bordure,soldetypeherbiqueX-100,soldetypeherbiqueY+250);
  image(bordure,soldetypeherbiqueX-100,soldetypeherbiqueY+350);
  image(bordure,soldetypeherbiqueX-100,soldetypeherbiqueY+450);
  image(bordure,soldetypeherbiqueX,soldetypeherbiqueY+450);
  image(bordure,soldetypeherbiqueX+100,soldetypeherbiqueY+450);
  image(bordure,soldetypeherbiqueX+200,soldetypeherbiqueY+450);
  image(bordure,soldetypeherbiqueX+300,soldetypeherbiqueY+450);
  image(bordure,soldetypeherbiqueX+400,soldetypeherbiqueY+450);
  
  image(soldetypeherbique,soldetypeherbiqueX,soldetypeherbiqueY+100);
  image(soldetypeherbique,soldetypeherbiqueX+100,soldetypeherbiqueY+100);
  image(soldetypeherbique,soldetypeherbiqueX+200,soldetypeherbiqueY+100);
  
  image(soldetypeherbique,soldetypeherbiqueX+300,soldetypeherbiqueY+106);
  
  image(soldetypeherbique,soldetypeherbiqueX,soldetypeherbiqueY+200);
  image(soldetypeherbique,soldetypeherbiqueX+100,soldetypeherbiqueY+200);
  image(soldetypeherbique,soldetypeherbiqueX+200,soldetypeherbiqueY+200);
  image(soldetypeherbique,soldetypeherbiqueX+300,soldetypeherbiqueY+200);
  image(soldetypeherbique,soldetypeherbiqueX,soldetypeherbiqueY+300);
  image(soldetypeherbique,soldetypeherbiqueX+100,soldetypeherbiqueY+300);
  image(soldetypeherbique,soldetypeherbiqueX+200,soldetypeherbiqueY+300);
  image(soldetypeherbique,soldetypeherbiqueX+300,soldetypeherbiqueY+300);
  image(soldetypeherbique,soldetypeherbiqueX,soldetypeherbiqueY+350);
  image(soldetypeherbique,soldetypeherbiqueX+100,soldetypeherbiqueY+350);
  image(soldetypeherbique,soldetypeherbiqueX+200,soldetypeherbiqueY+350);
  image(soldetypeherbique,soldetypeherbiqueX+300,soldetypeherbiqueY+350);
 
}