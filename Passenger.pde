class Passenger{
  int passID;
  int lineStatus;
  String imgPath;
  PImage img;
  
  Passenger(int id,int line){
    this.passID = id;
    this.lineStatus = line;
    this.imgPath  = "data/"+passID+".png";
    this.img  = loadImage(imgPath);
  }
  
  void display(){
    //left line
    if(lineStatus == 0){
      image(this.img ,width/3-50,700);
      
    //right line
    }else if(lineStatus == 1){
      image(this.img ,width/3*2+50,700);
    }
  }
}