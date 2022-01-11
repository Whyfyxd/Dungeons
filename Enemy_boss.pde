class boss extends Enemy {

  boss(int x, int y, int rx, int ry) {
    super (x, y, 250, rx, ry);
  }
  void show() {
    stroke(black);
    strokeWeight(2);
    fill(purple);
    ellipse (loc.x, loc.y, 100, 100);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();

    vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(2);
    
    //spawning code
    if (shotTimer > 120) {
      myObjects.add(new Minions((int)super.loc.x, (int)super.loc.y, roomX, roomY));
      shotTimer=0;
    }
  }
}
