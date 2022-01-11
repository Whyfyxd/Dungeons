class DamageIncrease extends Items {

  DamageIncrease(int x, int y, int hps, int rx, int ry, int cost, String name) {
    super(x, y, hps, rx, ry, cost, name);
  }

  void show() {
    stroke(black);
    strokeWeight(2);
    fill(yellow);
    ellipse (loc.x, loc.y, 50, 50);
    fill(black);
    textSize(13);
    text(n, loc.x, loc.y);
    text("$"+c, loc.x, loc.y+50);
  }
}
