class Sniper extends Items {

  Sniper(int x, int y, int hps, int rx, int ry) {
    super(x, y, hps, rx, ry);
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    ellipse (loc.x, loc.y, 50, 50);
    fill(black);
    textSize(13);
    text("Sniper \n Rifle", loc.x, loc.y);
  }
}
