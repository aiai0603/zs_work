#include<dht11.h>

dht11 DHT11;
void setup() {
  // put your setup code here, to run once:
   Serial.begin(115200);
  
}

void loop() {
  int chk = DHT11.read(5);
  // put your main code here, to run repeatedly:
  Serial.print("Humidity (%): ");
  Serial.println((float)DHT11.humidity, 2);

  Serial.print("Temperature °C): ");
  Serial.println((float)DHT11.temperature, 2);

  delay(2000);
}
