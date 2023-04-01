
/*
  Wiring / Arduino Code
  Slightly modified from the freenove joystick example
  Filename    : Joystick
  Description : Read data from joystick.
  Auther      : www.freenove.com
  Modification: 2020/07/11
*/
int xyzPins[] = {2, 15, 13};   //x,y,z pins
int buttonPin = 25;
int lastButtonState = HIGH;
int xVal;
int yVal;
int zVal;
int buttonVal;

unsigned long lastDebounceTime = 0;  // the last time the output pin was toggled
unsigned long debounceDelay = 50;


void setup() {
  Serial.begin(9600);
  pinMode(xyzPins[2], INPUT_PULLUP);  //z axis is a button.
  pinMode(buttonPin, INPUT_PULLUP);  //button.
}
void loop() {
  xVal = analogRead(xyzPins[0]);
  Serial.print(xVal);
  Serial.print('\n');
  yVal = analogRead(xyzPins[1]);
  Serial.print(yVal);
  Serial.print('\n');
  zVal = digitalRead(xyzPins[2]);
  //Serial.printf("X,Y,Z: %d,\t%d,\t%d\n", xVal, yVal, zVal);
//  Serial.print(zVal);
//  Serial.print('\n');
  int reading = digitalRead(buttonPin);


  if (reading != lastButtonState) {
    // reset the debouncing timer
    lastDebounceTime = millis();
  }

  if ((millis() - lastDebounceTime) > debounceDelay) {
    // whatever the reading is at, it's been there for longer than the debounce
    // delay, so take it as the actual current state:

    // if the button state has changed:
    if (reading != buttonVal) {
      buttonVal = reading;
    }
  }



  lastButtonState = reading;
//
//  Serial.print(buttonVal);
//  Serial.print('\n');
  delay(50);
}
