import processing.video.*;
// Two global variables
float x;
float y;
// Variable to hold onto Capture object
Capture video;
void setup() {
  size(640, 480);
  smooth();
  // framerate(30);
  background(0);
  // Start x and y in the center
  x = width/2;
  y = height/2;
  // Start the capture process
  video = new Capture(this, width, height, 15);
  video.start();
}
void draw() {
  // Read image from the camera
  if (video.available()) {
    video.read();
  }
  video.loadPixels();
  // Pick a new x and y
  float newx = constrain(x + random(-20, 20), 0, width-1); 
  float newy = constrain(y + random(-20, 20), 0, height-1);
  // Find the midpoint of the line
  int midx = int((newx + x) / 2);
  int midy = int((newy + y) / 2);
  // Pick the color from the video, reversing x
  color c =  video.pixels[(width-1-midx) + midy*video.width];
  // Draw a line from x,y to the newx,newy
  stroke(c);
  strokeWeight(4);
  line(x, y, newx, newy);
  // Save newx, newy in x,y
  x = newx;
  y = newy;
}

