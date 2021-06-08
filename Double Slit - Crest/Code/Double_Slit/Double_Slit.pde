

void setup(){
  size(600,600);
  background(255);
}
int t=0;//Time
int m =0;//Distance between the wave front and the slit ("movement")
float w=0;//Magnitude of the "wave"
float theta = 10.3; //lambda/(distance between slits)

void draw(){
  clear();
  background(255);
  //rect(200,600,205,605);
  for (int i=0;i<600;i+=3){
      w = cos(radians((i-t)*10));
    //if (w>0) {
      stroke(255*w,0,0,125);
      strokeWeight( 4 );
      if (i<200){
        if (w>0) {
          line(i,0,i,600);//The incoming wave
        }
      }
        fill(0,0);
        m = (i*2)-36;
        arc(200,400,m,m,radians(270+theta),radians(450-theta));//Slit 1
        arc(200,200,m,m,radians(270+theta),radians(450-theta));//Slit 2
      //arc(200,400,i*2,i*2,radians(270+40),radians(450-40));
    //}
  }
  t+=5;
}
