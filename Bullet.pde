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
    y -= y_speed;
    if(!used) {
      for(int ptnnum = 0; ptnnum < ptn.size(); ptnnum++) {
        for(int i = 0; i < ptn.get(ptnnum).e.size(); i++) {
          if(this.collide(ptn.get(ptnnum).e.get(i))) {
            used = true;
            ptn.get(ptnnum).e.get(i).explode();
            ptn.get(ptnnum).e.remove(i);
            //ptn.e.add(new Enermy());
            this.c = 0;
          }
        }
      }
    }
  }
  
  boolean collide(Enermy e) {
    if(x <= e.x + 20 && x >= e.x - 20 && y <= e.y && y >= e.y - 20) {
      if(x >= e.x && x + y <= e.x + e.y) {
        return true;
      } else if(x < e.x && e.y - y >= e.x - x) {
        return true;
      }
    }
    return false;
  }
}