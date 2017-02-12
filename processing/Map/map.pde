int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
int ymur=25;      // hauteur y du bas des murs du haut
int epmur=10;    //epaisseur des murs
int hmurg=50;   //hauteur mur gauche

int persoX=100,persoY=100;
PImage Perso;

void setup()
{
 size(500,500);
 Perso = loadImage("linkmarche.png");
}

void draw()
{
 level();
 mondeDrawGRILLE();
 position();
 deplacement();
 }


void level()
{
  fill(255);
  rect(hmurg+1,ymur+1,xbox-100,ybox-(75-ymur)); //fond sol
  line(hmurg,ymur,xbox-hmurg,ymur);
  fill(0);
  line(hmurg,ymur,xbox-hmurg,ymur);
  line(hmurg,ymur,hmurg,xbox-25);
  line(xbox-(hmurg),ymur,xbox-epmur,epmur);        // arrete mur haut droit
  line(epmur,epmur,hmurg,ymur);                   // arrete mur haut gauche
  line(hmurg,xbox-25,epmur,xbox-epmur);          // arrete mur bas gauche
  line(xbox-hmurg,ybox-25,xbox,ybox-5);         // arrete mur bas droit
  noStroke();
  fill(0);
  rect(0,0,xbox,epmur);              // haut mur haut
  rect(0,0,epmur,ybox);             //haut mur Gauche
  rect(0,ybox-epmur,xbox,epmur);    //haut mur Haut
  rect(xbox-epmur,0,epmur,ybox);   //haut mur Droit
}
void position() 
{
  image(Perso,persoX-Perso.width,persoY-Perso.height);
}