#include <ESP8266WiFi.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"
#define WLAN_SSID   "zs"
#define WLAN_PASS   "88888888"
#define AIO_SERVER    "47.97.158.11"
#define AIO_SERVERPORT   1883
#define AIO_USERNAME   ""
#define AIO_KEY        ""
#include"SSD1306Wire.h"
SSD1306Wire display(0x3c,2,14);
#include<dht11.h>
#include<ArduinoJson.h>
#include<Adafruit_NeoPixel.h>
#define led_number 4
#define PIN 12
 Adafruit_NeoPixel strip = Adafruit_NeoPixel(led_number, PIN, NEO_GRB + NEO_KHZ800);


#include<Wire.h>
#include<math.h>
#define Addr 0x53
const uint8_t scl=2;
const uint8_t sda=14;

unsigned int data[6];
int xAccl;
int yAccl;
int zAccl;




int check=0;
int tahwarning=0;
int movewarning=0;
int count=0;
int movecount=0;
int lowert=0;
int hight=100;
int highh=100;
int lowerh=0;

dht11 DHT11;
// Create an ESP8266 WiFiClient class to connect to the MQTT server.
WiFiClient client;
// or... use WiFiClientSecure for SSL
//WiFiClientSecure client;

StaticJsonDocument<200> doc;
StaticJsonDocument<200> warnmsg;
StaticJsonDocument<200> warnmsgrecover;
StaticJsonDocument<200> initmsg;
StaticJsonDocument<200> tah;


// Setup the MQTT client class by passing in the WiFi client and MQTT server and login details.
Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);
// Setup a feed called 'photocell' for publishing.
// Notice MQTT paths for AIO follow the form: <username>/feeds/<feedname> 

Adafruit_MQTT_Publish photocellwarn = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "ZUCC-ZS/warning");

Adafruit_MQTT_Publish photocellwarnrecover = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "ZUCC-ZS/warningrecover");

Adafruit_MQTT_Publish photocell = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "ZUCC-ZS/WX/zs/1");

Adafruit_MQTT_Publish photocellinit = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "ZUCC-ZS/init");

Adafruit_MQTT_Publish photoceltah = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "ZUCC-ZS/tah");

// Setup a feed called 'onoff' for subscribing to changes.
Adafruit_MQTT_Subscribe  onoffbutton = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "ZUCC-ZS/init/zs/1");

Adafruit_MQTT_Subscribe  oncheck = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "ZUCC-ZS/check/zs/1");

// Bug workaround for Arduino 1.6.6, it seems to need a function declaration
// for some reason (only affects ESP8266, likely an arduino-builder bug). 
void MQTT_connect();

