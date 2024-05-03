module gw_gao(
    \bytes_to_pwm_x[31] ,
    \bytes_to_pwm_x[30] ,
    \bytes_to_pwm_x[29] ,
    \bytes_to_pwm_x[28] ,
    \bytes_to_pwm_x[27] ,
    \bytes_to_pwm_x[26] ,
    \bytes_to_pwm_x[25] ,
    \bytes_to_pwm_x[24] ,
    \bytes_to_pwm_x[23] ,
    \bytes_to_pwm_x[22] ,
    \bytes_to_pwm_x[21] ,
    \bytes_to_pwm_x[20] ,
    \bytes_to_pwm_x[19] ,
    \bytes_to_pwm_x[18] ,
    \bytes_to_pwm_x[17] ,
    \bytes_to_pwm_x[16] ,
    \bytes_to_pwm_x[15] ,
    \bytes_to_pwm_x[14] ,
    \bytes_to_pwm_x[13] ,
    \bytes_to_pwm_x[12] ,
    \bytes_to_pwm_x[11] ,
    \bytes_to_pwm_x[10] ,
    \bytes_to_pwm_x[9] ,
    \bytes_to_pwm_x[8] ,
    \bytes_to_pwm_x[7] ,
    \bytes_to_pwm_x[6] ,
    \bytes_to_pwm_x[5] ,
    \bytes_to_pwm_x[4] ,
    \bytes_to_pwm_x[3] ,
    \bytes_to_pwm_x[2] ,
    \bytes_to_pwm_x[1] ,
    \bytes_to_pwm_x[0] ,
    clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \bytes_to_pwm_x[31] ;
input \bytes_to_pwm_x[30] ;
input \bytes_to_pwm_x[29] ;
input \bytes_to_pwm_x[28] ;
input \bytes_to_pwm_x[27] ;
input \bytes_to_pwm_x[26] ;
input \bytes_to_pwm_x[25] ;
input \bytes_to_pwm_x[24] ;
input \bytes_to_pwm_x[23] ;
input \bytes_to_pwm_x[22] ;
input \bytes_to_pwm_x[21] ;
input \bytes_to_pwm_x[20] ;
input \bytes_to_pwm_x[19] ;
input \bytes_to_pwm_x[18] ;
input \bytes_to_pwm_x[17] ;
input \bytes_to_pwm_x[16] ;
input \bytes_to_pwm_x[15] ;
input \bytes_to_pwm_x[14] ;
input \bytes_to_pwm_x[13] ;
input \bytes_to_pwm_x[12] ;
input \bytes_to_pwm_x[11] ;
input \bytes_to_pwm_x[10] ;
input \bytes_to_pwm_x[9] ;
input \bytes_to_pwm_x[8] ;
input \bytes_to_pwm_x[7] ;
input \bytes_to_pwm_x[6] ;
input \bytes_to_pwm_x[5] ;
input \bytes_to_pwm_x[4] ;
input \bytes_to_pwm_x[3] ;
input \bytes_to_pwm_x[2] ;
input \bytes_to_pwm_x[1] ;
input \bytes_to_pwm_x[0] ;
input clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \bytes_to_pwm_x[31] ;
wire \bytes_to_pwm_x[30] ;
wire \bytes_to_pwm_x[29] ;
wire \bytes_to_pwm_x[28] ;
wire \bytes_to_pwm_x[27] ;
wire \bytes_to_pwm_x[26] ;
wire \bytes_to_pwm_x[25] ;
wire \bytes_to_pwm_x[24] ;
wire \bytes_to_pwm_x[23] ;
wire \bytes_to_pwm_x[22] ;
wire \bytes_to_pwm_x[21] ;
wire \bytes_to_pwm_x[20] ;
wire \bytes_to_pwm_x[19] ;
wire \bytes_to_pwm_x[18] ;
wire \bytes_to_pwm_x[17] ;
wire \bytes_to_pwm_x[16] ;
wire \bytes_to_pwm_x[15] ;
wire \bytes_to_pwm_x[14] ;
wire \bytes_to_pwm_x[13] ;
wire \bytes_to_pwm_x[12] ;
wire \bytes_to_pwm_x[11] ;
wire \bytes_to_pwm_x[10] ;
wire \bytes_to_pwm_x[9] ;
wire \bytes_to_pwm_x[8] ;
wire \bytes_to_pwm_x[7] ;
wire \bytes_to_pwm_x[6] ;
wire \bytes_to_pwm_x[5] ;
wire \bytes_to_pwm_x[4] ;
wire \bytes_to_pwm_x[3] ;
wire \bytes_to_pwm_x[2] ;
wire \bytes_to_pwm_x[1] ;
wire \bytes_to_pwm_x[0] ;
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
    .data_i({\bytes_to_pwm_x[31] ,\bytes_to_pwm_x[30] ,\bytes_to_pwm_x[29] ,\bytes_to_pwm_x[28] ,\bytes_to_pwm_x[27] ,\bytes_to_pwm_x[26] ,\bytes_to_pwm_x[25] ,\bytes_to_pwm_x[24] ,\bytes_to_pwm_x[23] ,\bytes_to_pwm_x[22] ,\bytes_to_pwm_x[21] ,\bytes_to_pwm_x[20] ,\bytes_to_pwm_x[19] ,\bytes_to_pwm_x[18] ,\bytes_to_pwm_x[17] ,\bytes_to_pwm_x[16] ,\bytes_to_pwm_x[15] ,\bytes_to_pwm_x[14] ,\bytes_to_pwm_x[13] ,\bytes_to_pwm_x[12] ,\bytes_to_pwm_x[11] ,\bytes_to_pwm_x[10] ,\bytes_to_pwm_x[9] ,\bytes_to_pwm_x[8] ,\bytes_to_pwm_x[7] ,\bytes_to_pwm_x[6] ,\bytes_to_pwm_x[5] ,\bytes_to_pwm_x[4] ,\bytes_to_pwm_x[3] ,\bytes_to_pwm_x[2] ,\bytes_to_pwm_x[1] ,\bytes_to_pwm_x[0] }),
    .clk_i(clk)
);

endmodule
