float easing=0.05;
int steps=3;
float t=0;
float mw, mh, mx, my;
float x;
void setup() {
   size(screenWidth, screenHeight);
   frameRate(30);
   colorMode(RGB,255,255,255,100);
}

void draw() {
   background(0);
   float wstep= (width/steps);
   float hstep=(height/steps);
   
   if (abs(mouseX - mx) > 0.1) {
      mx = mx + (mouseX - mx) * easing;
   }
   if (abs(mouseY - my) > 0.01) {
      my = my + (mouseY- my) * easing;
   }
   
   mx = constrain(mx,width*1/3-mw,width-width*1/3);
   my = constrain(my, height*0.25, height - 100);
   
   mw=constrain((width/2-mx),-1,1)/t;
   mh=constrain(height/2-my,-75,75);
   
   
   
   
   //float targetX = mouseX;
   //float dx = targetX - mw;
   //mw += dx * easing;
   
   //float targetY = mouseY;
   //float dy = targetY - mh;
   //mh += dy * easing;
   
   
   //float x=0;
   float y=0;
   
   stroke(128,128,128,30);
   //beginShape(POINTS);
   //vertex(mw,mh)
   line(width/2,height/2,mx,my);
   
   //for (float t=0;t<steps;t+=1){
      
      for (float w=0;w<width;w++){
         
         for (float h=0;h<steps;h++){
            x=w;
            y=mh*sin((mw/t)+(0.5*t));
            //vertex(x,y);
            stroke(y,255-y,255-y,255-y);         
            point(x,y+height/2);
            
            stroke(255,abs(y),abs(y),abs(y));
            point(x,height/2-y);
            line(x,height/2-y,x,y+height/2);
            stroke(abs(y),abs(y),abs(y),abs(y));
            //line(x,0,x,height/2-y);
            //stroke(255,255-abs(y));
            //line(x,height,x,height-height/2-y);
            //endShape();
            t+=0.01;
            x+=1;
            
         }
         
         
         //vertex(width,my);
         
         //t-=0.01;
      }
      if (x>width){
         //t=0;
         x=0;
      }
      
      
      //}
   }