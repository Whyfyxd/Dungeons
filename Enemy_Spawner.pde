class Spawner extends Enemy {

  Spawner(int x, int y, int rx, int ry) {
    super (x, y, 100, rx, ry);
  }
  void show() {
    stroke(black);
    strokeWeight(2);
    fill(purple);
    ellipse (loc.x, loc.y, 50, 50);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    //chasing movement code
    if (shotTimer > 120) {
      myObjects.add(new Follower((int)super.loc.x, (int)super.loc.y, roomX, roomY));
      shotTimer=0;
    }
  }
}
