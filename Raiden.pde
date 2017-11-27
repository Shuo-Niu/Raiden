Background b; // performs as landmark, indicating forwarding
Player p;
ArrayList<Pattern> ptn;
ArrayList<EnermyBullet> eb; // EnermyBullet cannot belong to Enermy instances
float bullet_diameter;
float bullet_speed;
ArrayList<Explosion> exp; // explosion animation
boolean keys[]; // used to handle simultaneously two keys pressed
float speed_offset; // for future function, accelerate background and enermy_bullet
int time;
int new_pattern_interval;

boolean end;

void setup() {
  size(400, 600);
  reset();
}

void reset() {
  b = new Background();
  p = new Player(width/2, height*2/3);
  ptn = new ArrayList<Pattern>();
  eb = new ArrayList<EnermyBullet>();
  bullet_diameter = 5;
  bullet_speed = 5;
  exp = new ArrayList<Explosion>();
  keys = new boolean[4];
  speed_offset = 0;
  new_pattern_interval = 1500;
  time = millis() - new_pattern_interval;
  end = false;
}

void draw() {
  background(0);
  if(!end) {
    b.update();
    b.show();
    p.update();
    p.show();
    
    if(millis() - time > new_pattern_interval) {
      ptn.add(new Pattern());
      time = millis();
    }
    
    for(int i = 0; i < ptn.size(); i++) {
      ptn.get(i).update();
      if(ptn.get(i).e.size() == 0) {
        ptn.remove(i);
        i--;
      } else {
        ptn.get(i).show();
      }
    }
    
    for(int i = 0; i < eb.size(); i++) {
      eb.get(i).update();
      if(eb.get(i).y > height + eb.get(i).d) {
        eb.remove(i);
        i--;
      } else {
        eb.get(i).show();
      }    
    }
    
    for(int i = 0; i < exp.size(); i++) {
      exp.get(i).update();
      if(exp.get(i).state == 8) {
        exp.remove(i);
        i--;
      } else {
        exp.get(i).show();
      }
    }
  } else { // lost game
    if(!exp.isEmpty()) { // finish all explosion animations
      for(int i = 0; i < exp.size(); i++) {
        exp.get(i).update();
        if(exp.get(i).state == 8) {
          exp.remove(i);
          i--;
        } else {
          exp.get(i).show();
        }
      }
    } else {
      reset();
    }
  }
}

void keyReleased() {
  if(keyCode == UP){
    keys[0] = false;
  }
  if(keyCode == DOWN){
    keys[1] = false;
  }
  if(keyCode == LEFT){
    keys[2] = false;
  }
  if(keyCode == RIGHT){
    keys[3] = false;
  }
}

void keyPressed() {
  if(keyCode == UP){
    keys[0] = true;
  }
  if(keyCode == DOWN){
    keys[1] = true;
  }
  if(keyCode == LEFT){
    keys[2] = true;
  }
  if(keyCode == RIGHT){
    keys[3] = true;
  }
  if(key == ' ') {
    p.fire();
  }
  if(key == 'r') {
    reset();
  }
}