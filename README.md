## Aplicacion de comunicacion uart para controlar led por pwm
<ul>
    <li>Fechas: Mayo 2024</li>
    <li>Descripción: Se parte de una FPGA Shipeed Tang Premier 20k al que conectamos un led SMD RGB (dos colores rojo y verde) y de un arduino mega con un joystick analogico. El objetivo es emplear el joystick para controlar la intensidad y los dos colores de la led. Para ello se plantea la siguiente aplicacion: 1 . el arduino provee alimentacion a 5v y entrada analogica al joystcik (la fpga no puede), 2. se establece una linea de comunicacion serie empleando el protocolo UART que envia desde el arduino al la FPGA, 3. en la FPGA se implementa el circuito que realiza la recepcion del mensaje y que cambia el valor de la led empleando PWM. La implentacion de este circuito se realiza en Verilog y cuenta de la siguiente partes: lectura de 8 bits (1 byte) del pin designado como RX (receptor UART), a traves de esto se leen 4 bytes: 1.byte eje x del joystick y 2.byte eje y del joystick: codificados de 0 a 1023 (8'b0 a 8'b1), 3.byte boton del joystick (primer bit a 0 o 1) y 4.byte fin de mensaje "\n"(8'b00001010). Por ultimo se transforma el valor y se emplea para generar la señal PWM (20 ms) a al led, teniendo en cuenta el reloj interno de 27 MHz.

Se incluyen videos de demostracion en "/doc"

![foto](https://github.com/asier-vega-gutierrez/FPGA_uart_2_pwm/blob/main/doc/Esquema.png)

</li>
    <li>Referencias</li>
</ul>

https://github.com/nandland/UART
