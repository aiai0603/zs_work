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
client.println("hello from ESP8266  by zs 31801150");
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
