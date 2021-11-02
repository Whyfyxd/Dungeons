class AnimatedGIF {
  //AnimatedGIF class

  //Variables
  PImage[] pics;
  int currentFrame;
  int numFrames;
  int delay = 0;
  int playback;
  float x, y, w, h;
  boolean moving;

  AnimatedGIF(int nf, String pre, String post, int pb) {
    //Variable initiation
    moving = true;
    x = width/2;
    y = height/2;
    w = width;
    h = height;
    playback = pb;
    numFrames = nf;

    //GIF Arraylist Setup
    pics = new PImage[numFrames];
    int i =0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }

  AnimatedGIF (int nf, String pre, String post, float _x, float _y, float _w, float _h, int d) {
    //Variable initiation
    moving = true;
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    playback = d;
    numFrames = nf;

    //GIF Arraylist Setup
    pics = new PImage[numFrames];
    int i =0;
    while (i < numFrames) {
      pics[i] = loadImage(pre+i+post);
      i++;
    }
    currentFrame = 0;
  }

  void show() {
    //GIF display code
    imageMode(CENTER);
    if (currentFrame == numFrames ) currentFrame = 0;
    image (pics[currentFrame], x, y, w, h);

    //gif playback speed
    if (moving) {
      if (delay%playback == 0) {
        currentFrame++;
        delay = 0;
      }
      delay++;
    }
  }
}
