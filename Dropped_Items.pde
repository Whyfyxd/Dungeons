class Items extends GameObject {

  Items() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 1;
    roomX = 1;
    roomY = 1;
  }

  Items(int x, int y, int hps, int rx, int ry) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    hp = hps;
    roomX = rx;
    roomY = ry;
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    ellipse (loc.x, loc.y, 50, 50);
    fill(black);
    textSize(20);
    text("item", loc.x, loc.y);
  }

  void act() {
    super.act();
  }
}
