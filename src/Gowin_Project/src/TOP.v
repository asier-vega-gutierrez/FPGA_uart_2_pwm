


module TOP (
    input clk,
    
    //Servo
    output pin_pwm,

    //Uart
    input reset_uart, // Slide switches.
    input wire uart_rx, // UART Recieve pin.
    output wire uart_tx, // UART transmit pin.

    //Control
    output[7:0] control_leds
);


    //Numero de bytes por mensaje 8 siempre
    parameter PAYLOAD_BITS = 8; 

    //---RX---
    
    localparam STEPS_RX_0 = 0;
    localparam STEPS_RX_1 = 1;
    localparam STEPS_RX_2 = 2;
    localparam STEPS_RX_3 = 3;
    
    reg[1:0] state_rx = 0;

    wire[7:0] uart_rx_data;
    wire uart_rx_valid;

    reg[23:0] uart_rx_bytes;

    uart_rx rx(
        .i_clk(clk), //reloj
        .i_resetn(~reset_uart), //reset
        .i_uart_rxd(uart_rx), //Pin de recepcion de datos
        .i_uart_rx_en(1'b1), //Habilitar deshabilitar la recepcion
        .o_uart_rx_break(), //Se activa si se ha cortado el envio
        .o_uart_rx_valid(uart_rx_valid), //Se activa si los datos recibidos son validos
        .o_uart_rx_data(uart_rx_data) //Datos del envio
    );

    //HAY QUE ENVIAR UN MENSAJE DE FINAL DE MENSAJE COMO "\n"
    always @(posedge clk) begin
        if (!reset_uart) begin
            case (state_rx)
                STEPS_RX_0: begin
                    uart_rx_bytes[23:16] <= uart_rx_data;
                    state_rx <= (uart_rx_valid == 1'b1) ? STEPS_RX_1 : STEPS_RX_0;
                end
                STEPS_RX_1: begin
                    uart_rx_bytes[15:8] <= uart_rx_data;
                    state_rx <= (uart_rx_valid == 1'b1) ? STEPS_RX_2 : STEPS_RX_1;
                end
                STEPS_RX_2: begin
                    uart_rx_bytes[7:0] <= uart_rx_data;
                    state_rx <= (uart_rx_valid == 1'b1) ? STEPS_RX_0 : STEPS_RX_2;
                end
            endcase
        end
    end
    

    
    assign control_leds[0] = uart_rx_bytes[16];
    assign control_leds[1] = uart_rx_bytes[17];
    assign control_leds[2] = uart_rx_bytes[18];
    assign control_leds[3] = uart_rx_bytes[19];
    assign control_leds[4] = uart_rx_bytes[20];
    assign control_leds[5] = uart_rx_bytes[21];
    assign control_leds[6] = uart_rx_bytes[22];
    assign control_leds[7] = uart_rx_bytes[23];
    
    /*assign control_leds[0] = uart_rx_bytes[8];
    assign control_leds[1] = uart_rx_bytes[9];
    assign control_leds[2] = uart_rx_bytes[10];
    assign control_leds[3] = uart_rx_bytes[11];
    assign control_leds[4] = uart_rx_bytes[12];
    assign control_leds[5] = uart_rx_bytes[13];
    assign control_leds[6] = uart_rx_bytes[14];
    assign control_leds[7] = uart_rx_bytes[15];*/
    
    /*assign control_leds[0] = uart_rx_bytes[0];
    assign control_leds[1] = uart_rx_bytes[1];
    assign control_leds[2] = uart_rx_bytes[2];
    assign control_leds[3] = uart_rx_bytes[3];
    assign control_leds[4] = uart_rx_bytes[4];
    assign control_leds[5] = uart_rx_bytes[5];
    assign control_leds[6] = uart_rx_bytes[6];
    assign control_leds[7] = uart_rx_bytes[7];*/


    //---TX---

    
    //Posibles estados
    localparam MAIN_0 = 0;
    localparam MAIN_1 = 1;
    localparam MAIN_2 = 2;
    localparam MAIN_3 = 3;

    //Registro para establecer estados
    reg[1:0] state = 0;

    //Registro para enviar datos
    reg[PAYLOAD_BITS-1:0] uart_tx_data;
    //Varaibel de control de tx
    wire uart_tx_busy;

    //Bytes de batos utiles
    reg[23:0] uart_tx_bytes = {8'd20, 8'd0, 8'd0};
    
    //Secuencia de envio de datos
    always @(posedge clk) begin
        if (!reset_uart) begin
            case(state)
                MAIN_0: begin
                    uart_tx_data <= uart_tx_bytes[23:16];
                    state <= (uart_tx_busy == 1'b0) ? MAIN_1 : MAIN_0;
                end
                MAIN_1: begin
                    uart_tx_data <= uart_tx_bytes[15:8];
                    state <= (uart_tx_busy == 1'b0) ? MAIN_2 : MAIN_1;
                end
                MAIN_2: begin
                    uart_tx_data <= uart_tx_bytes[7:0];
                    state <= (uart_tx_busy == 1'b0) ? MAIN_3 : MAIN_2;
                end
                MAIN_3: begin
                    uart_tx_data <= 8'b00001010;
                    state <= (uart_tx_busy == 1'b0) ? MAIN_0 : MAIN_3;
                end
            endcase
        end
    end

  
    uart_tx tx(
        .i_clk(clk), //reloj 
        .i_resetn(~reset_uart), //reset
        .i_uart_tx_en(1'b1), //Habilitar desahabilitar el envio
        .i_uart_tx_data(uart_tx_data), //Datos a enviar
        .o_uart_txd(uart_tx), //Pin de envio de datos
        .o_uart_tx_busy(uart_tx_busy)//Para indicar que tx esta en uso
    );
    

    //---SERVO---

    servo_control servo(
        .clk(clk), //reloj
        .in_pwm((2_000_000)/37), //ancho de pulso pwm
        .pin_pwm(pin_pwm) //linea para pwm
    );


endmodule