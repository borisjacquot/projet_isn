int enX=200;    //posX ennemi
int enY=300;    //posY ennemi
int endetect=100;
int enRay=endetect/2;
int enVit=1;
void ennemi()
{
  fill(255);
  rect(enX,enY,10,10);
  fill(20,130,15,50);
  ellipse(enX+5,enY+5,endetect,endetect);      // zone de detection
  
 if(persoX>(enX+5)-enRay && persoY>(enY+5)-enRay && persoX<enX+5 && persoY<enY+5)        // haut gauche ray detect
  {
    if(persoX<=enX+5)
    {
    enX=enX-enVit;
    }
    if(persoY<=enY+5)
    {
    enY=enY-enVit;
    }
  }
  if(persoX>(enX+5)-enRay && persoY<(enY+5)+enRay && persoX<enX+5 && persoY>enY+5)        // bas gauche ray detect
  {
    if(persoX<=enX+5)
    {
    enX=enX-enVit;
    }
    if(persoY>=enY+5)
    {
    enY=enY+enVit;
    }
  }
  
 if(persoX<(enX+5)+enRay && persoY>(enY+5)-enRay && persoX>enX+5 && persoY<enY+5)        // haut droit ray detect
  {
    if(persoX>=enX+5)
    {
    enX=enX+enVit;
    }
    if(persoY<=enY+5)
    {
    enY=enY-enVit;
    }
  }
  if(persoX<(enX+5)+enRay && persoY<(enY+5)+enRay && persoX>enX+5 && persoY>enY+5)        // bas droit ray detect
  {
    if(persoX>=enX+5)
    {
    enX=enX+enVit;
    }
    if(persoY>=enY+5)
    {
    enY=enY+enVit;
    }
  }
  if(persoX==enX+5 && persoY<enY+5)
  {
    enY=enY-enVit;
  }
  if(persoY==enY+5 && persoX<enX+5)
  {
   enX=enX-enVit; 
  }
  if(persoX==enX+5 && persoY>enY+5)
  {
    enY=enY+enVit;
  }
  if(persoY==enY+5 && persoX>enX+5)
  {
   enX=enX+enVit; 
  }
  
  
}