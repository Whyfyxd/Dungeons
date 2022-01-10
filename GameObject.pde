class GameObject {
  //GameObjects Class

  //commonly Used Variables
  PVector loc;
  PVector vel;
  int hp, roomX, roomY, size;

  GameObject() {
    //Variable initiation
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    hp = 1;
  }
  void show() {
  }
  void show1() {
  }

  void act() {
    //movement code
    loc.add(vel);

    if (loc.x < width*0.095) loc.x = width*0.095;
    if (loc.x > width*0.905) loc.x = width*0.905;
    if (loc.y < height*0.098) loc.y = height*0.098;
    if (loc.y > height*0.86) loc.y = height*0.86;
  }
}
