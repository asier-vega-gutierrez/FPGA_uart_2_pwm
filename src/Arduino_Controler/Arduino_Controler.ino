#include "SPI.h"

//---SERVO---
//Constantes servo
const int pinJoyX = A0; //pin eje x
const int pinJoyY = A1; //pin eje y
const int pinJoyButton = 2; //pin boton
//Valores del servo
int Xvalue = 0;
int Yvalue = 0;
bool buttonValue = false;

//---RX---
//Constante de maxima de bytes leidos, 3 de datos y uno de salto de linea, el numero maximo a representar es 020_000_000
const int MAX_BYTES = 4; 
//Esta varaible cambia a 1 cuanado hemos leido todo los bytes de datos utiles, en este caso 3 bytes
bool endMsg = 0;
//Este es el contador de bytes, se ocupa de activar la variable anterior
int byteCont = 0; //si definimos el contador como global las lecturas son mejores
//Aqui se
int rxBytes[3] = {0,0,0};

//---SETUP---
void setup() {
  //Pin del boton como pullup
  pinMode(pinJoyButton , INPUT_PULLUP);
  //Serial para hacer debug
  Serial.begin(9600);
  //Serial para recibir
  Serial1.begin(9600);
  //Serial para enviar
  Serial2.begin(9600);
}

//---LOOP---
void loop() {
  
  /*//Lectura de entradas aanalogicas
  Xvalue = analogRead(pinJoyX);
  delay(100); //es necesaria una pequeña pausa entre lecturas analógicas
  Yvalue = analogRead(pinJoyY);
  //Lectura de entradas digitales
  buttonValue = digitalRead(pinJoyButton);*/

  //Enviamos por el serial de comunicacion
  /*Serial1.print(Xvalue);
  Serial1.print("/");
  Serial1.print(Yvalue);
  Serial1.print("/");
  Serial1.println(buttonValue);*/
  //Serial1.print(0x02);

  //Vemos la informacion actual por el serial
  /*Serial.print("X:" );
  Serial.print(Xvalue);
  Serial.print(" | Y: ");
  Serial.print(Yvalue);
  Serial.print(" | Pulsador: ");
  Serial.println(buttonValue);*/

  //Leemos el puerto rx
  read_rx(rxBytes);
  Serial.print(rxBytes[0]);
  Serial.print(rxBytes[1]);
  Serial.println(rxBytes[2]);
  //Se deve resetear el array con los bytes leidos cada bucle ya que si no se genera muchos datos invalidos, mejor que sean siempre 0
  rxBytes[0] = 0;
  rxBytes[1] = 0;
  rxBytes[2] = 0;

  //Enviamos por el puerto tx
  Serial2.write(0b00001001);

  
}

//---FUNCIONES---

//Funcion para leer del rx del serial1
void read_rx(int store_bytes[3]){
  if (Serial1.available()) {
    //Leemos el byte
    char inByte = Serial1.read();
    //Si es un cambio de linea se ha acabado el mensaje
    if (inByte == '\n') {
      //Reseteamos la varaible de fin de mensaje
      endMsg = 0;
      //Rseteamos la variable de contador de bytes
      byteCont = 0;
      //Serial.write(inByte);
    }else{
      //Si no se ha acabado el mensaje
      if (endMsg == 0) {
        //Cambiamos el codigo ASCII char del mensaje a decimal
        int inDecimal = int(inByte);
        //Lo almacenamos el su correspondiente espacio
        store_bytes[byteCont] = inDecimal;
        //Vamos comprobando que se hayan leido los 3 bytes
        if (byteCont == MAX_BYTES-1) {
          endMsg = 1;
        }
        //Sumamos un byte leido al contado
        byteCont = byteCont + 1;
        //Serial.print(inDecimal);
      }
    }
  }
}
