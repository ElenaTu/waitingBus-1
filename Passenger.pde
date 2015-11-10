class Passenger{
  int passID;
  int lineState;
  int osState;
  String imgPath;
  PImage img;
  
  Passenger(int id,int line){
    this.passID = id;
    this.lineState = line;
    this.imgPath  = "data/"+passID+".png";
    this.img  = loadImage(imgPath);
  }
  
  void display(){
    //left line
    if(lineState == 0){
      image(this.img ,width/3-50,700);
      
    //right line
    }else if(lineState == 1){
      image(this.img ,width/3*2+50,700);
    }
  }
}
