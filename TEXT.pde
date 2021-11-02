class Text {

  //variables
  int x, y;
  color highlight, c;
  String text;
  int size;
  PFont font;

  Text(String t, int _x, int _y, color co, int s, PFont f) {
    //variable initiation
    x = _x;
    y = _y;
    text = t;
    size = s;
    c = co;
    font = f;
  }

  void show() {

    //custom text display
    textFont (font);
    fill(c);
    textSize(size);
    text(text, x, y);
  }
}
