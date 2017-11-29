class EnermyBullet extends Circle {
  float x_speed;
  
  EnermyBullet(float x, float y, float diameter, color c, float xspeed, float yspeed) {
    super(diameter, c, yspeed + yspeed_offset);
    this.x = x;
    this.y = y;
    x_speed = xspeed;
  }
  
  @Override
  void update() {
    x += x_speed;
    
    y += y_speed;
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