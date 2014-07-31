//----------------------------------------------------
// DT Bootcamp 2014, Parsons the New School for Design. 
// Day 9, millis()
// Using millis() to draw a simple intro
// Now adding some color transitions
//----------------------------------------------------

PFont myFont;

float interval;
float[] transitions;
color[] bgColor;

void setup(){
  size(600, 600);
  
  myFont = createFont("Helvetica-Bold", 42);
  
  bgColor = new color[5];
  bgColor[0] = color(180, 140, 255);
  bgColor[1] = color(25, 240, 255);
  bgColor[2] = color(60, 240, 175);
  bgColor[3] = color(255, 140, 25);
  bgColor[4] = color(255, 110, 155);  
  
  //Each screen will stay on for 3 seconds
  interval = 3000;
  transitions = new float[4];
  transitions[0] = millis() + interval;
  transitions[1] = transitions[0] + interval;
  transitions[2] = transitions[1] + interval;
  transitions[3] = transitions[2] + interval;
}

void draw(){
  background(0);
  
  color currColor = color(255);
  int textX = width/2;
  float textY = height/2;
  String msg = "";
  
  textAlign(CENTER);
  textFont(myFont);
  
  if(millis() < transitions[0]){
    currColor = bgColor[0];
    msg = "This is the first screen";
    
  }else if(millis() < transitions[1]){
    currColor = lerpColor(bgColor[0], bgColor[1], (millis() - transitions[0])/1000);
    msg = "And now the second";
    
  }else if(millis() < transitions[2]){
    currColor = lerpColor(bgColor[1], bgColor[2], (millis() - transitions[1])/1000);
    msg = "Third... Such a long intro";
    
  }else if(millis() < transitions[3]){
    currColor = lerpColor(bgColor[2], bgColor[3], (millis() - transitions[2])/1000);
    msg = "4th and last, I hope";
  }else{
    currColor = lerpColor(bgColor[3], bgColor[4], (millis() - transitions[3])/1000);
    msg = "Ok, looks like we're done!";
  }
  
  fill(currColor);
  rect(0, 0, width, height);
  
  fill(255);
  text(msg, textX, textY);
}
