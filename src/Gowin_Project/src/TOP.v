


module TOP (
    input clk,
    output pin_pwm

);

    servo_control servo(
        .clk(clk),
        .in_pwm(2_000_000/37),
        .pin_pwm(pin_pwm)
    );
    

endmodule