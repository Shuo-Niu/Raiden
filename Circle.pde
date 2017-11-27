class Circle {
  float x;
  float y;
  float d;
  float c; // color
  float y_speed;
  
  Circle(float diameter, color c, float speed) {
    d = diameter;
    this.c = c;
    y_speed = speed;
  }
  
  void set(float x, float y) {
    this.x = x;
    this.y = y;
  }
  
  void update() {
    y += y_speed;
  }
  
  void show() {
    fill(c);
    noStroke();
    ellipse(x, y, d, d);
  }
}