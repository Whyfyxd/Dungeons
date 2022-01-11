//Andy Zhang
//DUNGEONS

//keyboard input
boolean w, a, s, d, space, pause, one, two, three, four, enemyKilled;

//colors
color blue     = #1EE7FB;
color green    = #C3F83C;
color pink     = #F1416B;
color purple   = #C981E6;
color yellow   = #FFF387;
color Dgray    = #1C0F00;
color Dbrown   = #6B4F00;
color brown    = #98761D;
color Lbrown   = #B9A87D;
color black    = #000000;
color white    = #FFFFFF;

//mode framework variables
int mode;
final int INTRO = 0;
final int GAME = 1;
final int PAUSE = 2;
final int GAMEOVER = 3;
final int WIN = 4;

//GIFs
AnimatedGIF introGIF;
AnimatedGIF heroGIF;
AnimatedGIF heroGIFreversed;
AnimatedGIF gun;
AnimatedGIF gunReversed;

//Images
PImage map;
color northRoom, eastRoom, southRoom, westRoom;

//effects
int textAngle; //shrink and grow text
PFont font;

//Game Objects
ArrayList<GameObject> myObjects;
ArrayList<DarknessCell> darkness;
Hero myHero;
Weapon Pistol, AR, Sniper, Shotgun;

//mouse inputs
boolean mouseReleased;
boolean wasPressed;

//buttons
Button startButton;
Button resumeButton;
Button restartButton;

//texts
Text introText;
Text pauseText;
Text winText;
Text Gold;

void setup() {
  fullScreen();

  //Alignments
  textAlign(CENTER, CENTER);
  rectMode(CENTER);
  imageMode(CENTER);

  //Load Fonts
  font = createFont("IniyaDisplay-ow0Ra.otf", 200);

  //Load GIFs
  introGIF = new AnimatedGIF(89, "gameGif/frame_", "_delay-0.1s.gif", 1);

  //Load Images
  map = loadImage("map.png");

  //Create Objects
  myObjects = new ArrayList<GameObject> (1000);
  myHero = new Hero();
  myObjects.add(myHero);



  //create darkness
  darkness = new ArrayList<DarknessCell> ();
  float size = 50;
  int x = 0;
  int y = 0;
  while (y<height) {
    darkness.add(new DarknessCell(x, y, size));
    x += size;
    if (x >= width) {
      x=0;
      y+=size;
    }
  }

  //Loading enemies on the map
  x = 0;
  y = 0;
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == pink) {
      int rando = (int) random(0, 3);
      if (rando == 1) {
        myObjects.add(new Follower(width/2, height/2, x, y));
        myObjects.add(new Follower(width/2, height/2-100, x, y));
        myObjects.add(new Follower(width/2, height/2+100, x, y));
      }
      if (rando == 2) {
        myObjects.add(new Follower(width/2, height/2, x, y));
        myObjects.add(new Follower(width/2, height/2-100, x, y));
        myObjects.add(new Follower(width/2, height/2+100, x, y));
      }
      if (rando == 0) {
        myObjects.add(new Follower(width/2-100, height/2-100, x, y));
        myObjects.add(new Follower(width/2+100, height/2-100, x, y));
        myObjects.add(new Follower(width/2-100, height/2+100, x, y));
        myObjects.add(new Follower(width/2+100, height/2+100, x, y));
      }
    }
    if (roomColor == purple) {
      myObjects.add(new Turret(width/2+150, height/2-150, x, y));
      myObjects.add(new Turret(width/2+150, height/2+150, x, y));
      myObjects.add(new Turret(width/2-150, height/2-150, x, y));
      myObjects.add(new Turret(width/2-150, height/2+150, x, y));
    }
    if (roomColor == blue) {
      myObjects.add(new boss(width/2, height/2, x, y));
     // myObjects.add(new Spawner(width/2, height/2, x, y));
    }
    if (roomColor == black) {
      myObjects.add(new boss(width/2, height/2, x, y));
    }
    if (roomColor == yellow) {
        myObjects.add(new noSpread(( width/2)-100, (height/2), 1, x, y, 25, "scope"));
        myObjects.add(new DamageIncrease(( width/2)+100, (height/2), 1, x, y, 45, "+Damage"));
        myObjects.add(new BulletSpeed(( width/2), (height/2), 1, x, y, 15, "+BSpeed"));
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }

  //mode framework setup
  mode = INTRO;
  //mode = GAMEOVER;
  //mode = WIN;
  //mode = GAME;
}

void draw() {

  //mode framework
  if (mode == INTRO) {
    intro();
  } else if (mode == GAME) {
    game();
  } else if (mode == PAUSE) {
    pause();
  } else if (mode == GAMEOVER) {
    gameOver();
  } else if (mode == WIN) {
    win();
  }
}

void keyPressed() {
  //keyboard input setup
  if (key == 'w')    w = true;
  if (key == 's')    s = true;
  if (key == 'a')    a = true;
  if (key == 'd')    d = true;
  if (key == ' ')    space = true;
  if (key == 'p')    pause = true;
  if (key == '1')    one = true;
  if (key == '2')    two = true;
  if (key == '3')    three = true;
  if (key == '4')    four = true;
}

void keyReleased() {
  //keyboard input setup
  if (key == 'w')   w = false;
  if (key == 's')   s = false;
  if (key == 'a')   a = false;
  if (key == 'd')   d = false;
  if (key == ' ')   space = false;
  if (key == 'p')   pause = false;
  if (key == '1')   one = false;
  if (key == '2')   two = false;
  if (key == '3')   three = false;
  if (key == '4')    four = false;
}
