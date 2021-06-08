int num =500;

int maxdistx = 5;
int mindistx = -5;
int vardistx = 0;

int maxdisty = 5;
int mindisty = -5;
int vardisty = 0;

int maxspeed = 10;
int minspeed = 5;
int varspeed = 0;

float[] ax = new float[num];
float[] ay = new float[num]; 

float[] bx = new float[num];
float[] by = new float[num]; 

float[] sa = new float[num];

float[] ta = new float[num];

void setup(){
  size(600,600);
  background(0);
  for(int i=0;i<num;i++){
    //ax[i]=(float)Math.floor(Math.random()*200)+200;
    //ay[i]=(float)Math.floor(Math.random()*250)+300;
    ax[i]=(float)Math.floor(Math.random()*600);
    ay[i]=(float)Math.floor(Math.random()*600);
  }
  
  for(int i=0;i<num;i++){
      bx[i]=(float)(Math.random()*6)-3;
      by[i]=(float)(Math.random()*6)-3;
  }
  
  for(int i=0;i<num;i++){
      sa[i]=(float)Math.floor(Math.random()*20)+5;
  }
  
  for(int i=0;i<num;i++){
      ta[i]=0;
  }
  
}

void draw() {
  clear();
  stroke(255);
  
  for(int i=0;i<num;i++){
    point(ax[i]+(bx[i]*sin(radians(ta[i]))),ay[i]+(by[i]*sin(radians(ta[i]))));
    ta[i]= ta[i]+sa[i];
    if (ta[i] >= 90){
      
      ax[i]=ax[i]+bx[i];
      ay[i]=ay[i]+by[i];
      
      bx[i]=(float)(Math.random()*(maxdistx-mindistx+vardistx))+mindistx;
      by[i]=(float)(Math.random()*(maxdisty-mindisty+vardisty))+mindisty;
      
      sa[i]=(float)Math.floor(Math.random()*(maxspeed-minspeed+varspeed))+minspeed;
      
      ta[i]=0;
    }
  }
}