void setup() {

Serial.begin(115200); 
delay(10);
 display.init();

Serial.println(F("Adafruit MQTT demo"));

// Connect to WiFi access point. 
Serial.println(); 
Serial.println(); 
Serial.print("Connecting to "); 
Serial.println(WLAN_SSID);

WiFi.begin(WLAN_SSID, WLAN_PASS);
while (WiFi.status() != WL_CONNECTED) { delay(500);
Serial.print(".");
}
Serial.println();

Serial.println("WiFi connected");
Serial.println("IP address: "); Serial.println(WiFi.localIP());

// Setup MQTT subscription for onoff feed. 
mqtt.subscribe(&onoffbutton);
mqtt.subscribe(&oncheck);

}
uint32_t x=0; 
void loop() {
    int chk = DHT11.read(5);
      strip.begin();
  strip.setBrightness(255); 
// Ensure the connection to the MQTT server is alive (this will make the first
//  connection  and automatically reconnect when  disconnected).  See the MQTT_connect
// function definition further below. 
   MQTT_connect();

  
// this is our 'wait for incoming subscription packets' busy subloop
// try to spend your time here

Adafruit_MQTT_Subscribe *subscription;
while ((subscription = mqtt.readSubscription(5000))) { 
  if (subscription == &onoffbutton) {
        Serial.println((char *)onoffbutton.lastread);
        deserializeJson(initmsg,(char*)onoffbutton.lastread);
        check=initmsg["deleteflag"];
        lowert=initmsg["lowert"];
        hight=initmsg["hight"];
        lowerh=initmsg["lowerh"];
        highh=initmsg["highh"];
    
    
  }else if(subscription == &oncheck){
 
       
         if(  strcmp((char *)oncheck.lastread,"1" )==0 )
         {
            check=1;
         }else{
            check=0;
         }
         
         
  }
}
// Now we can publish stuff! 

String output;
String output2;
String output3;
String output4;
String output5;


float nowhumidity=(float)DHT11.humidity;
float nowtemperature=(float)DHT11.temperature;



  if(nowhumidity>highh||nowhumidity<lowerh||nowtemperature>hight||nowtemperature<lowert)
  {
 
      warnmsg["ename"] = "zs/1";
      warnmsg["msg"]="环境异常";
    
      serializeJson(warnmsg ,output);
      if (!  photocellwarn.publish(output.c_str())) 
      { 
        Serial.println(F("Failed"));
      } else {
         Serial.println(F("OK!"));
         delay(200);
      }

      if(tahwarning==0)
      {
        tah["ename"] = "zs/1";
        tah["humi"] = nowhumidity;
        tah["temp"] = nowtemperature;
        serializeJson(tah ,output5);
        if (!  photoceltah.publish(output5.c_str())) 
        { 
             Serial.println(F("Failed"));
        } else {
            Serial.println(F("OK!"));
            delay(200);
        }
        count=0;
      }

      tahwarning=1;  
  }else{
    
      if( tahwarning==1)
      {
          warnmsgrecover["ename"] = "zs/1";
          warnmsgrecover["msg"]="环境异常恢复";
        
          serializeJson( warnmsgrecover ,output3);
          if (! photocellwarnrecover.publish(output3.c_str())) 
          { 
            Serial.println(F("Failed"));
          } else {
            Serial.println(F("OK!"));
            delay(200);
          }
        tahwarning=0;

        tah["ename"] = "zs/1";
        tah["humi"] = nowhumidity;
        tah["temp"] = nowtemperature;
        serializeJson(tah ,output5);
        if (!  photoceltah.publish(output5.c_str())) 
        { 
             Serial.println(F("Failed"));
        } else {
            Serial.println(F("OK!"));
            delay(200);
        }
        count=0;

      }
  }

      doc["humidity"] = nowhumidity;
      doc["temperature"] = nowtemperature;
      serializeJson(doc ,output2);
      if (!photocell.publish(output2.c_str())) 
      { 
        Serial.println(F("Failed"));
      } else {
         Serial.println(F("OK!"));
         delay(200);
      }



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
  if(x>511){
    x-=1024;
  }
   y=(((data[3]&0x03)*256)+data[2]);
  if(y>511){
    y-=1024;
  }
   z=(((data[5]&0x03)*256)+data[4]);
  if(z>511){
    z-=1024;
  }

 int maxx,maxy,maxz;
 
  maxx=abs(x-xAccl);
  maxy=abs(y-yAccl);
  maxz=abs(z-zAccl);
 

  xAccl=x;
  yAccl=y;
  zAccl=z;

 if(maxx>50||maxy>50||maxz>50)
 {
  
    if(movewarning==0)
    {
      movecount+=1;
      if(movecount==2)
      {
          movecount=0;
          movewarning=1;
          warnmsg["ename"] = "zs/1";
          warnmsg["msg"]="异常移动";
          serializeJson(warnmsg ,output4);
          if (!  photocellwarn.publish(output4.c_str())) 
          { 
            Serial.println(F("Failed"));
          } else {
            Serial.println(F("OK!"));
            delay(200);
          }
      }
  
    }else{
          warnmsg["ename"] = "zs/1";
          warnmsg["msg"]="异常移动";
          serializeJson(warnmsg ,output4);
          if (!  photocellwarn.publish(output4.c_str())) 
          { 
            Serial.println(F("Failed"));
          } else {
            Serial.println(F("OK!"));
            delay(200);
          }
    }
         
 }else{
    if(movewarning==1)
    {
      movecount+=1;
      if(movecount==3)
      {
          movecount=0;
          movewarning=0;
          warnmsgrecover["ename"] = "zs/1";
          warnmsgrecover["msg"]="异常移动恢复";
          serializeJson(warnmsgrecover ,output4);
          if (!  photocellwarnrecover.publish(output4.c_str())) 
          { 
            Serial.println(F("Failed"));
          } else {
            Serial.println(F("OK!"));
            delay(200);
          }
      }
    }else{
       movecount=0;
    }
 }

 if(check==0&&movewarning==1){
  Serial.println("light");
    for(int i = 0;i < 4;i++){
     int R = 255;
    int G = 0;
    int B = 0;
    strip.setPixelColor(i,strip.Color(R,G,B));
    strip.show();
    delay(50);
  }
 }else{
  
    for(int i = 0;i < 4;i++){
     int R = 0;
    int G = 0;
    int B = 0;
    strip.setPixelColor(i,strip.Color(R,G,B));
    strip.show();
    delay(50);
  }
 }

 count++;
 if(count>=1000){
      tah["ename"] = "zs/1";
     tah["humi"] = nowhumidity;
     tah["temp"] = nowtemperature;
     serializeJson(warnmsg ,output5);
     if (!  photoceltah.publish(output5.c_str())) 
     { 
         Serial.println(F("Failed"));
     } else {
         Serial.println(F("OK!"));
         delay(200);
     }
     count=0;
 
 }

}

void MQTT_connect() {
int8_t ret;

// Stop if already connected. 
if (mqtt.connected()) {
return;
}
Serial.print("Connecting to MQTT... "); uint8_t retries = 3;
while ((ret = mqtt.connect()) != 0) { // connect will return 0 for connected 
  Serial.println(mqtt.connectErrorString(ret));
Serial.println("Retrying MQTT connection in 5 seconds..."); mqtt.disconnect();
delay(5000);  // wait 5 seconds retries--;
if (retries == 0) {
// basically die and wait for WDT to reset me 
while (1);
}
}
Serial.println("MQTT Connected!");


  String initstr="zs/1";
  photocellinit.publish(initstr.c_str());



}
