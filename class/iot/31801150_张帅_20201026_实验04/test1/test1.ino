#include<Wire.h>
#define Addr 0x53
const uint8_t scl=2;
const uint8_t sda=14;

unsigned int data[6];
int xAccl;
int yAccl;
int zAccl;


void setup() {
  // put your setup code here, to run once:
  Serial.begin(115200);
  

}

void loop() {
  // put your main code here, to run repeatedly:
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
  delay(300);

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

   Serial.printf("x方向: %d,y方向: %d，z方向: %d\n",xAccl,yAccl,zAccl);
 
   delay(1000);

}
