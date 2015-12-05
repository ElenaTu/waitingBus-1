class Word{
  int timeID;
  int locationID;
  int whatToDoID;
  String time[];
  String location[];
  String whatToDo[];
  
  Word(int ti,int loca){
    this.timeID = ti;
    this.locationID = loca;
    
    time = new String[11];
    location = new String[11];
    whatToDo = new String[2];
 
    for(int i = 0;i < 11 ;i++){
      time[i] = (i+8)+":00";
    }
    location[0] = "傳播學院";
    location[1] = "道藩樓";
    location[2] = "百年樓";
    location[3] = "季陶樓";
    location[4] = "國際大樓";
    location[5] = "藝文中心";
    location[6] = "蔣公銅像";
    location[7] = "自強宿舍";
    location[8] = "研總";
    location[9] = "六期運動場";
    location[10] = "樟山寺平台";
    
    whatToDo[0] = "上課";
    whatToDo[1] = "找同學";
  }
  
  void display(){
    fill(255,255,255,220);
    ellipse(width/2,height/2+30,250,180);
    
    switch(passenger.passID){
      case 0:
        fill(0);
        textSize(40);
        text(time[word.timeID],width/2,height/2+20);
        text("到"+location[word.locationID],width/2,height/2+60);
        //text(whatToDo[0],width/2,height/2+80);
        break;
      
      case 1:
        fill(0);
        textSize(40);
        text(time[word.timeID],width/2,height/2+20);
        text("到"+location[word.locationID],width/2,height/2+60);
       // text(whatToDo[0],width/2,height/2+80);
        break;
        
      case 2:
        fill(0);
        textSize(40);
        text(time[word.timeID],width/2,height/2+20);
        text("到"+location[word.locationID],width/2,height/2+60);
       // text(whatToDo[0],width/2,height/2+80);
        break;
      
      case 3:
        fill(0);
        textSize(40);
        text("我是觀光客",width/2,height/2+10);
        text("想到"+location[word.locationID],width/2,height/2+50);
        text("參觀",width/2,height/2+90);
        break;
        
      case 4:
        fill(0);
        textSize(70);
        text("喵喵喵",width/2,height/2+50);
        break;
      
      case 5:
        fill(0);
        textSize(70);
        text("汪汪汪",width/2,height/2+50);
        break;
      
    
    }
  }
  
}
