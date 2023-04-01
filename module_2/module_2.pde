import processing.serial.*;

Serial myPort;
float xVal;
float yVal;

PImage background; // Declare a variable of type PImage
PImage binocs;

String[] birdNames = {"Northern Cardinal", "Black-capped Chickadee", "Eastern Bluebird", 
"American Robin", "American Goldfinch", "Northern Flicker", "Baltimore Oriole", 
"Cactus Wren", "Rhode Island Red", "Mountain Bluebird", "Quail", "Ring-necked Pheasant",
"Roadrunner", "Brown Pelican", "Purple Finch", "Willow Ptarmigan", 
"Common Loon", "California Gull", "Blue Hen Chicken",
"Lark Bunting", "Western Meadowlark", "Scissor-tailed Flycatcher", 
"Brown Thrasher","Hermit Thrush", "Mockingbird", "Nene", "Carolina Wren"};

int[][] birdCoords = {{610, 683, 285, 335}, {159, 233, 365, 388},
    {254, 321, 509, 550}, {155, 240, 700, 730}, {294, 370, 537, 566},
  {704, 780, 443, 525}, {630, 735, 120, 151}, {860, 972, 659, 700},
  {600, 737, 588, 659}, {420, 500, 495, 525}, {473, 601, 690, 746},
  {706, 859, 666, 746}, {26, 147, 588, 620}, {300, 450, 345, 382},
  {113, 185, 172, 183}, {45, 183, 603, 704}, {381, 500, 185, 207}, 
{557, 662, 425, 443}, {473, 634, 564, 671},
  {366, 461, 513, 546}, {469, 567, 477, 513}, {536, 619, 478, 506},
  {178, 267, 615, 648}, {12, 98, 653, 674}, {397, 510, 721, 758},
  {874, 1000, 560, 619}, {876, 971, 333, 370}
};

boolean found = false;
int i = int(random(birdNames.length));

void setup() {
  size(1000,807);
  // Make a new instance of a PImage by loading an image file
  background = loadImage("mybirds.jpg");
  binocs = loadImage("binoculars.png");
  textSize(50);
  
  String portName = Serial.list()[7];
  println(portName);
  myPort new Serial(this, portName, 9600);

}

void draw() {
  background(0);  
  
  if (myPort.available() > 0){
    String xValt = myPort.readStringUntil('\n');
    String yValt = myPort.readStringUntil('\n');
    if(xValt != null) xVal = float(xValt)/4096 * (1000);
    if(yValt != null) yVal = float(yValt)/4096 * (807);
  }
  
  if(mouseX > birdCoords[i][0] & mouseX < birdCoords[i][1] & mouseY > birdCoords[i][2] & mouseY < birdCoords[i][3]){
    found = true;
  }
  
  if(found){
    found = false;
    i = int(random(birdNames.length));
    println(i);
  }
  
  
  image(background,0,100);
  image(binocs, mouseX-50, mouseY-35);
  text("Find the " + birdNames[i] + "!", 10, 50);

}
