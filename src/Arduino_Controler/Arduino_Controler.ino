

//---SERVO---
//Constantes servo
const int pinJoyX = A0; //pin eje x
const int pinJoyY = A1; //pin eje y
const int pinJoyButton = 2; //pin boton
//Valores del servo
int Xvalue = 0;
int Yvalue = 0;
bool buttonValue = false;
long servo_current_position;

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
  
  //Lectura de entradas aanalogicas
  Xvalue = analogRead(pinJoyX);
  delay(100); //es necesaria una pequeña pausa entre lecturas analógicas
  Yvalue = analogRead(pinJoyY);
  //Lectura de entradas digitales
  buttonValue = digitalRead(pinJoyButton);

   //Vemos la informacion actual por el serial
  /*Serial.print("X:" );
  Serial.print(Xvalue);
  Serial.print(" | Y: ");
  Serial.print(Yvalue);
  Serial.print(" | Pulsador: ");
  Serial.println(buttonValue);*/

  //Leemos el puerto rx
  read_rx(rxBytes);
  if(rxBytes[0] > 0 || rxBytes[1] > 0 || rxBytes[2] > 0){
    servo_current_position = bytes_to_int(rxBytes);
    Serial.println(servo_current_position);
  }
  
  //Se deve resetear el array con los bytes leidos cada bucle ya que si no se genera muchos datos invalidos, mejor que sean siempre 0
  rxBytes[0] = 0;
  rxBytes[1] = 0;
  rxBytes[2] = 0;

  //Enviamos por el puerto tx
  Serial2.write(Xvalue);
  delay(3);
  Serial2.write(Yvalue);
  delay(3);
  Serial2.write(buttonValue);
  delay(3);
  Serial2.write(0b00001010);
  
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

//Funcion para pasar de byte a long
long bytes_to_int(int bytes[3]){
  //El cambio se haca atraves de un string
  String number = String("");
  //Recorremos todos los bytes
  for (int i = 0; i <= sizeof(bytes); i++){
    //Convertimos el byte actual a string
    String byte = String(bytes[i]);
    //En funcion de su longitud necesitara que añadamos "00" si es "1" -> "001" y "0" si es "11" -> "011"
    if (byte.length() == 1){
      number = number + "00" + byte;
    }else if(byte.length() == 2){
      number = number + "0" + byte;
    }else{
      number = number + byte;
    }
  }
  //Serial.println(number); //020000000
  return number.toInt(); //aunque ponga to int, si el valor a devolver es long, devuelve un long
}





