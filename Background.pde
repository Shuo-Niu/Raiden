class Background {
  float d = 30;
  Circle[] markers;
  int num_markers;
  color c = 30;
  float speed = 1.5;
  
  Background() {
    num_markers = (floor(height/d)+1) * 2;
    markers = new Circle[num_markers];
    for(int i = 0; i < num_markers; i+=2) {
      
      markers[i] = new Circle(d, c, speed + speed_offset);
      markers[i].set(d/2, (i/2)*d-d/2);
      markers[i+1] = new Circle(d, c, speed + speed_offset);
      markers[i+1].set(width-d/2, (i/2)*d-d/2);
    }
  }
  
  void update() {
    for(int i = 0; i < markers.length; i+=2) {
      markers[i].yspeed = speed + speed_offset;
      markers[i+1].yspeed = speed + speed_offset;
      markers[i].update();
      markers[i+1].update();
      if(markers[i].y >= height + d/2) { // reset
        markers[i].set(d/2, -d/2);
        markers[i+1].set(width-d/2, -d/2);
      }
    }
  }
  
  void show() {
    for(int i = 0; i < markers.length; i+=2) {
      markers[i].show();
      markers[i+1].show();
    }
  }
}