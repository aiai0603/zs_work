#include"SSD1306Wire.h"
SSD1306Wire display(0x3c,2,14);
void setup() {
  // put your setup code here, to run once:
 
  display.init();


}

void loop() {
  // put your main code here, to run repeatedly:
  display.clear();
  display.drawLine(0,0,128,64);
  display.display();
  delay(2000);
  display.clear();
  display.drawCircle(64,32,20);
  display.display();
  delay(2000);
   display.clear();
  display.drawRect(32,16,64,32);
  display.display();
  delay(2000);

}
