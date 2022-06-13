#include<Wire.h>
#include"SSD1306Wire.h"
#define Addr 0x53
SSD1306Wire display(0x3c,2,14);
const uint8_t scl=2;
const uint8_t sda=14;

unsigned int data[6];
int xAccl;
int yAccl;
int zAccl;


void setup() {
  // put your setup code here, to run once:
  // put your main code here, to run repeatedly:
  

  

}

 

void loop() {
 
 
   Wire.beginTransmission(Addr);
  Wire.begin(sda,scl);
  Wire.write(0x2C);
  Wire.write(0x0A);
  Wire.endTransmission();

  Wire.beginTransmission(Addr);
  Wire.write(0x2D);
  Wire.write(0x08);
  Wire.endTransmission();


  Wire.beginTransmission(Addr);
  Wire.write(0x31);
  Wire.write(0x08);
  Wire.endTransmission();
  display.flipScreenVertically();
  display.setFont(ArialMT_Plain_16);

   for(int i=0;i<6;i++)
  {
    Wire.beginTransmission(Addr);
    Wire.write((50+i));
    Wire.endTransmission();
    Wire.requestFrom(Addr,1);

    if(Wire.available()==1)
    {
      data[i]=Wire.read();
    }
  }

  xAccl=(((data[1]&0x03)*256)+data[0]);
  if(xAccl>511){
    xAccl-=1024;
  }
   yAccl=(((data[3]&0x03)*256)+data[2]);
  if(yAccl>511){
    yAccl-=1024;
  }
   zAccl=(((data[5]&0x03)*256)+data[4]);
  if(zAccl>511){
    zAccl-=1024;
  }
  
  

  display.init();
   display.clear();
   display.drawString(0,0,"x:");
   display.drawString(0,20,"y:");
   display.drawString(0,40,"z:");
   display.drawString(20,0,String(xAccl));
   display.drawString(20,20,String(yAccl));
   display.drawString(20,40,String(zAccl));
   display.display();
   delay(1000);

   

}
