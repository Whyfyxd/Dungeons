class Weapon {

  int shotTimer;
  int threshold;
  int bulletSpeed;
  int bulletc;
  int inaccuracy;
  int psra;
  int existenceTimer;
  int damage;

  Weapon (int thr, int ps, int count, int inc, int psr, int timer, int dmg) {
    shotTimer = 0;
    threshold = thr;
    bulletSpeed = ps;
    bulletc = count;
    inaccuracy = inc;
    psra = psr;
    existenceTimer = timer;
    damage = dmg;
  }

  void update() {
    shotTimer++;
  }

  void shoot() {
    if (shotTimer >= threshold) {
      int i=0;
      while (i<bulletc) {
        PVector aimVector = new PVector((mouseX+random(-inaccuracy, inaccuracy))-myHero.loc.x, (mouseY+random(-inaccuracy, inaccuracy))-myHero.loc.y);
        myObjects.add(new Bullet(aimVector.x, aimVector.y, bulletSpeed+random(0, psra), existenceTimer));
        i++;
      }
      shotTimer = 0;
    }
  }
}
