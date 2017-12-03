class Enermy {
  float x, y;
  color c;
  float x_speed;
  float y_speed;
  int firing_interval; // ms
  int time; // used to determine firing time
  int hp;
  float wing_length;
  
  Enermy(float xx, float yy, color cc, float xspeed, float yspeed, int interval, int health, float wlength) {
    //x = random(20, width-20);
    x = xx;
    y = yy;
    c = cc;
    x_speed = xspeed;
    y_speed = yspeed;
    firing_interval = interval;
    time = millis() - firing_interval/2;
    hp = health;
    wing_length = wlength;
  }
  
  void update() {
    x += x_speed;
    if(x > width - wing_length || x < wing_length) {
      x_speed *= -1;
    }
    
    y += y_speed;
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
    triangle(x-wing_length,y-wing_length,x,y,x+wing_length,y-wing_length);
  }
  
  void fire() {
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, 0, bullet_speed));
  }
  
  void explode() {
    exp.add(new Explosion(x, y));
  }
  
  boolean collide(Player p) { // simulate vertices as EnermyBullets to determine collision
    EnermyBullet b1 = new EnermyBullet(x, y, 0, 0, 0, 0);
    EnermyBullet b2 = new EnermyBullet(x-wing_length, y-wing_length, 0, 0, 0, 0);
    EnermyBullet b3 = new EnermyBullet(x+wing_length, y-wing_length, 0, 0, 0, 0);
    if(b1.collide(p) || b2.collide(p) || b3.collide(p)) {
      return true;
    } else {
      return false;
    }
  }
  
  void loseHP() {
    hp--;
  }
}