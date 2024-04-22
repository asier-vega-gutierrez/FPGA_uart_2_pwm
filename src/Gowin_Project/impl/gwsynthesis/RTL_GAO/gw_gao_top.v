module gw_gao(
    \pwm_period[19] ,
    \pwm_period[18] ,
    \pwm_period[17] ,
    \pwm_period[16] ,
    \pwm_period[15] ,
    \pwm_period[14] ,
    \pwm_period[13] ,
    \pwm_period[12] ,
    \pwm_period[11] ,
    \pwm_period[10] ,
    \pwm_period[9] ,
    \pwm_period[8] ,
    \pwm_period[7] ,
    \pwm_period[6] ,
    \pwm_period[5] ,
    \pwm_period[4] ,
    \pwm_period[3] ,
    \pwm_period[2] ,
    \pwm_period[1] ,
    \pwm_period[0] ,
    pin_pwm,
    clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \pwm_period[19] ;
input \pwm_period[18] ;
input \pwm_period[17] ;
input \pwm_period[16] ;
input \pwm_period[15] ;
input \pwm_period[14] ;
input \pwm_period[13] ;
input \pwm_period[12] ;
input \pwm_period[11] ;
input \pwm_period[10] ;
input \pwm_period[9] ;
input \pwm_period[8] ;
input \pwm_period[7] ;
input \pwm_period[6] ;
input \pwm_period[5] ;
input \pwm_period[4] ;
input \pwm_period[3] ;
input \pwm_period[2] ;
input \pwm_period[1] ;
input \pwm_period[0] ;
input pin_pwm;
input clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \pwm_period[19] ;
wire \pwm_period[18] ;
wire \pwm_period[17] ;
wire \pwm_period[16] ;
wire \pwm_period[15] ;
wire \pwm_period[14] ;
wire \pwm_period[13] ;
wire \pwm_period[12] ;
wire \pwm_period[11] ;
wire \pwm_period[10] ;
wire \pwm_period[9] ;
wire \pwm_period[8] ;
wire \pwm_period[7] ;
wire \pwm_period[6] ;
wire \pwm_period[5] ;
wire \pwm_period[4] ;
wire \pwm_period[3] ;
wire \pwm_period[2] ;
wire \pwm_period[1] ;
wire \pwm_period[0] ;
wire pin_pwm;
wire clk;
wire tms_pad_i;
wire tck_pad_i;
wire tdi_pad_i;
wire tdo_pad_o;
wire tms_i_c;
wire tck_i_c;
wire tdi_i_c;
wire tdo_o_c;
wire [9:0] control0;
wire gao_jtag_tck;
wire gao_jtag_reset;
wire run_test_idle_er1;
wire run_test_idle_er2;
wire shift_dr_capture_dr;
wire update_dr;
wire pause_dr;
wire enable_er1;
wire enable_er2;
wire gao_jtag_tdi;
wire tdo_er1;

IBUF tms_ibuf (
    .I(tms_pad_i),
    .O(tms_i_c)
);

IBUF tck_ibuf (
    .I(tck_pad_i),
    .O(tck_i_c)
);

IBUF tdi_ibuf (
    .I(tdi_pad_i),
    .O(tdi_i_c)
);

OBUF tdo_obuf (
    .I(tdo_o_c),
    .O(tdo_pad_o)
);

GW_JTAG  u_gw_jtag(
    .tms_pad_i(tms_i_c),
    .tck_pad_i(tck_i_c),
    .tdi_pad_i(tdi_i_c),
    .tdo_pad_o(tdo_o_c),
    .tck_o(gao_jtag_tck),
    .test_logic_reset_o(gao_jtag_reset),
    .run_test_idle_er1_o(run_test_idle_er1),
    .run_test_idle_er2_o(run_test_idle_er2),
    .shift_dr_capture_dr_o(shift_dr_capture_dr),
    .update_dr_o(update_dr),
    .pause_dr_o(pause_dr),
    .enable_er1_o(enable_er1),
    .enable_er2_o(enable_er2),
    .tdi_o(gao_jtag_tdi),
    .tdo_er1_i(tdo_er1),
    .tdo_er2_i(1'b0)
);

gw_con_top  u_icon_top(
    .tck_i(gao_jtag_tck),
    .tdi_i(gao_jtag_tdi),
    .tdo_o(tdo_er1),
    .rst_i(gao_jtag_reset),
    .control0(control0[9:0]),
    .enable_i(enable_er1),
    .shift_dr_capture_dr_i(shift_dr_capture_dr),
    .update_dr_i(update_dr)
);

ao_top u_ao_top(
    .control(control0[9:0]),
    .data_i({\pwm_period[19] ,\pwm_period[18] ,\pwm_period[17] ,\pwm_period[16] ,\pwm_period[15] ,\pwm_period[14] ,\pwm_period[13] ,\pwm_period[12] ,\pwm_period[11] ,\pwm_period[10] ,\pwm_period[9] ,\pwm_period[8] ,\pwm_period[7] ,\pwm_period[6] ,\pwm_period[5] ,\pwm_period[4] ,\pwm_period[3] ,\pwm_period[2] ,\pwm_period[1] ,\pwm_period[0] ,pin_pwm}),
    .clk_i(clk)
);

endmodule
