class EnermyBoss extends Enermy {
  EnermyBoss(float x, float y, color clr, float xspeed, float yspeed, int interval) {
    super(x, y, clr, xspeed, yspeed, interval);
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