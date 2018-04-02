//-----------------------------------------------------------------------------
// nf10_axis_sim_record_2_wrapper.v
//-----------------------------------------------------------------------------

`timescale 1 ps / 100 fs

`uselib lib=unisims_ver lib=nf10_axis_sim_record_v1_00_a

module nf10_axis_sim_record_2_wrapper
  (
    aclk,
    s_axis_tdata,
    s_axis_tstrb,
    s_axis_tuser,
    s_axis_tvalid,
    s_axis_tready,
    s_axis_tlast,
    counter,
    activity_rec
  );
  input aclk;
  input [255:0] s_axis_tdata;
  input [31:0] s_axis_tstrb;
  input [127:0] s_axis_tuser;
  input s_axis_tvalid;
  output s_axis_tready;
  input s_axis_tlast;
  output [7:0] counter;
  output activity_rec;

  nf10_axis_sim_record
    #(
      .C_S_AXIS_DATA_WIDTH ( 256 ),
      .C_S_AXIS_TUSER_WIDTH ( 128 ),
      .output_file ( "../../stream_data_out_2.axi" )
    )
    nf10_axis_sim_record_2 (
      .aclk ( aclk ),
      .s_axis_tdata ( s_axis_tdata ),
      .s_axis_tstrb ( s_axis_tstrb ),
      .s_axis_tuser ( s_axis_tuser ),
      .s_axis_tvalid ( s_axis_tvalid ),
      .s_axis_tready ( s_axis_tready ),
      .s_axis_tlast ( s_axis_tlast ),
      .counter ( counter ),
      .activity_rec ( activity_rec )
    );

endmodule

