class EnermyBullet extends Circle {
  boolean used;
  
  EnermyBullet(float x, float y, float diameter, color c, float speed) {
    super(diameter, c, speed + speed_offset);
    this.x = x;
    this.y = y;
    used = false;
  }
  
  @Override
  void update() {
    y += speed;
  }
  
  boolean collide(Player p) {
    return false;
  }
}