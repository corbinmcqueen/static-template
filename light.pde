float x,y;
float easing=0.05;
void setup() {
   size(screenWidth, screenHeight);
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
   float dtMy=mouseY-height/2;
   line(x,height/2,mouseX,mouseY);
   for (int i=0;i<width;i++) {
      float yoff=height/2+(dtMy*sin((x/100)-i/100));
      stroke(255);
      
      point(i,yoff);
   }
   
}