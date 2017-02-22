int vie=100;
int deg_lave=1;
int barrevie;
PImage MessMort;

void vie()
{ 
  if(vie>0)
  {
    barrevie=vie;
  }
  if(vie<=0)
  {
    barrevie=0;
    image(MessMort,xbox/3,ybox/6); 
  }
  fill(0);
  rect(10,80,40,50);
  fill(#ff0000);
  textSize(15);
  text("Vie",20,100);
  text(barrevie,18,120);
  
}