class Hero extends GameObject {
  //Hero Class

  //Variables
  float speed;
  int weaponWheel, face, inv, invThresh, coins;
  Boolean AssultRifle, ShotGUN, SniperRifle;


  Hero() {
    //Variable initiations
    loc = new PVector (width/2, height/2);
    vel = new PVector (0, 0);
    hp = 5;
    coins = 0;
    weaponWheel = 1;
    face = 1;
    speed = 7;
    roomX = 1;
    roomY = 1;
    size = 80;
    invThresh = 180;
    inv = 0;
    AssultRifle = false;
    ShotGUN = false;
    SniperRifle = false;
    Pistol = new Weapon(25, 13, 1, 40, 0, 80, 100);
    AR = new Weapon(10, 15, 1, 20, 0, 90, 2);
    Sniper = new Weapon(60, 30, 1, 0, 0, 100, 12 );
    Shotgun = new Weapon(45, 18, 10, 50, 3, 30, 1);

    //animation gif initiation
    heroGIF = new AnimatedGIF(6, "heroGIF/frame_", "_delay-0.08s.gif", loc.x, loc.y, 160, 160, 10);
    heroGIFreversed = new AnimatedGIF(6, "heroGIFreversed/frame_", "_delay-0.08s.gif", loc.x, loc.y, 160, 160, 10);
    gun = new AnimatedGIF(2, "gunGIF/frame_", "_delay-0.2s.gif", loc.x, loc.y+10, 70, 70, 4);
    gunReversed = new AnimatedGIF(2, "gunGIFreversed/frame_", "_delay-0.08s.gif", loc.x, loc.y+10, 70, 70, 4);
  }

  void show() {
    //Hero

    if (a) {
      heroGIFreversed.show();
      gunReversed.show();
    } else if (d) {
      heroGIF.show();
      gun.show();
    }
    if (face == 1) {
      heroGIFreversed.show();
      gunReversed.show();
    } else if (face == 2) {
      heroGIF.show();
      gun.show();
    } else {
      heroGIFreversed.show();
      gunReversed.show();
    }
  }

  void act() {
    //interaction code
    super.act();
    inv++;

    //hero location updating code
    heroGIF.x = loc.x;
    heroGIF.y = loc.y;
    heroGIFreversed.x = loc.x;
    heroGIFreversed.y = loc.y;
    gun.x = loc.x;
    gun.y = loc.y+10;
    gun.moving = false;
    gunReversed.x = loc.x;
    gunReversed.y = loc.y+10;
    gunReversed.moving = false;

    //stoping the gif when not moving code
    if (vel.y <= 1 && vel.y >= -1 && vel.x <=1 && vel.x >= -1) {
      heroGIF.moving = false;
      heroGIFreversed.moving = false;
    } else {
      heroGIF.moving = true;
      heroGIFreversed.moving = true;
    }

    //movement plus berd face which side code
    if (w) vel.y = -speed;
    if (a) {
      vel.x = -speed;
      face = 1;
    }
    if (s) vel.y = speed;
    if (d) {
      vel.x = speed;
      face = 2;
    }

    //counter straife code
    if (a && d) {
      vel.x = 0;
      face = 3;
    }
    if (w && s) vel.y = 0;

    //diagonal speedup remover code
    if (vel.mag() > speed)
      vel.setMag(speed);

    //glide remover code
    if (!w && !s) vel.y = vel.y * 0.91;
    if (!a && !d) vel.x = vel.x * 0.91;

    //check exits
    //north
    if (northRoom != #FFFFFF && loc.y <= height*0.088+11 && loc.x >= width/2-100 && loc.x <= width/2+100) {
      roomY--;
      loc = new PVector (width/2, height*0.92-66);
    }
    //east
    if (eastRoom != #FFFFFF && loc.x >= width*0.95-87 && loc.y >= height/2-100 && loc.y <= height/2+100) {
      roomX++;
      loc = new PVector (width*0.05+88, height/2);
    }
    //south
    if (southRoom != #FFFFFF && loc.y >= height*0.92-65 && loc.x >= width/2-100 && loc.x <= width/2+100) {
      roomY++;
      loc = new PVector (width/2, height*0.088+12);
    }
    //west
    if (westRoom != #FFFFFF && loc.x <= width*0.05+87 && loc.y >= height/2-100 && loc.y <= height/2+100) {
      roomX--;
      loc = new PVector (width*0.95-88, height/2);
    }

    //weapon swap code
    if (one) {
      weaponWheel = 1;
    }
    if (two && AssultRifle) {
      weaponWheel = 2;
    }
    if (three && SniperRifle) {
      weaponWheel = 3;
    }
    if (four && ShotGUN) {
      weaponWheel = 4;
    }

    //weapon swap code continued and gun gif updating code
    //Pistol
    if (weaponWheel == 1) {
      Pistol.update();
      if (space) {
        Pistol.shoot();
        gun.moving = true;
        gun.playback = 9;
        gunReversed.moving = true;
        gunReversed.playback = 9;
      }
    }
    //AR
    if (weaponWheel == 2) {
      AR.update();
      if (space) {
        AR.shoot();
        gun.moving = true;
        gun.playback = 4;
        gunReversed.moving = true;
        gunReversed.playback = 4;
      }
    }
    //sniper
    if (weaponWheel == 3) {
      Sniper.update();
      if (space) {
        Sniper.shoot();
        gun.moving = true;
        gun.playback = 28;
        gunReversed.moving = true;
        gunReversed.playback = 28;
      }
    }
    //shotgun
    if (weaponWheel == 4) {
      Shotgun.update();
      if (space) {
        Shotgun.shoot();
        gun.moving = true;
        gun.playback = 23;
        gunReversed.moving = true;
        gunReversed.playback = 23;
      }
    }

    //invincibility circle code
    if (inv<=invThresh) {
      noFill();
      stroke (255, 0, 0);
      strokeWeight(5);
      circle (loc.x, loc.y, 80);
    }

    //hero and enemy collision code
    int i = 0;
    while (i < myObjects.size()) {
      GameObject myObj = myObjects.get(i);
      if (myObj instanceof enemyBullet) {
        if (myHero.inv >= myHero.invThresh && myObj.roomX == roomX && myObj.roomY == roomY) {
          if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + myObj.size/2) {
            myObj.hp = 0;
            hp -=1;
            inv=0;
            background(255, 0, 0);
          }
        }
      }
      if (myObj instanceof AR) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + 25) {
          AssultRifle = true;
          myObj.hp = 0;
        }
      }
      if (myObj instanceof Sniper) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + 25) {
          SniperRifle = true;
          myObj.hp = 0;
        }
      }
      if (myObj instanceof Shotgun) {
        if (dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y) <= size/2 + 25) {
          ShotGUN = true;
          myObj.hp = 0;
        }
      }
      i++;
    }
  }
}
