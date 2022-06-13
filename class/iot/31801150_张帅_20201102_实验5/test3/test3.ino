#include <ESP8266WiFi.h>
#ifndef STASSID
#define STASSID "Mi 10000 Ultra"
#define STAPSK   "88888888"
#endif

const char* ssid = STASSID;
const char* password = STAPSK;

const char* host = "192.168.43.244"; 
const uint16_t port = 6800;

WiFiClient client;
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

void axdl(){
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
  


}



void setup() { Serial.begin(115200);

Serial.println();
Serial.println();
Serial.print("Connecting to "); Serial.println(ssid);

WiFi.mode(WIFI_STA); WiFi.begin(ssid, password);

while (WiFi.status() != WL_CONNECTED) { delay(500);
Serial.print(".");
}

Serial.println(""); Serial.println("WiFi connected"); Serial.println("IP address: "); Serial.println(WiFi.localIP());
}

void loop() { Serial.print("connecting to "); Serial.print(host); Serial.print(':'); Serial.println(port);

if (!client.connect(host, port)) {
Serial.println("connection failed"); delay(5000);
return;
}


Serial.println("sending data to server");
if (client.connected()) {
  axdl();
  client.printf("x:%d \n",xAccl);
  client.printf("y:%d \n",yAccl);
  client.printf("z:%d \n",zAccl);
}
delay(6000);
Serial.println("receiving from remote server");

while (client.available()) {
  char ch = static_cast<char>(client.read()); 
  Serial.print(ch);
}
// Close the connection 
Serial.println();
Serial.println("closing connection"); 
client.stop();
delay(3000); // execute once every 5 minutes, don't flood remote service
}
