class Pattern {
  int number_of_patterns = 3;
  int id = floor((random(0,1) * number_of_patterns));
  ArrayList<Enermy> e;
  
  Pattern() {
    e = new ArrayList<Enermy>();
    switch(id) {
      case 0: {
        color slow_enermy_color = color(255, 0, 0);
        float slow_enermy_speed = 2;
        e.add(new Enermy(width / 4, 0, slow_enermy_color, 0, slow_enermy_speed, 1000));
        e.add(new Enermy(width / 2, 0, slow_enermy_color, 0, slow_enermy_speed, 1000));
        e.add(new Enermy(width / 4 * 3, 0, slow_enermy_color, 0, slow_enermy_speed, 1000));
        break;
      }
      case 1: {
        color fast_enermy_color = color(255, 255, 0);
        float fast_enermy_speed = 10;
        e.add(new Enermy(width / 5, 0, fast_enermy_color, 0, fast_enermy_speed, 100000));
        e.add(new Enermy(width / 2, 0, fast_enermy_color, 0, fast_enermy_speed, 100000));
        e.add(new Enermy(width / 5 * 4, 0, fast_enermy_color, 0, fast_enermy_speed, 100000));
        break;
      }
      case 2: {
        color slow_enermy_color = color(255, 0, 255);
        float slow_enermy_speed = 2;
        e.add(new Enermy(width / 5 * 1, 0, slow_enermy_color, 2, slow_enermy_speed, 1000));
        e.add(new Enermy(width / 5 * 2, 0, slow_enermy_color, 2, slow_enermy_speed, 1000));
        e.add(new Enermy(width / 5 * 3, 0, slow_enermy_color, 2, slow_enermy_speed, 1000));
        e.add(new Enermy(width / 5 * 4, 0, slow_enermy_color, 2, slow_enermy_speed, 1000));
        break;
      }
    }
  }
  
  void update() {
    for(int i = 0; i < e.size(); i++) {
      e.get(i).update();
      if(e.get(i).y > height + 20) {
        e.remove(i);
        //e.add(new Enermy());
      }
    }
  }
  
  void show() {
    for(int i = 0; i < e.size(); i++) {
      e.get(i).show();
    }
  }
}