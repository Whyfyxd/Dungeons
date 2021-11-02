void game() {
  drawRoom();
  drawGameObjects();

  //drawLightLayer();
  //drawMiniMap();
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
  rect(width/2, height/2, width*0.855, height*0.8);

  //pause code
  if (pause) {
    mode = PAUSE;
  }
}

void drawGameObjects() {
  //gameObjects act and show code
  int i =0;
  while (i < myObjects.size()) {
    GameObject obj = myObjects.get(i);
    DarknessCell dc = darkness.get(i);
    obj.show();
    obj.act();
    dc.show();
    if (obj.hp <=0) {
      myObjects.remove(i);
    } else {
      i++;
    }
  }
}

void gameClicks() {
}
