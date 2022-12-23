ArrayList<stamp> times = new ArrayList<stamp>();
int sec;
ArrayList<passes> nontimes = new ArrayList<passes>();
float txs;
float mx,my;
int optN;
ArrayList<intervals> spans = new ArrayList<intervals>();
int tSync;
int iSync;
int dfilter;
int fil;
int tL;
void setup() {
   size(screenWidth, screenHeight);
   sec=second();
   optN=2;
   fil=1;
   
   //smooth(2);
}

void draw() {
   
   background(0);
   txs=15;
   textSize(txs);
   int yess=0;
   int added=0;
   
   if(mousePressed==true){
      mx= mouseX;
      my= mouseY;
      point(mx,my);
   } else {
      mx=-1;
      my=-1;
   }
   String ft = ""+ month()+"\/"+day()+"\/"+year()+" "+hour()%12+"\:"+minute()+"\:"+second()+"";
   
   
   String time = month()+""+day()+""+year()+""+hour()%12+""+minute()+""+second()+"";
   
   menu();
   text(iSync, width/3,txs);
   fill(255);
   textSize(1.3*txs);
   text("The Time",txs/2,height/3-1.5*txs);
   textSize(txs);
   text(time,txs,height/3+2*txs);
   textSize(1.2*txs);
   fill(100,100,255);
   text(ft,txs,height/3+0.5*txs);
   textSize(1.3*txs);
   fill(255);
   text("Digit Counter",txs/2,height/2-3.5*txs);
   
   fill(96,128);
   rect(0,height/3-3*txs,width/2,height/4+2*txs,0,20,20,0);
   line(0,height/3+4*txs,width/2,height/3+4*txs);
   rect(width-width/2+txs,0,width/2,height,20,0,0,20);
   stroke(255,100);
   line(width-width/2+4*txs,0,width-width/2+4*txs,height);
   textSize(txs);
   
   
   for(int i = 0;i< time.length();i++){
      
      fill(255);
      int dig = time.charAt(i);
      if(dig<=optN){
         
         
         yess=yess+1;
         fil=-time.length()+yess;
         text(yess,1+yess*txs,(height/2)+dig+1*txs);
         text(dig,1+yess*txs,(height/2)-2*txs);
         //println(time+" " +dig);
      } else {
         
         fill(255,0,0,255);
         text(dig,1+dig*txs,(height/2)+2*txs);
      }
   }
   if(sec!=second()){
      sec=second();
      added=0;
      iSync+=1;
      if((yess==time.length())&&added==0){
         //println(time);
         
         times.add(ft);
         added=1;
         
         tSync=0;
         
         //times.add(time);
         
      } else {
         
         tSync+=1;
         spans.add(tSync);
         nontimes.add(ft);
      }
      if(tSync!=0){
         iSync=0;
      }
      //tSync=0; 
   }
   for(int j=1;j<times.size();j++){
      fill(0,255,0);
      float scroll=1*dist(mouseX,my,mouseX,height);
      text(j,width/2+2*txs,height-(j*txs));
      //V text(j,width-textWidth(times.get(j))-3*txs,height-(j*txs));
      
      text(times.get(j),width-textWidth(times.get(j))-txs,height-(j*txs));
      
      if(times.size()>59){
         times.remove(0);
      }
   }
   for(int k=1;k<nontimes.size();k++){
      fill(255,txs*k);
      text(nontimes.get(k),txs,height-k*txs);
      //tSync=sec;
      if(nontimes.size()>-1+height/2.25/txs){
         nontimes.remove(0);
      }
   }
   for(int l=1;l<spans.size();l++){
      fill(255);
      text(spans.get(l),width/3,txs+(txs*l));
      
      if(spans.size()>10){
         spans.remove(0);
      }
   }
   //ms(mx,my);
   
}

void ms(float ox, float oy, float dx, float dy,int id){
   boolean bounded=false; if(mousePressed==true&&second()!=sec){
      if(mx<dx&&mx>ox&&my<dy&&my>oy){
         //println(second());
         bounded=true;
         //sec=second();
         return bounded;
      }
   }
   //return false;
   //bounded=false;
}

void filterDig(){
   
   fill(255-fil,100);
   rect(0,5*txs,6*txs,3*txs,0,5,5,0);
   text("Limit "+iSync+", "+fil,txs,7*txs);
   
   if(fil!=0){
      //println(dfilter); 
      fil+=1;
      fil=fil%14;
      
   }
   
}


void optionsMenu(){
   fill(255,100);
   rect(0,txs,6*txs,3*txs,0,5,5,0);
   stroke(255,100);
   text("Digits<"+optN,txs,3*txs);
   if(ms(0,txs,6*txs,3*txs,1)==true){
      optN+=1;
      optN=optN%10;
      spans.clear();
      tSync=0;
      times.clear();
      
      //fill(sec*3,255);
      //rect(width/4,height/4,width-width*0.75,height-height*0.75);
   }
   
}

void menu(){
   optionsMenu();
   filterDig();
}


