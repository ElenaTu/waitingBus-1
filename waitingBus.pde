PImage BG, busFront, busSide, info;
PImage boy, girl, teacher, visitor, cat, dog;
PImage waitingBtn, goAwayBtn, changeLineBtn, getOncBusBtn;

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
Word word;

int gameState, levelState;
int score;
int lifeNum;
int countDown;
int currentTime, startTime;



boolean change;
boolean intro=false;

void setup() {
  size(640, 1000);
  background(100, 100, 100);
  imageMode(CENTER);
  rectMode(CENTER);
  ellipseMode(CENTER);
  textAlign(CENTER);
  noStroke();

  //load images
  BG            = loadImage("data/background.png");
  busFront      = loadImage("data/busFront.png");
  busSide       = loadImage("data/busSide.png");
  cat           = loadImage("data/4.png");
  waitingBtn    = loadImage("data/buttonA.png");
  goAwayBtn     = loadImage("data/buttonC.png");
  changeLineBtn = loadImage("data/buttonB.png");
  getOncBusBtn  = loadImage("data/buttonD.png");
  info          = loadImage("data/info.png");

  myFont = createFont("微軟正黑體", 100);
  textFont(myFont);

  image(BG, width/2, 420);

  reset();
  gameState = GAME_START;
}

void draw() {
  switch(gameState) {
  case GAME_START:
    background(100);
    image(BG, width/2, 420);
    fill(119, 91, 60);
    textSize(100);
    text("Welcome", width/2, height/2);
    rect(width/2, height/2+120, 250, 100, 5);
    rect(width/2, height/2+240, 250, 100, 5);
    textSize(80);
    fill(255);
    text("PLAY", width/2, height/2+150);
    text("INTRO", width/2, height/2+270);
    break;

  case GAME_INTRO:
    background(100);
    image(info, width/2, 420);
//    if(mouseClicked())
//    {
//    intro=true;
//    fill(0);
//    rect(width/2, height/2+120, 250, 100, 5);
//    textSize(40);
//    fill(255);
//    text("PLAY", width/2, height/2+150);
//    }
    break;

  case GAME_PLAYING:
    background(100);
    image(BG, width/2, 420);
    image(busFront, width/4*3, 450, 225, 195);

    if (change) {
      passenger = new Passenger(int(random(0, 6)), int(random(0, 2)));
      bus = new Bus(int(random(0, 3)));
      word =new Word(int(random(0, 11)), int(random(0, 10)));
      change = false;
      //println(passenger.passID+" "+passenger.lineStatus+" "+word.locationID);
    }

    passenger.display();
    bus.display();
    word.display();

    showBtn();
    showLife();
    showTime();
    showScore();

    checkEnd();
    break;

  case GAME_END:
    background(100);
    image(BG, width/2, 420);
    fill(119, 91, 60);
    textSize(80);
    text("SCORE:"+score, width/2, height/2);
    rect(width/2, height/2+120, 250, 100, 5);
    textSize(40);
    fill(255);
    text("PLAY AGAIN", width/2, height/2+150);
    break;
  }
}



void mouseClicked() {
  switch(gameState) {
  case GAME_START:
    if (mouseX > width/2-100 && mouseX < width/2+100 &&
      mouseY > height/2+70 && mouseY < height/2+170) {
      gameState = GAME_PLAYING;
      startTime=millis();
    }
    if (mouseX > width/2-100  && mouseX < width/2+100 &&
      mouseY > height/2+190 && mouseY < height/2+290) {
      gameState = GAME_INTRO;
    }
    break;

  case GAME_INTRO:
    gameState = GAME_PLAYING;
    startTime=millis();
    
    break;

  case GAME_PLAYING:
    checkMatch();
    break;

  case GAME_END:
    if (mouseX > width/2-100 && mouseX < width/2+100 &&
      mouseY > height/2+70 && mouseY < height/2+170) {
      reset();
      gameState = GAME_PLAYING;
      startTime=millis();
    }
    break;
  }
}


//show playing items

void showBtn() {
  image(waitingBtn, width/5*1-30, 900, 120, 60);
  image(goAwayBtn, width/5*2-10, 900, 120, 60);
  image(changeLineBtn, width/5*3+10, 900, 120, 60);
  image(getOncBusBtn, width/5*4+30, 900, 120, 60);
}

