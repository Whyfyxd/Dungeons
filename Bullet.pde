class Bullet extends GameObject {
  //bullet code

  int timer;

  Bullet(float x, float y, float h, int p) {
    roomX=myHero.roomX;
    roomY=myHero.roomY;
    timer = p;
    hp = 1;
    loc = new PVector (myHero.loc.x, myHero.loc.y);
    vel = new PVector (x, y);
    vel.setMag(h);
    size = 10;
  }

  void show() {
    stroke (0);
    noFill ();
    ellipse (loc.x, loc.y, size, size);
  }

  void act() {
    loc.add(vel);

    if (loc.x < width*0.07)   hp=0;
    if (loc.x > width*0.93)   hp=0;
    if (loc.y < height*0.098) hp=0;
    if (loc.y > height*0.9)   hp=0;

    //bullet decay code
    timer--;
    if (timer == 0) {
      hp=0;
    }
  }
}
