class EnermyBoss extends Enermy {
  color[] c_array;
  
  EnermyBoss(float x, float y, color clr, float xspeed, float yspeed, int interval, int health, float wlength) {
    super(x, y, clr, xspeed, yspeed, interval, health, wlength);
    c_array = new color[hp];
    for(int i = 0; i < hp; i++) {
      c_array[i] = lerpColor(color(255, 0, 0), c, (float)(i + 1) / (float)hp);
    }
  }  
  
  @Override
  void show(){
    fill(c_array[hp-1]);
    noStroke();
    triangle(x-wing_length,y-wing_length,x,y,x+wing_length,y-wing_length);
  }
  
  @Override
  void fire() {
    // fire 8 bullets
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, 0, bullet_speed));
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed / sqrt(2), bullet_speed / sqrt(2)));
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed, 0));
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed / sqrt(2), -bullet_speed / sqrt(2)));
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, 0, -bullet_speed));
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed / sqrt(2), -bullet_speed / sqrt(2)));
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed, 0));
    //eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed / sqrt(2), bullet_speed / sqrt(2)));
    
    // fire 16 bullets
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, 0, bullet_speed));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed / 2, bullet_speed / 2 * sqrt(3)));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed / 2 * sqrt(3), bullet_speed / 2));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed, 0));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed / 2 * sqrt(3), -bullet_speed / 2));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, bullet_speed / 2, -bullet_speed / 2 * sqrt(3)));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, 0, -bullet_speed));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed / 2, -bullet_speed / 2 * sqrt(3)));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed / 2 * sqrt(3), -bullet_speed / 2));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed, 0));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed / 2 * sqrt(3), bullet_speed / 2));
    eb.add(new EnermyBullet(x, y, bullet_diameter, 255, -bullet_speed / 2, bullet_speed / 2 * sqrt(3)));
  }
}