class Button {
  //Button class

  //Variables
  int x, y, w, h;
  boolean clicked;
  color highlight, normal;
  String text;
  int size;

  Button(String t, int _x, int _y, int _w, int _h, color norm, color high, int s) {
    //Variable initiations
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    text = t;
    size = s;
    highlight = high;
    normal = norm;
    clicked = false;
  }

  void show() {
    //rectangle
    rectMode(CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(highlight);
    } else {
      fill(0);
    }
    stroke(0);
    strokeWeight(4);
    rect(x, y, w, h, 30);

    //text label
    textAlign(CENTER, CENTER);
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      fill(normal);
    } else {
      fill(255);
    }

    //text size and display code
    textSize(size);
    text(text, x, y-8);

    //interaction code
    if (mouseX > x-w/2 && mouseX < x+w/2 && mouseY > y-h/2 && mouseY < y+h/2) {
      clicked  = true;
    } else {
      clicked = false;
    }
  }
}
