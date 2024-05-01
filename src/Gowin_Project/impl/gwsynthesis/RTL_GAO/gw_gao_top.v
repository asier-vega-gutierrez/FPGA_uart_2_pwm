module gw_gao(
    \bytes_to_decimal[24] ,
    \bytes_to_decimal[23] ,
    \bytes_to_decimal[22] ,
    \bytes_to_decimal[21] ,
    \bytes_to_decimal[20] ,
    \bytes_to_decimal[19] ,
    \bytes_to_decimal[18] ,
    \bytes_to_decimal[17] ,
    \bytes_to_decimal[16] ,
    \bytes_to_decimal[15] ,
    \bytes_to_decimal[14] ,
    \bytes_to_decimal[13] ,
    \bytes_to_decimal[12] ,
    \bytes_to_decimal[11] ,
    \bytes_to_decimal[10] ,
    \bytes_to_decimal[9] ,
    \bytes_to_decimal[8] ,
    \bytes_to_decimal[7] ,
    \bytes_to_decimal[6] ,
    \bytes_to_decimal[5] ,
    \bytes_to_decimal[4] ,
    \bytes_to_decimal[3] ,
    \bytes_to_decimal[2] ,
    \bytes_to_decimal[1] ,
    \bytes_to_decimal[0] ,
    \servo_control_data[19] ,
    \servo_control_data[18] ,
    \servo_control_data[17] ,
    \servo_control_data[16] ,
    \servo_control_data[15] ,
    \servo_control_data[14] ,
    \servo_control_data[13] ,
    \servo_control_data[12] ,
    \servo_control_data[11] ,
    \servo_control_data[10] ,
    \servo_control_data[9] ,
    \servo_control_data[8] ,
    \servo_control_data[7] ,
    \servo_control_data[6] ,
    \servo_control_data[5] ,
    \servo_control_data[4] ,
    \servo_control_data[3] ,
    \servo_control_data[2] ,
    \servo_control_data[1] ,
    \servo_control_data[0] ,
    clk,
    tms_pad_i,
    tck_pad_i,
    tdi_pad_i,
    tdo_pad_o
);

input \bytes_to_decimal[24] ;
input \bytes_to_decimal[23] ;
input \bytes_to_decimal[22] ;
input \bytes_to_decimal[21] ;
input \bytes_to_decimal[20] ;
input \bytes_to_decimal[19] ;
input \bytes_to_decimal[18] ;
input \bytes_to_decimal[17] ;
input \bytes_to_decimal[16] ;
input \bytes_to_decimal[15] ;
input \bytes_to_decimal[14] ;
input \bytes_to_decimal[13] ;
input \bytes_to_decimal[12] ;
input \bytes_to_decimal[11] ;
input \bytes_to_decimal[10] ;
input \bytes_to_decimal[9] ;
input \bytes_to_decimal[8] ;
input \bytes_to_decimal[7] ;
input \bytes_to_decimal[6] ;
input \bytes_to_decimal[5] ;
input \bytes_to_decimal[4] ;
input \bytes_to_decimal[3] ;
input \bytes_to_decimal[2] ;
input \bytes_to_decimal[1] ;
input \bytes_to_decimal[0] ;
input \servo_control_data[19] ;
input \servo_control_data[18] ;
input \servo_control_data[17] ;
input \servo_control_data[16] ;
input \servo_control_data[15] ;
input \servo_control_data[14] ;
input \servo_control_data[13] ;
input \servo_control_data[12] ;
input \servo_control_data[11] ;
input \servo_control_data[10] ;
input \servo_control_data[9] ;
input \servo_control_data[8] ;
input \servo_control_data[7] ;
input \servo_control_data[6] ;
input \servo_control_data[5] ;
input \servo_control_data[4] ;
input \servo_control_data[3] ;
input \servo_control_data[2] ;
input \servo_control_data[1] ;
input \servo_control_data[0] ;
input clk;
input tms_pad_i;
input tck_pad_i;
input tdi_pad_i;
output tdo_pad_o;

wire \bytes_to_decimal[24] ;
wire \bytes_to_decimal[23] ;
wire \bytes_to_decimal[22] ;
wire \bytes_to_decimal[21] ;
wire \bytes_to_decimal[20] ;
wire \bytes_to_decimal[19] ;
wire \bytes_to_decimal[18] ;
wire \bytes_to_decimal[17] ;
wire \bytes_to_decimal[16] ;
wire \bytes_to_decimal[15] ;
wire \bytes_to_decimal[14] ;
wire \bytes_to_decimal[13] ;
wire \bytes_to_decimal[12] ;
wire \bytes_to_decimal[11] ;
wire \bytes_to_decimal[10] ;
wire \bytes_to_decimal[9] ;
wire \bytes_to_decimal[8] ;
wire \bytes_to_decimal[7] ;
wire \bytes_to_decimal[6] ;
wire \bytes_to_decimal[5] ;
wire \bytes_to_decimal[4] ;
wire \bytes_to_decimal[3] ;
wire \bytes_to_decimal[2] ;
wire \bytes_to_decimal[1] ;
wire \bytes_to_decimal[0] ;
wire \servo_control_data[19] ;
wire \servo_control_data[18] ;
wire \servo_control_data[17] ;
wire \servo_control_data[16] ;
wire \servo_control_data[15] ;
wire \servo_control_data[14] ;
wire \servo_control_data[13] ;
wire \servo_control_data[12] ;
wire \servo_control_data[11] ;
wire \servo_control_data[10] ;
wire \servo_control_data[9] ;
wire \servo_control_data[8] ;
wire \servo_control_data[7] ;
wire \servo_control_data[6] ;
wire \servo_control_data[5] ;
wire \servo_control_data[4] ;
wire \servo_control_data[3] ;
wire \servo_control_data[2] ;
wire \servo_control_data[1] ;
wire \servo_control_data[0] ;
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
    .data_i({\bytes_to_decimal[24] ,\bytes_to_decimal[23] ,\bytes_to_decimal[22] ,\bytes_to_decimal[21] ,\bytes_to_decimal[20] ,\bytes_to_decimal[19] ,\bytes_to_decimal[18] ,\bytes_to_decimal[17] ,\bytes_to_decimal[16] ,\bytes_to_decimal[15] ,\bytes_to_decimal[14] ,\bytes_to_decimal[13] ,\bytes_to_decimal[12] ,\bytes_to_decimal[11] ,\bytes_to_decimal[10] ,\bytes_to_decimal[9] ,\bytes_to_decimal[8] ,\bytes_to_decimal[7] ,\bytes_to_decimal[6] ,\bytes_to_decimal[5] ,\bytes_to_decimal[4] ,\bytes_to_decimal[3] ,\bytes_to_decimal[2] ,\bytes_to_decimal[1] ,\bytes_to_decimal[0] ,\servo_control_data[19] ,\servo_control_data[18] ,\servo_control_data[17] ,\servo_control_data[16] ,\servo_control_data[15] ,\servo_control_data[14] ,\servo_control_data[13] ,\servo_control_data[12] ,\servo_control_data[11] ,\servo_control_data[10] ,\servo_control_data[9] ,\servo_control_data[8] ,\servo_control_data[7] ,\servo_control_data[6] ,\servo_control_data[5] ,\servo_control_data[4] ,\servo_control_data[3] ,\servo_control_data[2] ,\servo_control_data[1] ,\servo_control_data[0] }),
    .clk_i(clk)
);

endmodule
