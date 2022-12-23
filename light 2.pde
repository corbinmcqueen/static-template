float x,y;
float easing=0.05;
void setup() {
   size(screenWidth, screenHeight);
colorMode(HSB,1000);
}

void draw() {
   background(0);
   
   float targetX = mouseX;
   float dx = targetX - x;
   x += dx * easing;
   
   float targetY = mouseY;
   float dy = targetY - y;
   y += dy * easing;
   
   stroke(255);
   line(0,height/2,width,height/2);
   
   float dtMy=y-height/2;
   line(x,height/2,mouseX,y);
 
   float yoff=height/2;
   
   
   //strokeWeight(bandGap%bands);
   for (float bands=0;bands<yoff/10;bands++) {
  float bandGap=(yoff/bands)/yoff-abs(dtMy);
      for (int i=0;i<width;i++) {
         
         float yfunc=(((dtMy*sin(((x*bands/100))-((i+bands)/100)))));
//float bandColor = color((dtMy/1000)*360/yfunc,500,100+1000/bands);
float bandColor = color((1000*bands+yfunc)/360,1*yfunc,10*360/width/yfunc%yfunc+bands*(x-i/yoff));
         
         //float yoff=yoff+bandGap-bands;
         stroke(bandColor);
         //beginShape(POINTS); 
         //vertex(i,height/2);
//if (bands>0 && bandGap/bands <bands) {
         point(i,yoff-yfunc/bands);
         //vertex(i,-yoff);
         //endShape(); 
         //}
         // line(i,yoff,i,yoff);
         
         // line(i,yoff,i,y);
         
      }
      //endShape(); 
   }
}