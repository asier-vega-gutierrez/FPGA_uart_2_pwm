


module TOP (
    input clk,
    
    //Servo
    output pin_pwm,

    //Uart
    input reset_uart, // Slide switches.
    input wire uart_rx, // UART Recieve pin.
    output wire uart_tx, // UART transmit pin.

    //Control
    output[3:0]  control_leds //0: tx_busy 1: 2: 3:

);

    wire[7:0] uart_tx_data = 8'b01000001;
    uart_tx tx(
        .i_clk(clk), //reloj 
        .i_resetn(~reset_uart), //reset //TODO no corta instantanemente
        .i_uart_tx_en(1'b1), //Habilitar desahabilitar el envio
        .i_uart_tx_data(uart_tx_data), //Datos a enviar
        .o_uart_txd(uart_tx), //Pin de envio de datos
        .o_uart_tx_busy()//Para indicar que tx esta en uso //TODO no funciona
    );

    wire[7:0] uart_rx_data;
    wire uart_rx_valid;
    uart_rx rx(
        .clk(clk), //reloj
        .resetn(~reset_uart), //reset //TODO no corta instantanemente
        .uart_rxd(uart_rx), //Pin de recepcion de datos
        .uart_rx_en(1'b1), //Habilitar deshabilitar la recepcion
        .uart_rx_break(), //Se activa si se ha cortado el envio
        .uart_rx_valid(uart_rx_valid), //Se activa si los datos recibidos son validos
        .uart_rx_data(uart_rx_data) //Datos del envio
    );
    
    
    assign control_leds[0] = uart_rx_data[0];
    assign control_leds[1] = uart_rx_data[1];
    assign control_leds[2] = uart_rx_data[2];
    assign control_leds[3] = uart_rx_data[3];
    

    /*servo_control servo(
        .clk(clk), //reloj
        .in_pwm((RX_Byte*1_000_000)/37), //ancho de pulso pwm
        .pin_pwm(pin_pwm) //linea para pwm
    );*/

endmodule