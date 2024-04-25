#include "SPI.h"

//Constantes servo
const int pinJoyX = A0; //pin eje x
const int pinJoyY = A1; //pin eje y
const int pinJoyButton = 2; //pin boton

//Inicializamos los valores
int Xvalue = 0;
int Yvalue = 0;
bool buttonValue = false;

void setup() {
  //Pin del boton como pullup
  pinMode(pinJoyButton , INPUT_PULLUP);
  //Serial para ahcer debug
  Serial.begin(9600);
  Serial1.begin(9600);
}

void loop() {
  
  //Lectura de entradas aanalogicas
  Xvalue = analogRead(pinJoyX);
  delay(100); //es necesaria una pequeña pausa entre lecturas analógicas
  Yvalue = analogRead(pinJoyY);
  //Lectura de entradas digitales
  buttonValue = digitalRead(pinJoyButton);

  //Enviamos por el serial de comunicacion
  /*Serial1.print(Xvalue);
  Serial1.print("/");
  Serial1.print(Yvalue);
  Serial1.print("/");
  Serial1.println(buttonValue);*/
  //Serial1.print(0x02);
  if (Serial1.available()) {
    int inByte = Serial1.read();
    Serial.write(inByte);
  }

  //Vemos la informacion actual por el serial
  /*Serial.print("X:" );
  Serial.print(Xvalue);
  Serial.print(" | Y: ");
  Serial.print(Yvalue);
  Serial.print(" | Pulsador: ");
  Serial.println(buttonValue);*/


}
