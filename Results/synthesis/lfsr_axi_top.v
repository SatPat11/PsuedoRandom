/* Generated by Yosys 0.38 (git sha1 543faed9c8c, clang++ 17.0.6 -fPIC -Os) */

module lfsr_axi_top(clk, rst_n, s_axi_awaddr, s_axi_awvalid, s_axi_awready, s_axi_wdata, s_axi_wvalid, s_axi_wready, s_axi_bresp, s_axi_bvalid, s_axi_bready, s_axi_araddr, s_axi_arvalid, s_axi_arready, s_axi_rdata, s_axi_rvalid, s_axi_rready);
  wire _000_;
  wire _001_;
  wire _002_;
  wire _003_;
  wire _004_;
  wire _005_;
  wire _006_;
  wire _007_;
  wire _008_;
  wire _009_;
  wire _010_;
  wire _011_;
  wire _012_;
  wire _013_;
  wire _014_;
  wire _015_;
  wire _016_;
  wire _017_;
  wire _018_;
  wire _019_;
  wire _020_;
  wire _021_;
  wire _022_;
  wire _023_;
  wire _024_;
  wire _025_;
  wire _026_;
  wire _027_;
  wire _028_;
  wire _029_;
  wire _030_;
  wire _031_;
  wire _032_;
  wire _033_;
  wire _034_;
  wire _035_;
  wire _036_;
  wire _037_;
  wire _038_;
  wire _039_;
  wire _040_;
  wire _041_;
  wire _042_;
  wire _043_;
  wire _044_;
  wire _045_;
  wire _046_;
  wire _047_;
  wire _048_;
  wire _049_;
  wire _050_;
  wire _051_;
  wire _052_;
  wire _053_;
  wire _054_;
  wire _055_;
  wire _056_;
  wire _057_;
  wire _058_;
  wire _059_;
  wire _060_;
  wire _061_;
  wire _062_;
  wire _063_;
  wire _064_;
  wire _065_;
  wire _066_;
  wire _067_;
  wire _068_;
  wire _069_;
  wire _070_;
  wire _071_;
  wire _072_;
  wire _073_;
  wire _074_;
  wire _075_;
  wire _076_;
  wire _077_;
  wire _078_;
  wire _079_;
  wire _080_;
  wire _081_;
  wire _082_;
  wire _083_;
  wire _084_;
  wire _085_;
  wire _086_;
  wire _087_;
  wire _088_;
  wire _089_;
  wire _090_;
  wire _091_;
  wire _092_;
  wire _093_;
  wire _094_;
  wire _095_;
  wire _096_;
  wire _097_;
  wire _098_;
  wire _099_;
  wire _100_;
  wire _101_;
  wire _102_;
  wire _103_;
  wire _104_;
  wire _105_;
  wire _106_;
  wire _107_;
  wire _108_;
  wire _109_;
  wire _110_;
  wire _111_;
  wire _112_;
  wire _113_;
  wire _114_;
  wire _115_;
  wire _116_;
  wire _117_;
  wire _118_;
  wire _119_;
  wire _120_;
  wire _121_;
  wire _122_;
  wire _123_;
  wire _124_;
  wire _125_;
  wire _126_;
  wire _127_;
  wire _128_;
  wire _129_;
  wire _130_;
  wire _131_;
  wire _132_;
  wire _133_;
  wire _134_;
  wire _135_;
  wire _136_;
  wire _137_;
  wire _138_;
  wire _139_;
  wire _140_;
  wire _141_;
  wire _142_;
  wire _143_;
  wire _144_;
  wire _145_;
  wire _146_;
  wire _147_;
  wire _148_;
  wire _149_;
  wire _150_;
  input clk;
  wire clk;
  input rst_n;
  wire rst_n;
  input [3:0] s_axi_araddr;
  wire [3:0] s_axi_araddr;
  output s_axi_arready;
  wire s_axi_arready;
  input s_axi_arvalid;
  wire s_axi_arvalid;
  input [3:0] s_axi_awaddr;
  wire [3:0] s_axi_awaddr;
  output s_axi_awready;
  wire s_axi_awready;
  input s_axi_awvalid;
  wire s_axi_awvalid;
  input s_axi_bready;
  wire s_axi_bready;
  output [1:0] s_axi_bresp;
  wire [1:0] s_axi_bresp;
  output s_axi_bvalid;
  wire s_axi_bvalid;
  output [7:0] s_axi_rdata;
  wire [7:0] s_axi_rdata;
  input s_axi_rready;
  wire s_axi_rready;
  output s_axi_rvalid;
  wire s_axi_rvalid;
  input [7:0] s_axi_wdata;
  wire [7:0] s_axi_wdata;
  output s_axi_wready;
  wire s_axi_wready;
  input s_axi_wvalid;
  wire s_axi_wvalid;
  wire \u_axi_slave.ctrl_reg[0] ;
  wire \u_axi_slave.ctrl_reg[1] ;
  wire \u_axi_slave.ctrl_reg[2] ;
  wire \u_axi_slave.ctrl_reg[3] ;
  wire \u_axi_slave.ctrl_reg[4] ;
  wire \u_axi_slave.ctrl_reg[5] ;
  wire \u_axi_slave.ctrl_reg[6] ;
  wire \u_axi_slave.ctrl_reg[7] ;
  wire \u_axi_slave.lfsr_data[0] ;
  wire \u_axi_slave.lfsr_data[1] ;
  wire \u_axi_slave.lfsr_data[2] ;
  wire \u_axi_slave.lfsr_data[3] ;
  wire \u_axi_slave.lfsr_data[4] ;
  wire \u_axi_slave.lfsr_data[5] ;
  wire \u_axi_slave.lfsr_data[6] ;
  wire \u_axi_slave.lfsr_data[7] ;
  wire \u_axi_slave.seed_reg[0] ;
  wire \u_axi_slave.seed_reg[1] ;
  wire \u_axi_slave.seed_reg[2] ;
  wire \u_axi_slave.seed_reg[3] ;
  wire \u_axi_slave.seed_reg[4] ;
  wire \u_axi_slave.seed_reg[5] ;
  wire \u_axi_slave.seed_reg[6] ;
  wire \u_axi_slave.seed_reg[7] ;
  wire \u_axi_slave.taps_reg[0] ;
  wire \u_axi_slave.taps_reg[1] ;
  wire \u_axi_slave.taps_reg[2] ;
  wire \u_axi_slave.taps_reg[3] ;
  wire \u_axi_slave.taps_reg[4] ;
  wire \u_axi_slave.taps_reg[5] ;
  wire \u_axi_slave.taps_reg[6] ;
  wire \u_axi_slave.taps_reg[7] ;
  sky130_fd_sc_hd__and3_2 _151_ (
    .A(s_axi_wvalid),
    .B(s_axi_awvalid),
    .C(s_axi_awready),
    .X(_044_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _152_ (
    .A(_044_),
    .SLEEP(s_axi_awaddr[3]),
    .X(_045_)
  );
  sky130_fd_sc_hd__nor2_2 _153_ (
    .A(s_axi_awaddr[1]),
    .B(s_axi_awaddr[0]),
    .Y(_046_)
  );
  sky130_fd_sc_hd__and3_2 _154_ (
    .A(s_axi_awaddr[2]),
    .B(_045_),
    .C(_046_),
    .X(_047_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _155_ (
    .A(_047_),
    .X(_048_)
  );
  sky130_fd_sc_hd__mux2_2 _156_ (
    .A0(\u_axi_slave.seed_reg[0] ),
    .A1(s_axi_wdata[0]),
    .S(_048_),
    .X(_049_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _157_ (
    .A(_049_),
    .X(_000_)
  );
  sky130_fd_sc_hd__mux2_2 _158_ (
    .A0(\u_axi_slave.seed_reg[1] ),
    .A1(s_axi_wdata[1]),
    .S(_048_),
    .X(_050_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _159_ (
    .A(_050_),
    .X(_001_)
  );
  sky130_fd_sc_hd__mux2_2 _160_ (
    .A0(\u_axi_slave.seed_reg[2] ),
    .A1(s_axi_wdata[2]),
    .S(_048_),
    .X(_051_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _161_ (
    .A(_051_),
    .X(_002_)
  );
  sky130_fd_sc_hd__mux2_2 _162_ (
    .A0(\u_axi_slave.seed_reg[3] ),
    .A1(s_axi_wdata[3]),
    .S(_048_),
    .X(_052_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _163_ (
    .A(_052_),
    .X(_003_)
  );
  sky130_fd_sc_hd__mux2_2 _164_ (
    .A0(\u_axi_slave.seed_reg[4] ),
    .A1(s_axi_wdata[4]),
    .S(_048_),
    .X(_053_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _165_ (
    .A(_053_),
    .X(_004_)
  );
  sky130_fd_sc_hd__mux2_2 _166_ (
    .A0(\u_axi_slave.seed_reg[5] ),
    .A1(s_axi_wdata[5]),
    .S(_048_),
    .X(_054_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _167_ (
    .A(_054_),
    .X(_005_)
  );
  sky130_fd_sc_hd__mux2_2 _168_ (
    .A0(\u_axi_slave.seed_reg[6] ),
    .A1(s_axi_wdata[6]),
    .S(_048_),
    .X(_055_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _169_ (
    .A(_055_),
    .X(_006_)
  );
  sky130_fd_sc_hd__mux2_2 _170_ (
    .A0(\u_axi_slave.seed_reg[7] ),
    .A1(s_axi_wdata[7]),
    .S(_048_),
    .X(_056_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _171_ (
    .A(_056_),
    .X(_007_)
  );
  sky130_fd_sc_hd__and3b_2 _172_ (
    .A_N(s_axi_awaddr[2]),
    .B(_045_),
    .C(_046_),
    .X(_057_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _173_ (
    .A(_057_),
    .X(_058_)
  );
  sky130_fd_sc_hd__mux2_2 _174_ (
    .A0(\u_axi_slave.ctrl_reg[0] ),
    .A1(s_axi_wdata[0]),
    .S(_058_),
    .X(_059_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _175_ (
    .A(_059_),
    .X(_008_)
  );
  sky130_fd_sc_hd__mux2_2 _176_ (
    .A0(\u_axi_slave.ctrl_reg[1] ),
    .A1(s_axi_wdata[1]),
    .S(_058_),
    .X(_060_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _177_ (
    .A(_060_),
    .X(_009_)
  );
  sky130_fd_sc_hd__mux2_2 _178_ (
    .A0(\u_axi_slave.ctrl_reg[2] ),
    .A1(s_axi_wdata[2]),
    .S(_058_),
    .X(_061_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _179_ (
    .A(_061_),
    .X(_010_)
  );
  sky130_fd_sc_hd__mux2_2 _180_ (
    .A0(\u_axi_slave.ctrl_reg[3] ),
    .A1(s_axi_wdata[3]),
    .S(_058_),
    .X(_062_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _181_ (
    .A(_062_),
    .X(_011_)
  );
  sky130_fd_sc_hd__mux2_2 _182_ (
    .A0(\u_axi_slave.ctrl_reg[4] ),
    .A1(s_axi_wdata[4]),
    .S(_058_),
    .X(_063_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _183_ (
    .A(_063_),
    .X(_012_)
  );
  sky130_fd_sc_hd__mux2_2 _184_ (
    .A0(\u_axi_slave.ctrl_reg[5] ),
    .A1(s_axi_wdata[5]),
    .S(_058_),
    .X(_064_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _185_ (
    .A(_064_),
    .X(_013_)
  );
  sky130_fd_sc_hd__mux2_2 _186_ (
    .A0(\u_axi_slave.ctrl_reg[6] ),
    .A1(s_axi_wdata[6]),
    .S(_058_),
    .X(_065_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _187_ (
    .A(_065_),
    .X(_014_)
  );
  sky130_fd_sc_hd__mux2_2 _188_ (
    .A0(\u_axi_slave.ctrl_reg[7] ),
    .A1(s_axi_wdata[7]),
    .S(_058_),
    .X(_066_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _189_ (
    .A(_066_),
    .X(_015_)
  );
  sky130_fd_sc_hd__or2_2 _190_ (
    .A(s_axi_bvalid),
    .B(_044_),
    .X(_067_)
  );
  sky130_fd_sc_hd__a21boi_0 _191_ (
    .A1(s_axi_bready),
    .A2(s_axi_bvalid),
    .B1_N(_067_),
    .Y(_068_)
  );
  sky130_fd_sc_hd__buf_1 _192_ (
    .A(_068_),
    .X(_016_)
  );
  sky130_fd_sc_hd__a21boi_0 _193_ (
    .A1(s_axi_wvalid),
    .A2(s_axi_awvalid),
    .B1_N(s_axi_awready),
    .Y(_069_)
  );
  sky130_fd_sc_hd__a21o_2 _194_ (
    .A1(s_axi_bready),
    .A2(s_axi_bvalid),
    .B1(_069_),
    .X(_017_)
  );
  sky130_fd_sc_hd__nor2_2 _195_ (
    .A(\u_axi_slave.ctrl_reg[1] ),
    .B(\u_axi_slave.ctrl_reg[0] ),
    .Y(_070_)
  );
  sky130_fd_sc_hd__and4_2 _196_ (
    .A(\u_axi_slave.lfsr_data[1] ),
    .B(\u_axi_slave.lfsr_data[0] ),
    .C(\u_axi_slave.taps_reg[0] ),
    .D(\u_axi_slave.taps_reg[1] ),
    .X(_071_)
  );
  sky130_fd_sc_hd__a22oi_2 _197_ (
    .A1(\u_axi_slave.lfsr_data[0] ),
    .A2(\u_axi_slave.taps_reg[0] ),
    .B1(\u_axi_slave.taps_reg[1] ),
    .B2(\u_axi_slave.lfsr_data[1] ),
    .Y(_072_)
  );
  sky130_fd_sc_hd__a22o_2 _198_ (
    .A1(\u_axi_slave.lfsr_data[4] ),
    .A2(\u_axi_slave.taps_reg[4] ),
    .B1(\u_axi_slave.taps_reg[5] ),
    .B2(\u_axi_slave.lfsr_data[5] ),
    .X(_073_)
  );
  sky130_fd_sc_hd__nand4_2 _199_ (
    .A(\u_axi_slave.lfsr_data[5] ),
    .B(\u_axi_slave.lfsr_data[4] ),
    .C(\u_axi_slave.taps_reg[4] ),
    .D(\u_axi_slave.taps_reg[5] ),
    .Y(_074_)
  );
  sky130_fd_sc_hd__o211a_2 _200_ (
    .A1(_071_),
    .A2(_072_),
    .B1(_073_),
    .C1(_074_),
    .X(_075_)
  );
  sky130_fd_sc_hd__a211oi_2 _201_ (
    .A1(_073_),
    .A2(_074_),
    .B1(_071_),
    .C1(_072_),
    .Y(_076_)
  );
  sky130_fd_sc_hd__a22o_2 _202_ (
    .A1(\u_axi_slave.lfsr_data[2] ),
    .A2(\u_axi_slave.taps_reg[2] ),
    .B1(\u_axi_slave.taps_reg[3] ),
    .B2(\u_axi_slave.lfsr_data[3] ),
    .X(_077_)
  );
  sky130_fd_sc_hd__nand4_2 _203_ (
    .A(\u_axi_slave.lfsr_data[3] ),
    .B(\u_axi_slave.lfsr_data[2] ),
    .C(\u_axi_slave.taps_reg[2] ),
    .D(\u_axi_slave.taps_reg[3] ),
    .Y(_078_)
  );
  sky130_fd_sc_hd__a22oi_2 _204_ (
    .A1(\u_axi_slave.lfsr_data[6] ),
    .A2(\u_axi_slave.taps_reg[6] ),
    .B1(\u_axi_slave.taps_reg[7] ),
    .B2(\u_axi_slave.lfsr_data[7] ),
    .Y(_079_)
  );
  sky130_fd_sc_hd__and4_2 _205_ (
    .A(\u_axi_slave.lfsr_data[7] ),
    .B(\u_axi_slave.lfsr_data[6] ),
    .C(\u_axi_slave.taps_reg[6] ),
    .D(\u_axi_slave.taps_reg[7] ),
    .X(_080_)
  );
  sky130_fd_sc_hd__a211o_2 _206_ (
    .A1(_077_),
    .A2(_078_),
    .B1(_079_),
    .C1(_080_),
    .X(_081_)
  );
  sky130_fd_sc_hd__o211ai_2 _207_ (
    .A1(_079_),
    .A2(_080_),
    .B1(_077_),
    .C1(_078_),
    .Y(_082_)
  );
  sky130_fd_sc_hd__o211a_2 _208_ (
    .A1(_075_),
    .A2(_076_),
    .B1(_081_),
    .C1(_082_),
    .X(_083_)
  );
  sky130_fd_sc_hd__or4_2 _209_ (
    .A(\u_axi_slave.lfsr_data[5] ),
    .B(\u_axi_slave.lfsr_data[4] ),
    .C(\u_axi_slave.lfsr_data[7] ),
    .D(\u_axi_slave.lfsr_data[6] ),
    .X(_084_)
  );
  sky130_fd_sc_hd__or4_2 _210_ (
    .A(\u_axi_slave.lfsr_data[1] ),
    .B(\u_axi_slave.lfsr_data[0] ),
    .C(\u_axi_slave.lfsr_data[3] ),
    .D(\u_axi_slave.lfsr_data[2] ),
    .X(_085_)
  );
  sky130_fd_sc_hd__lpflow_clkinvkapwr_1 _211_ (
    .A(\u_axi_slave.ctrl_reg[1] ),
    .Y(_086_)
  );
  sky130_fd_sc_hd__o21ai_0 _212_ (
    .A1(_084_),
    .A2(_085_),
    .B1(_086_),
    .Y(_087_)
  );
  sky130_fd_sc_hd__a211o_2 _213_ (
    .A1(_081_),
    .A2(_082_),
    .B1(_075_),
    .C1(_076_),
    .X(_088_)
  );
  sky130_fd_sc_hd__or3b_2 _214_ (
    .A(_083_),
    .B(_087_),
    .C_N(_088_),
    .X(_089_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _215_ (
    .A(_086_),
    .X(_090_)
  );
  sky130_fd_sc_hd__or2_2 _216_ (
    .A(\u_axi_slave.ctrl_reg[1] ),
    .B(\u_axi_slave.ctrl_reg[0] ),
    .X(_091_)
  );
  sky130_fd_sc_hd__buf_1 _217_ (
    .A(_091_),
    .X(_092_)
  );
  sky130_fd_sc_hd__o21a_2 _218_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[0] ),
    .B1(_092_),
    .X(_093_)
  );
  sky130_fd_sc_hd__a22o_2 _219_ (
    .A1(\u_axi_slave.lfsr_data[0] ),
    .A2(_070_),
    .B1(_089_),
    .B2(_093_),
    .X(_018_)
  );
  sky130_fd_sc_hd__nand2_2 _220_ (
    .A(_090_),
    .B(\u_axi_slave.ctrl_reg[0] ),
    .Y(_094_)
  );
  sky130_fd_sc_hd__or2_2 _221_ (
    .A(\u_axi_slave.lfsr_data[1] ),
    .B(_092_),
    .X(_095_)
  );
  sky130_fd_sc_hd__o221a_2 _222_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[1] ),
    .B1(_094_),
    .B2(\u_axi_slave.lfsr_data[0] ),
    .C1(_095_),
    .X(_019_)
  );
  sky130_fd_sc_hd__or2_2 _223_ (
    .A(\u_axi_slave.lfsr_data[2] ),
    .B(_092_),
    .X(_096_)
  );
  sky130_fd_sc_hd__o221a_2 _224_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[2] ),
    .B1(_094_),
    .B2(\u_axi_slave.lfsr_data[1] ),
    .C1(_096_),
    .X(_020_)
  );
  sky130_fd_sc_hd__or3_2 _225_ (
    .A(\u_axi_slave.lfsr_data[2] ),
    .B(_070_),
    .C(_087_),
    .X(_097_)
  );
  sky130_fd_sc_hd__o221a_2 _226_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[3] ),
    .B1(_092_),
    .B2(\u_axi_slave.lfsr_data[3] ),
    .C1(_097_),
    .X(_021_)
  );
  sky130_fd_sc_hd__or3_2 _227_ (
    .A(\u_axi_slave.lfsr_data[3] ),
    .B(_070_),
    .C(_087_),
    .X(_098_)
  );
  sky130_fd_sc_hd__o221a_2 _228_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[4] ),
    .B1(_092_),
    .B2(\u_axi_slave.lfsr_data[4] ),
    .C1(_098_),
    .X(_022_)
  );
  sky130_fd_sc_hd__or2_2 _229_ (
    .A(\u_axi_slave.lfsr_data[5] ),
    .B(_092_),
    .X(_099_)
  );
  sky130_fd_sc_hd__o221a_2 _230_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[5] ),
    .B1(_094_),
    .B2(\u_axi_slave.lfsr_data[4] ),
    .C1(_099_),
    .X(_023_)
  );
  sky130_fd_sc_hd__or2_2 _231_ (
    .A(\u_axi_slave.lfsr_data[6] ),
    .B(_092_),
    .X(_100_)
  );
  sky130_fd_sc_hd__o221a_2 _232_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[6] ),
    .B1(_094_),
    .B2(\u_axi_slave.lfsr_data[5] ),
    .C1(_100_),
    .X(_024_)
  );
  sky130_fd_sc_hd__or2_2 _233_ (
    .A(\u_axi_slave.lfsr_data[7] ),
    .B(_092_),
    .X(_101_)
  );
  sky130_fd_sc_hd__o221a_2 _234_ (
    .A1(_090_),
    .A2(\u_axi_slave.seed_reg[7] ),
    .B1(_094_),
    .B2(\u_axi_slave.lfsr_data[6] ),
    .C1(_101_),
    .X(_025_)
  );
  sky130_fd_sc_hd__lpflow_inputiso0n_1 _235_ (
    .A(s_axi_arready),
    .SLEEP_B(s_axi_arvalid),
    .X(_102_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _236_ (
    .A(_102_),
    .X(_103_)
  );
  sky130_fd_sc_hd__nand2_2 _237_ (
    .A(s_axi_rready),
    .B(s_axi_rvalid),
    .Y(_104_)
  );
  sky130_fd_sc_hd__o21ai_0 _238_ (
    .A1(s_axi_rvalid),
    .A2(_103_),
    .B1(_104_),
    .Y(_105_)
  );
  sky130_fd_sc_hd__inv_2 _239_ (
    .A(_105_),
    .Y(_026_)
  );
  sky130_fd_sc_hd__or3_2 _240_ (
    .A(s_axi_araddr[1]),
    .B(s_axi_araddr[0]),
    .C(s_axi_araddr[2]),
    .X(_106_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _241_ (
    .A(s_axi_araddr[3]),
    .SLEEP(_106_),
    .X(_107_)
  );
  sky130_fd_sc_hd__or3b_2 _242_ (
    .A(s_axi_araddr[1]),
    .B(s_axi_araddr[0]),
    .C_N(s_axi_araddr[2]),
    .X(_108_)
  );
  sky130_fd_sc_hd__nor2_2 _243_ (
    .A(s_axi_araddr[3]),
    .B(_108_),
    .Y(_109_)
  );
  sky130_fd_sc_hd__lpflow_inputiso0n_1 _244_ (
    .A(\u_axi_slave.seed_reg[0] ),
    .SLEEP_B(_109_),
    .X(_110_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _245_ (
    .A(s_axi_araddr[3]),
    .SLEEP(_108_),
    .X(_111_)
  );
  sky130_fd_sc_hd__nor2_2 _246_ (
    .A(s_axi_araddr[3]),
    .B(_106_),
    .Y(_112_)
  );
  sky130_fd_sc_hd__a22o_2 _247_ (
    .A1(\u_axi_slave.lfsr_data[0] ),
    .A2(_111_),
    .B1(_112_),
    .B2(\u_axi_slave.ctrl_reg[0] ),
    .X(_113_)
  );
  sky130_fd_sc_hd__nand2_2 _248_ (
    .A(s_axi_arready),
    .B(s_axi_arvalid),
    .Y(_114_)
  );
  sky130_fd_sc_hd__a2111oi_0 _249_ (
    .A1(\u_axi_slave.taps_reg[0] ),
    .A2(_107_),
    .B1(_110_),
    .C1(_113_),
    .D1(_114_),
    .Y(_115_)
  );
  sky130_fd_sc_hd__o21ba_2 _250_ (
    .A1(s_axi_rdata[0]),
    .A2(_103_),
    .B1_N(_115_),
    .X(_027_)
  );
  sky130_fd_sc_hd__or4b_2 _251_ (
    .A(s_axi_araddr[1]),
    .B(s_axi_araddr[0]),
    .C(s_axi_araddr[2]),
    .D_N(s_axi_araddr[3]),
    .X(_116_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _252_ (
    .A(\u_axi_slave.taps_reg[1] ),
    .SLEEP(_116_),
    .X(_117_)
  );
  sky130_fd_sc_hd__or2_2 _253_ (
    .A(s_axi_araddr[3]),
    .B(_106_),
    .X(_118_)
  );
  sky130_fd_sc_hd__o21ai_0 _254_ (
    .A1(_090_),
    .A2(_118_),
    .B1(_102_),
    .Y(_119_)
  );
  sky130_fd_sc_hd__a22o_2 _255_ (
    .A1(\u_axi_slave.lfsr_data[1] ),
    .A2(_111_),
    .B1(_109_),
    .B2(\u_axi_slave.seed_reg[1] ),
    .X(_120_)
  );
  sky130_fd_sc_hd__o32a_2 _256_ (
    .A1(_117_),
    .A2(_119_),
    .A3(_120_),
    .B1(_103_),
    .B2(s_axi_rdata[1]),
    .X(_028_)
  );
  sky130_fd_sc_hd__lpflow_inputiso0n_1 _257_ (
    .A(\u_axi_slave.ctrl_reg[2] ),
    .SLEEP_B(_112_),
    .X(_121_)
  );
  sky130_fd_sc_hd__lpflow_clkinvkapwr_1 _258_ (
    .A(\u_axi_slave.taps_reg[2] ),
    .Y(_122_)
  );
  sky130_fd_sc_hd__o21ai_0 _259_ (
    .A1(_122_),
    .A2(_116_),
    .B1(_102_),
    .Y(_123_)
  );
  sky130_fd_sc_hd__a221o_2 _260_ (
    .A1(\u_axi_slave.lfsr_data[2] ),
    .A2(_111_),
    .B1(_109_),
    .B2(\u_axi_slave.seed_reg[2] ),
    .C1(_123_),
    .X(_124_)
  );
  sky130_fd_sc_hd__o22a_2 _261_ (
    .A1(s_axi_rdata[2]),
    .A2(_103_),
    .B1(_121_),
    .B2(_124_),
    .X(_029_)
  );
  sky130_fd_sc_hd__a22o_2 _262_ (
    .A1(\u_axi_slave.taps_reg[3] ),
    .A2(_107_),
    .B1(_109_),
    .B2(\u_axi_slave.seed_reg[3] ),
    .X(_125_)
  );
  sky130_fd_sc_hd__lpflow_inputiso0n_1 _263_ (
    .A(\u_axi_slave.lfsr_data[3] ),
    .SLEEP_B(_111_),
    .X(_126_)
  );
  sky130_fd_sc_hd__a2111oi_0 _264_ (
    .A1(\u_axi_slave.ctrl_reg[3] ),
    .A2(_112_),
    .B1(_125_),
    .C1(_126_),
    .D1(_114_),
    .Y(_127_)
  );
  sky130_fd_sc_hd__o21ba_2 _265_ (
    .A1(s_axi_rdata[3]),
    .A2(_103_),
    .B1_N(_127_),
    .X(_030_)
  );
  sky130_fd_sc_hd__lpflow_clkinvkapwr_1 _266_ (
    .A(\u_axi_slave.ctrl_reg[4] ),
    .Y(_128_)
  );
  sky130_fd_sc_hd__o21ai_0 _267_ (
    .A1(_128_),
    .A2(_118_),
    .B1(_103_),
    .Y(_129_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _268_ (
    .A(\u_axi_slave.taps_reg[4] ),
    .SLEEP(_116_),
    .X(_130_)
  );
  sky130_fd_sc_hd__a221o_2 _269_ (
    .A1(\u_axi_slave.lfsr_data[4] ),
    .A2(_111_),
    .B1(_109_),
    .B2(\u_axi_slave.seed_reg[4] ),
    .C1(_130_),
    .X(_131_)
  );
  sky130_fd_sc_hd__o22a_2 _270_ (
    .A1(s_axi_rdata[4]),
    .A2(_103_),
    .B1(_129_),
    .B2(_131_),
    .X(_031_)
  );
  sky130_fd_sc_hd__a22o_2 _271_ (
    .A1(\u_axi_slave.taps_reg[5] ),
    .A2(_107_),
    .B1(_111_),
    .B2(\u_axi_slave.lfsr_data[5] ),
    .X(_132_)
  );
  sky130_fd_sc_hd__a221o_2 _272_ (
    .A1(\u_axi_slave.seed_reg[5] ),
    .A2(_109_),
    .B1(_112_),
    .B2(\u_axi_slave.ctrl_reg[5] ),
    .C1(_114_),
    .X(_133_)
  );
  sky130_fd_sc_hd__o22a_2 _273_ (
    .A1(s_axi_rdata[5]),
    .A2(_103_),
    .B1(_132_),
    .B2(_133_),
    .X(_032_)
  );
  sky130_fd_sc_hd__lpflow_inputiso0n_1 _274_ (
    .A(\u_axi_slave.seed_reg[6] ),
    .SLEEP_B(_109_),
    .X(_134_)
  );
  sky130_fd_sc_hd__lpflow_inputiso0n_1 _275_ (
    .A(\u_axi_slave.lfsr_data[6] ),
    .SLEEP_B(_111_),
    .X(_135_)
  );
  sky130_fd_sc_hd__a221o_2 _276_ (
    .A1(\u_axi_slave.taps_reg[6] ),
    .A2(_107_),
    .B1(_112_),
    .B2(\u_axi_slave.ctrl_reg[6] ),
    .C1(_114_),
    .X(_136_)
  );
  sky130_fd_sc_hd__o32a_2 _277_ (
    .A1(_134_),
    .A2(_135_),
    .A3(_136_),
    .B1(_103_),
    .B2(s_axi_rdata[6]),
    .X(_033_)
  );
  sky130_fd_sc_hd__a22o_2 _278_ (
    .A1(\u_axi_slave.lfsr_data[7] ),
    .A2(_111_),
    .B1(_109_),
    .B2(\u_axi_slave.seed_reg[7] ),
    .X(_137_)
  );
  sky130_fd_sc_hd__lpflow_isobufsrc_1 _279_ (
    .A(\u_axi_slave.taps_reg[7] ),
    .SLEEP(_116_),
    .X(_138_)
  );
  sky130_fd_sc_hd__a2111oi_0 _280_ (
    .A1(\u_axi_slave.ctrl_reg[7] ),
    .A2(_112_),
    .B1(_137_),
    .C1(_138_),
    .D1(_114_),
    .Y(_139_)
  );
  sky130_fd_sc_hd__o21ba_2 _281_ (
    .A1(s_axi_rdata[7]),
    .A2(_103_),
    .B1_N(_139_),
    .X(_034_)
  );
  sky130_fd_sc_hd__inv_2 _282_ (
    .A(s_axi_arready),
    .Y(_140_)
  );
  sky130_fd_sc_hd__o21ai_0 _283_ (
    .A1(_140_),
    .A2(s_axi_arvalid),
    .B1(_104_),
    .Y(_035_)
  );
  sky130_fd_sc_hd__and4b_2 _284_ (
    .A_N(s_axi_awaddr[2]),
    .B(s_axi_awaddr[3]),
    .C(_044_),
    .D(_046_),
    .X(_141_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _285_ (
    .A(_141_),
    .X(_142_)
  );
  sky130_fd_sc_hd__mux2_2 _286_ (
    .A0(\u_axi_slave.taps_reg[0] ),
    .A1(s_axi_wdata[0]),
    .S(_142_),
    .X(_143_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _287_ (
    .A(_143_),
    .X(_036_)
  );
  sky130_fd_sc_hd__mux2_2 _288_ (
    .A0(\u_axi_slave.taps_reg[1] ),
    .A1(s_axi_wdata[1]),
    .S(_142_),
    .X(_144_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _289_ (
    .A(_144_),
    .X(_037_)
  );
  sky130_fd_sc_hd__mux2_2 _290_ (
    .A0(\u_axi_slave.taps_reg[2] ),
    .A1(s_axi_wdata[2]),
    .S(_142_),
    .X(_145_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _291_ (
    .A(_145_),
    .X(_038_)
  );
  sky130_fd_sc_hd__mux2_2 _292_ (
    .A0(\u_axi_slave.taps_reg[3] ),
    .A1(s_axi_wdata[3]),
    .S(_142_),
    .X(_146_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _293_ (
    .A(_146_),
    .X(_039_)
  );
  sky130_fd_sc_hd__mux2_2 _294_ (
    .A0(\u_axi_slave.taps_reg[4] ),
    .A1(s_axi_wdata[4]),
    .S(_142_),
    .X(_147_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _295_ (
    .A(_147_),
    .X(_040_)
  );
  sky130_fd_sc_hd__mux2_2 _296_ (
    .A0(\u_axi_slave.taps_reg[5] ),
    .A1(s_axi_wdata[5]),
    .S(_142_),
    .X(_148_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _297_ (
    .A(_148_),
    .X(_041_)
  );
  sky130_fd_sc_hd__mux2_2 _298_ (
    .A0(\u_axi_slave.taps_reg[6] ),
    .A1(s_axi_wdata[6]),
    .S(_142_),
    .X(_149_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _299_ (
    .A(_149_),
    .X(_042_)
  );
  sky130_fd_sc_hd__mux2_2 _300_ (
    .A0(\u_axi_slave.taps_reg[7] ),
    .A1(s_axi_wdata[7]),
    .S(_142_),
    .X(_150_)
  );
  sky130_fd_sc_hd__lpflow_clkbufkapwr_1 _301_ (
    .A(_150_),
    .X(_043_)
  );
  sky130_fd_sc_hd__dfstp_2 _302_ (
    .CLK(clk),
    .D(_000_),
    .Q(\u_axi_slave.seed_reg[0] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _303_ (
    .CLK(clk),
    .D(_001_),
    .Q(\u_axi_slave.seed_reg[1] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _304_ (
    .CLK(clk),
    .D(_002_),
    .Q(\u_axi_slave.seed_reg[2] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _305_ (
    .CLK(clk),
    .D(_003_),
    .Q(\u_axi_slave.seed_reg[3] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _306_ (
    .CLK(clk),
    .D(_004_),
    .Q(\u_axi_slave.seed_reg[4] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _307_ (
    .CLK(clk),
    .D(_005_),
    .Q(\u_axi_slave.seed_reg[5] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _308_ (
    .CLK(clk),
    .D(_006_),
    .Q(\u_axi_slave.seed_reg[6] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _309_ (
    .CLK(clk),
    .D(_007_),
    .Q(\u_axi_slave.seed_reg[7] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _310_ (
    .CLK(clk),
    .D(_008_),
    .Q(\u_axi_slave.ctrl_reg[0] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _311_ (
    .CLK(clk),
    .D(_009_),
    .Q(\u_axi_slave.ctrl_reg[1] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _312_ (
    .CLK(clk),
    .D(_010_),
    .Q(\u_axi_slave.ctrl_reg[2] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _313_ (
    .CLK(clk),
    .D(_011_),
    .Q(\u_axi_slave.ctrl_reg[3] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _314_ (
    .CLK(clk),
    .D(_012_),
    .Q(\u_axi_slave.ctrl_reg[4] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _315_ (
    .CLK(clk),
    .D(_013_),
    .Q(\u_axi_slave.ctrl_reg[5] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _316_ (
    .CLK(clk),
    .D(_014_),
    .Q(\u_axi_slave.ctrl_reg[6] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _317_ (
    .CLK(clk),
    .D(_015_),
    .Q(\u_axi_slave.ctrl_reg[7] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _318_ (
    .CLK(clk),
    .D(_016_),
    .Q(s_axi_bvalid),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _319_ (
    .CLK(clk),
    .D(_017_),
    .Q(s_axi_awready),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _320_ (
    .CLK(clk),
    .D(_018_),
    .Q(\u_axi_slave.lfsr_data[0] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _321_ (
    .CLK(clk),
    .D(_019_),
    .Q(\u_axi_slave.lfsr_data[1] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _322_ (
    .CLK(clk),
    .D(_020_),
    .Q(\u_axi_slave.lfsr_data[2] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _323_ (
    .CLK(clk),
    .D(_021_),
    .Q(\u_axi_slave.lfsr_data[3] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _324_ (
    .CLK(clk),
    .D(_022_),
    .Q(\u_axi_slave.lfsr_data[4] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _325_ (
    .CLK(clk),
    .D(_023_),
    .Q(\u_axi_slave.lfsr_data[5] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _326_ (
    .CLK(clk),
    .D(_024_),
    .Q(\u_axi_slave.lfsr_data[6] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _327_ (
    .CLK(clk),
    .D(_025_),
    .Q(\u_axi_slave.lfsr_data[7] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _328_ (
    .CLK(clk),
    .D(_026_),
    .Q(s_axi_rvalid),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _329_ (
    .CLK(clk),
    .D(_027_),
    .Q(s_axi_rdata[0]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _330_ (
    .CLK(clk),
    .D(_028_),
    .Q(s_axi_rdata[1]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _331_ (
    .CLK(clk),
    .D(_029_),
    .Q(s_axi_rdata[2]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _332_ (
    .CLK(clk),
    .D(_030_),
    .Q(s_axi_rdata[3]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _333_ (
    .CLK(clk),
    .D(_031_),
    .Q(s_axi_rdata[4]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _334_ (
    .CLK(clk),
    .D(_032_),
    .Q(s_axi_rdata[5]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _335_ (
    .CLK(clk),
    .D(_033_),
    .Q(s_axi_rdata[6]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _336_ (
    .CLK(clk),
    .D(_034_),
    .Q(s_axi_rdata[7]),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _337_ (
    .CLK(clk),
    .D(_035_),
    .Q(s_axi_arready),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _338_ (
    .CLK(clk),
    .D(_036_),
    .Q(\u_axi_slave.taps_reg[0] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _339_ (
    .CLK(clk),
    .D(_037_),
    .Q(\u_axi_slave.taps_reg[1] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _340_ (
    .CLK(clk),
    .D(_038_),
    .Q(\u_axi_slave.taps_reg[2] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _341_ (
    .CLK(clk),
    .D(_039_),
    .Q(\u_axi_slave.taps_reg[3] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _342_ (
    .CLK(clk),
    .D(_040_),
    .Q(\u_axi_slave.taps_reg[4] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _343_ (
    .CLK(clk),
    .D(_041_),
    .Q(\u_axi_slave.taps_reg[5] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__dfrtp_2 _344_ (
    .CLK(clk),
    .D(_042_),
    .Q(\u_axi_slave.taps_reg[6] ),
    .RESET_B(rst_n)
  );
  sky130_fd_sc_hd__dfstp_2 _345_ (
    .CLK(clk),
    .D(_043_),
    .Q(\u_axi_slave.taps_reg[7] ),
    .SET_B(rst_n)
  );
  sky130_fd_sc_hd__conb_1 _346_ (
    .LO(s_axi_bresp[0])
  );
  sky130_fd_sc_hd__conb_1 _347_ (
    .LO(s_axi_bresp[1])
  );
  sky130_fd_sc_hd__buf_2 _348_ (
    .A(s_axi_awready),
    .X(s_axi_wready)
  );
endmodule
