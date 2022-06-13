#include <ESP8266WiFi.h>
#include "Adafruit_MQTT.h"
#include "Adafruit_MQTT_Client.h"
#define WLAN_SSID   "Mi 10000 Ultra"
#define WLAN_PASS   "88888888"
#define AIO_SERVER    "re0b1e3a.cn.emqx.cloud"
#define AIO_SERVERPORT   11649
#define AIO_USERNAME   "zs"
#define AIO_KEY        "sss991126"
#include"SSD1306Wire.h"
SSD1306Wire display(0x3c,2,14);



// Create an ESP8266 WiFiClient class to connect to the MQTT server.
WiFiClient client;
// or... use WiFiClientSecure for SSL
//WiFiClientSecure client;


// Setup the MQTT client class by passing in the WiFi client and MQTT server and login details.
Adafruit_MQTT_Client mqtt(&client, AIO_SERVER, AIO_SERVERPORT, AIO_USERNAME, AIO_KEY);
// Setup a feed called 'photocell' for publishing.
// Notice MQTT paths for AIO follow the form: <username>/feeds/<feedname> 
Adafruit_MQTT_Publish photocell = Adafruit_MQTT_Publish(&mqtt, AIO_USERNAME "iot");

// Setup a feed called 'onoff' for subscribing to changes.
Adafruit_MQTT_Subscribe  onoffbutton = Adafruit_MQTT_Subscribe(&mqtt, AIO_USERNAME "iot/1");

// Bug workaround for Arduino 1.6.6, it seems to need a function declaration
// for some reason (only affects ESP8266, likely an arduino-builder bug). 
void MQTT_connect();

void setup() {
Serial.begin(115200); delay(10);
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
}
uint32_t x=0; void loop() {
// Ensure the connection to the MQTT server is alive (this will make the first
//  connection  and automatically reconnect when  disconnected).  See the MQTT_connect
// function definition further below. 
MQTT_connect();

// this is our 'wait for incoming subscription packets' busy subloop
// try to spend your time here

Adafruit_MQTT_Subscribe *subscription;
while ((subscription = mqtt.readSubscription(5000))) { if (subscription == &onoffbutton) {
  Serial.print(F("Got: "));
  Serial.println((char *)onoffbutton.lastread);

  display.flipScreenVertically();
  display.clear();
  display.drawString(0,10,"topic: iot/1");
  display.drawString(0,20,(char *)onoffbutton.lastread);
  display.display();
  delay(2000);
}
}
// Now we can publish stuff! 
Serial.print(F("\nSending photocell val ")); Serial.print(x);
Serial.print("...");
if (! photocell.publish(x++)) { Serial.println(F("Failed"));
} else {
Serial.println(F("OK!"));
 
  display.flipScreenVertically();
  display.clear();
  display.drawString(0,10,"topic: zhangshuai");
  display.drawString(0,20,String(x));
  display.display();
  delay(2000);
}

// ping the server to keep the mqtt connection alive
// NOT required if you are publishing once every KEEPALIVE seconds
/*
if(! mqtt.ping()) { mqtt.disconnect();
}
*/
}

// Function to connect and reconnect as necessary to the MQTT server.
// Should be called in the loop function and it will take care if connecting. 
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
}
