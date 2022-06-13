void setup() {
  // put your setup code here, to run once:
   pinMode(LED_BUILTIN,OUTPUT);
   pinMode(4,OUTPUT);
  
}

void loop() {
  // put your main code here, to run repeatedly:
  for(int i=0;i<2048;i++)
  {
    analogWrite(LED_BUILTIN,i);
    analogWrite(4,2047-i);
    delay(1);
  }
  
  for(int i=2047;i>=0;i--)
  {
    analogWrite(LED_BUILTIN,i);
    analogWrite(4,2047-i);
    delay(1);
  }
 
  

}
