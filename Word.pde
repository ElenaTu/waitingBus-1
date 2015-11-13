class Word{
  int timeID;
  int locationID;
  int whatToDoID;
  String time[];
  String location[];
  String whatToDo[];
  
  Word(int ti,int loca,int doing){
    this.timeID = ti;
    this.locationID = loca;
    this.whatToDoID = doing;
    
    time = new String[11];
    location = new String[10];
    whatToDo = new String[3];
 
    for(int i = 0;i < 11 ;i++){
      time[i] = (i+8)+":00";
    }
    location[0] = "傳播學院";
    location[1] = "道藩樓";
    location[2] = "百年樓";
    location[3] = "季陶樓";
    location[4] = "國際大樓";
    location[5] = "藝文中心";
    location[6] = "自強宿舍";
    location[7] = "研總";
    location[8] = "六期球場";
    location[9] = "山上網球場";
  }
  
  void display(){
    
  }
}