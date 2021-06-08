void setup(){
  size(600,600);
  background(0);
  frameRate(4.5);
}

float t=0;//Time
float wall=0;//Barrier
int bar;//The largest distance between the source and a barrier/screen end
float shrink;//The size of the arc
float shrinkslit;//The size of the arc in the double slit
float slitpos;//  the postition of the slits
float str;//Storage to contain the value of the wave

void draw(){
  
  clear();
  strokeWeight(4);
  
  wall=mouseX;//the x value of the mouse on the sceen
  bar=(int)sqrt((float)(Math.pow((height/2),2)+(Math.pow(wall,2))));// c^2 = a^2 + b^2
  
  for (float pos=0;pos<(bar);pos+=8){//pos is the diameter of the circles from the source
    
    str=sin(radians((pos-t)*10));
   
    if (str>=0){//Ignoring the minimas since the background is black and the minimas are black
      stroke(255*str,0,0,125);
      fill(0,0,0,0);
    
      if (pos>(height*2)){
        shrink=(float)((Math.acos((height*2)/pos)));//if pos<(height*2) shrink=undefined
      }
      else{
        shrink=0;
      }
    
      arc(0,height/2,pos*2,pos*2,PI+HALF_PI+shrink,TWO_PI+HALF_PI-shrink);
      t++;
    }
  }
  
  stroke(0);
  fill(0);
  rect(wall,0,width-wall,height);//hiding the extra bits of the wave
  
  slitpos=mouseY;
  if (slitpos>300){
    bar=(int)sqrt((float)(Math.pow(height-slitpos+300,2)+(Math.pow(width-wall,2))));
  }
  else{
    bar=(int)sqrt((float)(Math.pow(height-slitpos,2)+(Math.pow(width-wall,2))));
  }
  
  for (float pos=0;pos<(bar);pos+=8){
    
    str=sin(radians((pos-t)*10));

    stroke(255*str,0,0,125);
    fill(0,0,0,0);
    
    if (pos>(slitpos*2)){
      shrink=(float)((Math.acos((slitpos*2)/pos)));
    }
    else if(pos>((height-slitpos)*2)){
      shrinkslit=(float)((Math.acos(((height-slitpos)*2)/pos)));
    }
    else{
      shrink=0;
      shrinkslit=0;
    }
    
    arc(wall,slitpos,pos*2,pos*2,PI+HALF_PI+shrink,TWO_PI+HALF_PI-shrinkslit);
    arc(wall,height-slitpos,pos*2,pos*2,PI+HALF_PI+shrinkslit,TWO_PI+HALF_PI-shrink);
    t++;
    
  }
  println(frameRate);
}
