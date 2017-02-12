
int xbox=500;       //largeur boite ( Mettre valeur X de size()  )
int ybox=500;      //hauteur boite  ( Mettre valeur Y de size()  )
int ymur=25;      // hauteur y du bas des murs du haut
int epmur=10;    //epaisseur des murs
int hmurg=50;    //hauteur mur gauche
void setup()
{
 size(500,500); 
}

void draw()
{
 level1();
}

void level1()
{
  fill(255);
  rect(hmurg,ymur,xbox-101,ybox-(76-ymur)); //fond sol
  fill(0);  
  line(xbox-(hmurg),ymur,xbox-epmur,epmur);             // arrete mur haut droit  BUG
  line(epmur,epmur,hmurg,ymur);                              // arrete mur haut gauche
  line(hmurg,xbox-25,epmur,xbox-epmur);                     // arrete mur bas gauche
  line(xbox-hmurg,ybox-25,xbox,ybox-5);                    // arrete mur bas droit
  noStroke();
  fill(0);
  rect(0,0,xbox,epmur);        // haut mur haut
  rect(0,0,epmur,ybox);       //haut mur Gauche
  rect(0,ybox-epmur,xbox,epmur);    //haut mur Haut
  rect(xbox-epmur,0,epmur,ybox);   //haut mur Droit
}