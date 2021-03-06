class Pattern {
  int number_of_patterns = 5;
  int id = floor((random(0,1) * number_of_patterns));
  ArrayList<Enermy> e;
  
  Pattern() {
    e = new ArrayList<Enermy>();
    switch(id) {
      case 0: { // three slow enermy on one row, only move vertically
        color slow_enermy_color = color(255, 0, 0);
        float slow_enermy_speed = 2;
        e.add(new Enermy(width / 4, 0, slow_enermy_color, 0, slow_enermy_speed, 1000, 1, 20));
        e.add(new Enermy(width / 2, 0, slow_enermy_color, 0, slow_enermy_speed, 1000, 1, 20));
        e.add(new Enermy(width / 4 * 3, 0, slow_enermy_color, 0, slow_enermy_speed, 1000, 1, 20));
        break;
      }
      case 1: { // four slow enermy on one row, also move horizontally
        color slow_enermy_color = color(255, 0, 255);
        float slow_enermy_speed = 2;
        float x_speed = random(0,1) >= 0.5 ? 2 : -2;
        e.add(new Enermy(width / 5 * 1, 0, slow_enermy_color, x_speed, slow_enermy_speed, 1000, 1, 20));
        e.add(new Enermy(width / 5 * 2, 0, slow_enermy_color, x_speed, slow_enermy_speed, 1000, 1, 20));
        e.add(new Enermy(width / 5 * 3, 0, slow_enermy_color, x_speed, slow_enermy_speed, 1000, 1, 20));
        e.add(new Enermy(width / 5 * 4, 0, slow_enermy_color, x_speed, slow_enermy_speed, 1000, 1, 20));
        break;
      }
      case 2: { // three fast enermy on one row, do not fire
        color fast_enermy_color = color(255, 255, 0);
        float fast_enermy_speed = 10;
        e.add(new Enermy(width / 5, 0, fast_enermy_color, 0, fast_enermy_speed, 100000, 1, 20));
        e.add(new Enermy(width / 2, 0, fast_enermy_color, 0, fast_enermy_speed, 100000, 1, 20));
        e.add(new Enermy(width / 5 * 4, 0, fast_enermy_color, 0, fast_enermy_speed, 100000, 1, 20));
        break;
      }
      case 3: { // two fast enermy on one row, do not fire, along the edge
        color fast_enermy_color = color(255, 255, 0);
        float fast_enermy_speed = 10;
        e.add(new Enermy(20, 0, fast_enermy_color, 0, fast_enermy_speed, 100000, 1, 20));
        e.add(new Enermy(width - 20, 0, fast_enermy_color, 0, fast_enermy_speed, 100000, 1, 20));
        break;
      }
      case 4: {
        color boss_color = color(200);
        float boss_speed = 1;
        float x_speed = random(0,1) >= 0.5 ? 2 : -2;
        e.add(new EnermyBoss(width / 2, 0, boss_color, x_speed, boss_speed, 2000, 3, 30));
        break;
      }
    }
  }
  
  void update() {
    for(int i = 0; i < e.size(); i++) {
      e.get(i).update();
      if(e.get(i).y > height + 20) {
        e.remove(i);
        i--;
      } else if(e.get(i).hp <= 0) {
        e.get(i).explode();
        e.remove(i);
        i--;
      }
    }
  }
  
  void show() {
    for(int i = 0; i < e.size(); i++) {
      e.get(i).show();
    }
  }
}