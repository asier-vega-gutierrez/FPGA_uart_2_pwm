


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
        .i_uart_tx_en(1'b1), //Habilitar desahbilitar el envio
        .i_uart_tx_data(uart_tx_data), //Datos, proces y byte cada vez
        .o_uart_txd(uart_tx), //Pin de envio de datos
        .o_uart_tx_busy(control_leds[0])//Para indicar que tx esta en uso     
    );
    

    /*servo_control servo(
        .clk(clk), //reloj
        .in_pwm((RX_Byte*1_000_000)/37), //ancho de pulso pwm
        .pin_pwm(pin_pwm) //linea para pwm
    );*/

endmodule