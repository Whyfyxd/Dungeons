class Follower extends Enemy {

  Follower(int x, int y, int rx, int ry) {
    super (x, y, 15, rx, ry);
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
    vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(5);
  }
}
