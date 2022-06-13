#include<Wire.h>
#include<math.h>
#define Addr 0x53
const uint8_t scl=2;
const uint8_t sda=14;

unsigned int data[6];
int xAccl;
int yAccl;
int zAccl;


void setup() {
  // put your setup code here, to run once:
  // put your main code here, to run repeatedly:
    pinMode(12, OUTPUT); 
    pinMode(13, OUTPUT); 
    pinMode(15, OUTPUT); 
    Serial.begin(115200);
  

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
  int x,y,z;
  
  x=(((data[1]&0x03)*256)+data[0]);
  if(xAccl>511){
    xAccl-=1024;
  }
   y=(((data[3]&0x03)*256)+data[2]);
  if(yAccl>511){
    yAccl-=1024;
  }
   z=(((data[5]&0x03)*256)+data[4]);
  if(zAccl>511){
    zAccl-=1024;
  }
  int maxx,maxy,maxz;
  maxx=abs(x-xAccl);
  maxy=abs(y-yAccl);
  maxz=abs(z-zAccl);
  if(maxx>=maxy&&maxx>=maxz)
  {
      analogWrite(12, 255);   
      analogWrite(13, 0);
      analogWrite(15, 0);
  }
  else if(maxy>=maxx&&maxy>=maxz)
  {
      analogWrite(12, 0);   
      analogWrite(13, 255);
      analogWrite(15, 0);
  } else if(maxz>=maxx&&maxz>=maxy)
  {
      analogWrite(12, 0);   
      analogWrite(13, 0);
      analogWrite(15, 255);
  }

  xAccl=x;
  yAccl=y;
  zAccl=z;
  Serial.printf("x:%d,y:%d,z:%d\n",x,y,z);
  

  delay(1000);
  
  

  

   

}
