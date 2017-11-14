class Bullet extends Circle {
  boolean used;
  
  Bullet(float x, float y, float diameter, color c, float speed) {
    super(diameter, c, speed);
    this.x = x;
    this.y = y;
    used = false;
  }
  
  @Override
  void update() {
    y -= speed;
    if(!used) {
      for(int i = 0; i < e.size(); i++) {
        if(this.collide(e.get(i))) {
          used = true;
          e.get(i).explode();
          e.remove(i);
          e.add(new Enermy());
          this.c = 0;
        }
      }
    }
  }
  
  boolean collide(Enermy e) {
    if(x <= e.x + 20 && x >= e.x - 20 && y <= e.y && y >= e.y - 20) {
      if(x >= e.x && x + y <= e.x + e.y) {
        return true;
      } else if(x < e.x && x - (e.x - 20) >= y - (e.y - 20)) {
        return true;
      }
    }
    return false;
  }
}