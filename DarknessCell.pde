class DarknessCell {
  float opacity;
  float x, y, size;

  DarknessCell(float _x, float _y, float s) {

    size = s;
    x = _x;
    y = _y;
    opacity = 100;
  }

  void show() {
    noStroke();
    fill(0, 0, 0, opacity);
    rect(x, y, size, size);
  }
}
