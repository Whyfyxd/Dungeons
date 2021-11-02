//Andy Zhang
//DUNGEONS

//keyboard input
boolean w, a, s, d, space, pause;

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
color black    = #012201;
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
  darkness = new ArrayList<DarknessCell> (1000);
  float size = 1000;
  for (int i = 0; i <= 1920; i++) {
    for (int k = 0; k <= 1080; k++) {
      darkness.add(new DarknessCell(k, i, size));
    }
  }

  //mode framework setup
  //mode = INTRO;
  //mode = GAMEOVER;
  //mode = WIN;
  mode = GAME;
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
}

void keyReleased() {
  //keyboard input setup
  if (key == 'w')   w = false;
  if (key == 's')   s = false;
  if (key == 'a')   a = false;
  if (key == 'd')   d = false;
  if (key == ' ')   space = false;
  if (key == 'p')   pause = false;
}
