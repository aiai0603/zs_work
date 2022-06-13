#include <ESP8266WiFi.h>
#include"SSD1306Wire.h"
SSD1306Wire display(0x3c,2,14);

#define MAX_SRV_CLIENTS 4
#define DebugBegin(baud_rate)  Serial.begin(baud_rate)
#define DebugPrintln(message) Serial.println(message)
#define DebugPrint(message) Serial.print(message)

const char* ssid = "Mi 10000 Ultra"; 
const char* password = "88888888";


WiFiServer server(2020);
WiFiClient  serverClients[MAX_SRV_CLIENTS];


void setup() { 
   display.init();
  DebugBegin(115200); WiFi.mode(WIFI_STA); WiFi.begin(ssid, password); DebugPrint("\nConnecting to "); DebugPrintln(ssid);
  uint8_t i = 0;
  while (WiFi.status() != WL_CONNECTED && i++ < 20) 
  { delay(500);
  }
  if (i == 21) {
  DebugPrint("Could not connect to"); DebugPrintln(ssid);
  while (1) { delay(500);
  }
}
   server.begin(); 
   server.setNoDelay(true);

  DebugPrint("Ready! Use 'telnet "); 
  DebugPrint(WiFi.localIP()); 
  DebugPrintln(" 2020' to connect");
}

void loop(){
uint8_t i;

if (server.hasClient()) {
for (i = 0; i < MAX_SRV_CLIENTS; i++) {

if (!serverClients[i] || !serverClients[i].connected()) { if (serverClients[i]) {
serverClients[i].stop();
}

serverClients[i] = server.available(); 
DebugPrint("New client: "); 
DebugPrint(i);
break;
}
}

if (i == MAX_SRV_CLIENTS) {
WiFiClient serverClient = server.available(); serverClient.stop(); DebugPrintln("Connection rejected ");
}
}

for (i = 0; i < MAX_SRV_CLIENTS; i++) {
if (serverClients[i] && serverClients[i].connected()) { if (serverClients[i].available()) {
  display.flipScreenVertically();
  display.setFont(ArialMT_Plain_16);
  display.clear();
 String str="";
while (serverClients[i].available()) {
 str+=(char)serverClients[i].read();
//  Serial.write(serverClients[i].read());
}
  display.drawString(0,0,str);
  display.display();
  delay(2000);
}
}
}

if (Serial.available()) {

size_t len = Serial.available();
uint8_t sbuf[len]; Serial.readBytes(sbuf, len);

for (i = 0; i < MAX_SRV_CLIENTS; i++) {
if (serverClients[i] && serverClients[i].connected()) { serverClients[i].write(sbuf, len);
delay(1);
}
}
}
}
