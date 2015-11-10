class Bus{
  int busID;
  
  Bus(int id){
    this.busID = id;
  }
  
  void display(){
    textSize(40);
    if(busID == BUS_1){
      text("一路",width/4*3,440);
    }else if(busID == BUS_2){
      text("二路",width/4*3,440);
    }else if(busID == BUS_3){
      text("三路",width/4*3,440);
    }
  }
 
}
