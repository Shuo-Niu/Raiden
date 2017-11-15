class Enermy {
  float x, y;
  color c;
  float yspeed;
  int time; // used to determine firing time
  int firing_interval = 1000; // ms
  
  Enermy() {
    x = random(20, width-20);
    y = 0;
    c = color(255, 0, 0);
    yspeed = 2;
    time = millis() - firing_interval/2;
  }
  
  void update() {
    y += yspeed;
    if(millis() - time >= firing_interval) {
      fire();
      time = millis();
    }
    if(this.collide(p)) {
      p.explode();
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
  
  boolean collide(Player p) { // simulate vertices as EnermyBullets to determine collision
    EnermyBullet b1 = new EnermyBullet(x, y, 0, 0, 0);
    EnermyBullet b2 = new EnermyBullet(x-20, y-20, 0, 0, 0);
    EnermyBullet b3 = new EnermyBullet(x+20, y-20, 0, 0, 0);
    if(b1.collide(p) || b2.collide(p) || b3.collide(p)) {
      return true;
    } else {
      return false;
    }
  }
}