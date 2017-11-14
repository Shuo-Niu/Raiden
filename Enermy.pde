class Enermy {
  float x, y;
  color c;
  float speed;
  int time;
  
  Enermy() {
    x = random(20, width-20);
    y = 0;
    c = color(255, 0, 0);
    speed = 2;
    time = millis();
  }
  
  void update() {
    y += speed;
    if(millis() - time >= 1000) {
      fire();
      time = millis();
    }
  }
  
  void show() {
    fill(c);
    noStroke();
    triangle(x-20,y-20,x,y,x+20,y-20);
  }
  
  void fire() {
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed));
  }
  
  void explode() {
    exp.add(new Explosion(x, y));
  }
  
  boolean collide(Player p) {
    return false;
  }
}