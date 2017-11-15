class Player {
  float x, y;
  color c;
  float speed;
  ArrayList<Bullet> bullets;
  float bullet_diameter;
  float bullet_speed;
  
  Player(float x, float y) {
    this.x = x;
    this.y = y;
    c = 255;
    speed = 6;
    bullets = new ArrayList<Bullet>();
    bullet_diameter = 5;
    bullet_speed = 7;
  }
  
  void update() {
    if(keys[0] && !keys[1]) {
      y -= speed;
    } else if(keys[1] && !keys[0]) {
      y += speed;
    }
    y = constrain(y, 0, height - 20);
    if(keys[2] && !keys[3]) {
      x -= speed;
    } else if(keys[3] && !keys[2]) {
      x += speed;
    }
    x = constrain(x, 20, width - 20);
    
    for(int i = 0; i < bullets.size(); i++) {
      bullets.get(i).update();
      if(bullets.get(i).y < -bullets.get(i).d) {
        bullets.remove(i);
      }
    }
  }
  
  void show() {
    fill(c);
    noStroke();
    triangle(x-20,y+20,x,y,x+20,y+20);
    
    for(int i = 0; i < bullets.size(); i++) {
      bullets.get(i).show();
    }
  }
  
  void fire() {
    bullets.add(new Bullet(x, y, bullet_diameter, 255, bullet_speed));
  }
  
  void explode() {
    exp.add(new Explosion(x, y));
    end = true;
  }
}