#include"SSD1306Wire.h"
SSD1306Wire display(0x3c,2,14);
void setup() {
  // put your setup code here, to run once:
 
  display.init();


}

void loop() {
  // put your main code here, to run repeatedly:
  display.clear();
  display.setFont(ArialMT_Plain_10);
  display.drawString(5,0,"Hello, ZUCC!");
  display.setFont(ArialMT_Plain_16);
  display.drawString(5,20,"Hello, ZUCC!");
  display.setFont(ArialMT_Plain_24);
  display.drawString(5,40,"Hello, ZUCC!");
  display.display();
  delay(2000);

}