void showLife() {
  fill(230, 74, 96);
  noStroke();
  textSize(50);
  text("LIFE:", width/5, 80);
  for (int life = 0; life < lifeNum; life++) {
    ellipse(width/3+(50*life), 60, 40, 40);
  }
}


void showTime() {
  int restTime = int(countDown/1000-(millis()-startTime)/1000);
  fill(0, 115, 109);
  textSize(20);
  text("COUNTDOWN", width/3-20, 135);
  textSize(80);
  text(nf(restTime, 2), width/3-20, 220);
  textSize(15);
  text("second(s)", width/3+15, 230);
  if ( restTime <= 0 ) {
    startTime = millis();
    change=true;
    lifeNum --;
  }
}

void showScore() {
  fill(0, 115, 109);
  textSize(30);
  text("SCORE", width/3*2, 135);
  textSize(100);
  text(score, width/3*2, 230);
}

void reset() {
  lifeNum = 3;
  score   = 0;
  startTime = 0;
  countDown = 10000;
  change = true;
}


void checkMatch() {

  //button1 繼續等
  if (mouseX > width/5-90 && mouseX < width/5+60 && 
    mouseY > 870        && mouseY < 930) {

    //學生老師
    if (passenger.passID <= 2) {
      //來一路,坐二路三路
      if (bus.busID == 0 &&
        passenger.lineStatus == 0 &&
        word.locationID >= 7 &&
        word.locationID <= 10) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //來二路,坐一路
      else if (bus.busID == 1 &&
        passenger.lineStatus == 1 &&
        word.locationID <= 6) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //來二路,坐三路
      else if (bus.busID == 1 &&
        passenger.lineStatus == 0 &&
        word.locationID >= 8) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //來三路,坐一路
      else if (bus.busID == 2 &&
        passenger.lineStatus == 1 &&
        word.locationID <= 6 ) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //來三路,坐二路
      else if (bus.busID == 2 &&
        passenger.lineStatus == 0 &&
        word.locationID == 7 ) {
        score += 1;
        change = true;
        startTime = millis();
      } else {
        lifeNum --;
        change = true;
        startTime = millis();
      }
    }
    //觀光客&動物們  
    else if (passenger.passID >= 3) {
      lifeNum --;
      change = true;
      startTime = millis();
    }
  }

  //button2 不能搭
  if (mouseX > width/5*2-90 && mouseX < width/5*2+60 && 
    mouseY > 870          && mouseY < 930) {
    //觀光客&動物們
    if (passenger.passID >= 3) {
      score += 1;
      change = true;
      startTime = millis();
    } else {
      lifeNum --;
      change = true;
      startTime = millis();
    }
  }

  //button3 換排
  if (mouseX > width/5*3-90 && mouseX < width/5*3+60 && 
    mouseY > 870          && mouseY < 930) {

    //學生老師
    if (passenger.passID <= 2) {
      //一路
      if (passenger.lineStatus == 0 &&
        word.locationID <= 6) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //二路
      else if (passenger.lineStatus == 1 &&
        word.locationID == 7) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //三路
      else if (passenger.lineStatus == 1 &&
        word.locationID >= 8 &&
        word.locationID <= 10 ) {
        score += 1;
        change = true;
        startTime = millis();
      } else {
        lifeNum --;
        change = true;
        startTime = millis();
      }
    }
    //觀光客&動物們
    else if (passenger.passID >= 3) {
      lifeNum --;
      change = true;
      startTime = millis();
    }
  }



  //button4 上車
  if (mouseX > width/5*4-90 && mouseX < width/5*4+60 && 
    mouseY > 870          && mouseY < 930) {

    //學生老師
    if (passenger.passID <= 2) {
      //一路
      if (bus.busID == 0 &&
        passenger.lineStatus == 1 &&
        word.locationID <= 6) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //二路
      else if (bus.busID == 1 &&
        passenger.lineStatus == 0 &&
        word.locationID == 7) {
        score += 1;
        change = true;
        startTime = millis();
      }
      //三路
      else if (bus.busID == 2 &&
        passenger.lineStatus == 0 &&
        word.locationID >= 8 &&
        word.locationID <= 10 ) {
        score += 1;
        change = true;
        startTime = millis();
      } else {
        lifeNum --;
        change = true;
        startTime = millis();
      }
    }  

    //觀光客&動物們  
    else if (passenger.passID >= 3) {
      lifeNum --;
      change = true;
      startTime = millis();
    }
  }
}

void checkEnd() {
  if (lifeNum <= 0) {
    gameState = GAME_END;
  }
}

