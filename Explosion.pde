class Explosion {
  float x, y;
  //color[] c = {255, 0, 255, 0, 255, 0, 255, 0};
  color[] c = {color(255,0,0), color(255,0,0), color(255,64,0), color(255,128,0), color(255,191,0), color(255,255,0), color(255,255,0), color(255,255,255)};
  //float[] d = {60, 55, 50, 45, 40, 30, 20, 10};
  float[] d = {10, 20, 30, 40, 45, 50, 55, 60};
  int state; // 0-7
  
  Explosion(float x, float y) {
    this.x = x;
    this.y = y;
    state = -1;
  }
  
  void update() {
    state++;
  }
  
  void show() {
    fill(c[state]);
    noStroke();
    ellipse(x, y, d[state], d[state]);
  }
}