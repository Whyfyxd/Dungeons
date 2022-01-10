class Enemy extends GameObject {

  int shotTimer, threshold;

  Enemy() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    roomX = 1;
    roomY = 1;
  }

  Enemy(int x, int y, int hps, int rx, int ry) {
    loc = new PVector(x, y);
    vel = new PVector(0, 0);
    hp = hps;
    roomX = rx;
    roomY = ry;
    shotTimer=0;
    threshold=50;
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
    shotTimer++;

    //enemy and hero collision code
    if (myHero.inv >= myHero.invThresh) {
      if (dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= size/2 + myHero.size/2) {
        myHero.hp -= 1;
        myHero.inv = 0;
        background(255, 0, 0);
      }
    }

    //enemy and bullet collision
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof Bullet && myObj.roomX == roomX && myObj.roomY == roomY) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= 25 + 5) {
          myObj.hp = 0;
          if (myHero.weaponWheel == 1) {
            hp -= Pistol.damage;
          }
          if (myHero.weaponWheel == 2) {
            hp -= AR.damage;
          }
          if (myHero.weaponWheel == 3) {
            hp -= Sniper.damage;
          }
          if (myHero.weaponWheel == 4) {
            hp -= Shotgun.damage;
          }
        }
      }
      i++;
    }
  }
}
