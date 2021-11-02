class Hero extends GameObject {
  //Hero Class

  //Variables
  float speed;
  int roomX, roomY;

  Hero() {
    //Variable initiations
    super();
    speed = 7;
    roomX = 1;
    roomY = 1;
    heroGIF = new AnimatedGIF(6, "heroGIF/frame_", "_delay-0.25s.gif", loc.x, loc.y, 160, 160, 8);
  }

  void show() {
    //Hero
    heroGIF.show();
  }

  void act() {
    //interaction code
    super.act();

    heroGIF.x = loc.x;
    heroGIF.y = loc.y;

    if (vel.y <= 1 && vel.y >= -1 && vel.x <=1 && vel.x >= -1) {
      heroGIF.moving = false;
    } else {
      heroGIF.moving = true;
    }


    if (w) vel.y = -speed;
    if (a) vel.x = -speed;
    if (s) vel.y = speed;
    if (d) vel.x = speed;

    //counter straife code
    if (a && d) vel.x = 0;
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
    if (southRoom != #FFFFFF && loc.y >= height*0.92-65 && loc.x >= width/2-100 && loc.x <= width/2+100) {
      roomY++;
      loc = new PVector (width/2, height*0.088+12);
    }
    if (westRoom != #FFFFFF && loc.x <= width*0.05+87 && loc.y >= height/2-100 && loc.y <= height/2+100) {
      roomX--;
      loc = new PVector (width*0.95-88, height/2);
    }
  }
}
