class enemyBullet extends GameObject {
  //bullet code

  int timer;
  PVector nudge;

  enemyBullet(float x, float y, float vx, float vy, int rx, int ry) {
    roomX=rx;
    roomY=ry;
    timer = 85;
    hp = 1;
    loc = new PVector (x, y);
    vel = new PVector (vx, vy);
    vel.setMag(10);
    size = 10;
  }

  void show() {
    stroke (255);
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
