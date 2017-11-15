class EnermyBullet extends Circle {
  
  EnermyBullet(float x, float y, float diameter, color c, float speed) {
    super(diameter, c, speed + speed_offset);
    this.x = x;
    this.y = y;
  }
  
  @Override
  void update() {
    y += yspeed;
    if(this.collide(p)) {
      p.explode();
    }
  }
  
  boolean collide(Player p) {
    if(x <= p.x + 20 && x >= p.x - 20 && y <= p.y + 20 && y >= p.y) {
      if(x >= p.x && y - p.y >= x - p.x) {
        return true;
      } else if(x < p.x && x + y >= p.x + p.y) {
        return true;
      }
    }
    return false;
  }
}