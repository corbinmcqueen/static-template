/**
* Letters. 
* 
* Draws letters to the screen. This requires loading a font, 
* setting the font, and then drawing the letters.
*/

//PFont f;

String[] lines = loadStrings("text.txt");

//String[] lines = loadStrings("1kpi.txt.txt");

void setup() {
   size(screenWidth, screenHeight);
   background(0);
   
   // Create the font
   //printArray(lines.charAt.list());
   //f = createFont("SourceCodePro-Regular.ttf", 12);
   //textFont(f);
   textAlign(CENTER, CENTER);
   smooth();
   frameRate(3);
} 

void draw() {
   background(0);
   
   // Set the left and top margin
   int margin = 2;
   translate(margin*4, margin*4);
   //int i=0;
   int f = 0;
   float sums;
   int sum = sums;
   int gap = 16;
   int counter = 0;
   colorMode(RGB,255);
   for (int y = 0; y< height-gap; y += gap) {
      for (int x = 0;x< width-gap; x += gap) {
         //int f =0;
         char piDig = lines[f].charAt(counter);
         
         float sums = (sums+int(piDig));
         textSize(9+(int(piDig)));
         
         //fill(random(int(piDig),sums/int(piDig)),random(int(piDig),sums/int(piDig)),1000);
         // Draw the letter to the screen
         //stroke(random(0,255-random(0,255)));         
         //rect(x,y,int(piDig),int(piDig));
         fill(random(1,255),random(1,255),random(1,255));        
         text(piDig, x, y);
         
         
         //text(counter, x-12,y-5);
         // Increment the counter
         
         counter++;
      }
   }
   //text(counter,0-15,-15);
   //stroke(255);
   //line(-15,mouseY,width,mouseY);
   if (mousePressed == true) {
      saveFrame("line-######.png");
      save("/data/pi.png");
   }
}