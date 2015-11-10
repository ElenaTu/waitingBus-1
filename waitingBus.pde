PImage BG,busFront,busSide;
PImage boy,girl,teacher,visitor,cat,dog;
PImage waitingBtn,goAwayBtn,changeLineBtn,getOncBusBtn;

PFont myFont;

final int GAME_START   = 0;
final int GAME_INTRO   = 1;
final int GAME_PLAYING = 2;
final int GAME_END     = 3;

final int BUS_1 = 0;
final int BUS_2 = 1;
final int BUS_3 = 2;

final int LEVEL_1 = 0;
final int LEVEL_2 = 1;
final int LEVEL_3 = 2;

Passenger passenger;
Bus bus;

int gameState,levelState;
int score;
int lifeNum;
int countDown;
int currentTime,startTime;

boolean change;

void setup(){
  size(640,1000);
  background(100,100,100);
  imageMode(CENTER);
  textAlign(CENTER);
 
  //load images
  BG            = loadImage("data/background.png");
  busFront      = loadImage("data/busFront.png");
  busSide       = loadImage("data/busSide.png");
  cat           = loadImage("data/4.png");
  waitingBtn    = loadImage("data/buttonA.png");
  goAwayBtn     = loadImage("data/buttonB.png");
  changeLineBtn = loadImage("data/buttonB.png");
  getOncBusBtn  = loadImage("data/buttonB.png");
  
  myFont = createFont("微軟正黑體",100);
  
  image(BG,width/2,420);
  
  textFont(myFont);
  reset();
  gameState = GAME_PLAYING;
  
}

void draw(){
  switch(gameState){
    case GAME_START:
      fill(119,91,60);
      textSize(100);
      text("Welcome",width/2,height/2);

      break;
      
    case GAME_INTRO:
  
      break;
    
    case GAME_PLAYING:
      image(busFront,width/4*3,450,225,195);
      
      
     
      
      if(change){
        passenger = new Passenger(int(random(0,6)),int(random(0,2)));
        bus = new Bus(int(random(0,3)));
        change = false;
      }
      
      
      passenger.display();
      bus.display();
      
      
      showBtn();
      showLife();
      showTime();
      showScore();
      break;
    
    case GAME_END:
      fill(119,91,60);
      textSize(80);
      text("SCORE:"+score,width/2,height/2);
      break;
    
  }    
}

void mouseClicked(){
  switch(gameState){
    case GAME_START:
      if(mouseX > 310 && mouseX < 438 &&
         mouseY > 357 && mouseY < 407){
        gameState = GAME_PLAYING;
      }
      if(mouseX > 310 && mouseX < 438 &&
         mouseY > 357 && mouseY < 407){
        gameState = GAME_INTRO;
      }
      break;
      
    case GAME_INTRO:
      if(mouseX > 310 && mouseX < 438 &&
         mouseY > 357 && mouseY < 407){
        gameState = GAME_PLAYING;
      }
      break;
    
    case GAME_PLAYING:
    
      break;
    
    case GAME_END:
      if(mouseX > 310 && mouseX < 438 &&
         mouseY > 357 && mouseY < 407){
        reset();
        gameState = GAME_PLAYING;
      }
      break;
      
  } 
}


//show playing items

void showBtn(){
  image(waitingBtn   ,width/5*1-30,900,120,60);
  image(goAwayBtn    ,width/5*2-10,900,120,60);
  image(changeLineBtn,width/5*3+10,900,120,60);
  image(getOncBusBtn ,width/5*4+30,900,120,60);
}

void showLife(){
  fill(230, 74, 96);
  noStroke();
  textSize(50);
  text("LIFE:",width/5,80);
  for(int life = 0 ;life < lifeNum ;life++){
    ellipse(width/3+(50*life),60,40,40);
  }
}


void showTime(){
  fill(0,115,109);
  textSize(20);
  text("COUNTDOWN",width/3-20,135);
  textSize(80);
  text(nf(10, 2),width/3-20,210);
  textSize(15);
  text("second(s)",width/3+15,230);
}

void showScore(){
  fill(0,115,109);
  textSize(30);
  text("SCORE",width/3*2,135);
  textSize(100);
  text(score,width/3*2,230);
}

void reset(){
  lifeNum = 3;
  score   = 0;
  currentTime = 0;
  startTime   = 0;
  change = true;
};


