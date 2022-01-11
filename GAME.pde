void game() {
  drawRoom();
  drawGameObjects();
  //drawLightLayer();
  drawMiniMap();
}

void drawRoom() {
  //room code
  background(Lbrown);

  //draw exits
  //first part
  northRoom = map.get(myHero.roomX, myHero.roomY-1);
  eastRoom = map.get(myHero.roomX+1, myHero.roomY);
  southRoom = map.get(myHero.roomX, myHero.roomY+1);
  westRoom = map.get(myHero.roomX-1, myHero.roomY);

  //part two
  fill(255);
  if (northRoom != #FFFFFF) {
    ellipse(width/2, height*0.088, 200, 200);
  }
  if (eastRoom != #FFFFFF) {
    ellipse(width*0.95, height/2, 200, 200);
  }
  if (southRoom != #FFFFFF) {
    ellipse(width/2, height*0.92, 200, 200);
  }
  if (westRoom != #FFFFFF) {
    ellipse(width*0.05, height/2, 200, 200);
  }
  fill(0);
  if (northRoom == #000000) {
    ellipse(width/2, height*0.088, 200, 200);
  }
  if (eastRoom == #000000) {
    ellipse(width*0.95, height/2, 200, 200);
  }
  if (southRoom == #000000) {
    ellipse(width/2, height*0.92, 200, 200);
  }
  if (westRoom == #000000) {
    ellipse(width*0.05, height/2, 200, 200);
  }


  //corners
  stroke(black);
  strokeWeight(4);
  line(0, 0, width-(width*0.855), height-(height*0.8));
  line(width, height, width*0.855, height*0.8);
  line(width, 0, width*0.855, height-(height*0.8));
  line(0, height, width-(width*0.855), height*0.8);

  //floor
  rectMode(CENTER);
  stroke(brown);
  fill(green);
  if (myHero.roomX == 4 && myHero.roomY == 4) {
    fill(black);
  }
  rect(width/2, height/2, width*0.855, height*0.8);

  //pause code
  if (pause) {
    mode = PAUSE;
  }
  fill(black);

  fill(black);
  textSize(100);
  text("Gold: "+myHero.coins, width-330, 50);
}

void drawGameObjects() {
  //gameObjects act and show code
  int i =0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    if (obj.roomX == myHero.roomX && obj.roomY == myHero.roomY) {
      obj.show();
      obj.act();
    }
    if (obj.hp <=0) {
      myObjects.remove(i);
      if (obj instanceof Turret) {
        int rando = (int) random(0, 2);
        if (rando == 1 && myHero.SniperRifle == false) {
          myObjects.add(new Sniper((int)obj.loc.x, (int)obj.loc.y, 1, obj.roomX, obj.roomY));
        }
        myHero.coins += 5;
        Gold = new Text("+5 Gold", (int)obj.loc.x, (int)obj.loc.y-50, black, 25, font);
        Gold.show();
      }
      if (obj instanceof Follower) {
        int rando1 = (int) random(0, 2);
        if (rando1 == 1  && myHero.AssultRifle == false) {
          myObjects.add(new AR((int)obj.loc.x, (int)obj.loc.y, 1, obj.roomX, obj.roomY));
        }
        myHero.coins += 1;
        Gold = new Text("+1 Gold", (int)obj.loc.x, (int)obj.loc.y-50, black, 25, font);
        Gold.show();
      }
      if (obj instanceof Spawner ) {
        int rando1 = (int) random(0, 2);
        if (rando1 == 1 && myHero.ShotGUN == false) {
          myObjects.add(new Shotgun((int)obj.loc.x, (int)obj.loc.y, 1, obj.roomX, obj.roomY));
        }
        myHero.coins += 10;
        Gold = new Text("+10 Gold", (int)obj.loc.x, (int)obj.loc.y-50, black, 25, font);
        Gold.show();
      }
    }
    i++;
  }
}

void drawLightLayer() {
  int i =0;
  while (i < darkness.size()) {
    DarknessCell dk = darkness.get(i);
    dk.show();
    i++;
  }
}

void drawMiniMap() {
  float size = 20;
  int x = 0;
  int y = 0;
  while (y<map.height) {
    color c = map.get(x, y);
    noStroke();
    fill(c, 150);
    if (x == myHero.roomX && y == myHero.roomY) {
      strokeWeight(5);
      stroke(black);
      fill(brown, 150);
    }
    square(x*size+40, y*size+40, size);
    x += 1;
    if (x >= map.width) {
      x=0;
      y=y+1;
    }
  }
  darkness.add(new DarknessCell(x, y, size));
}
void gameClicks() {
}
