/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module matrixFSM_7 (
    input clk,
    input rst,
    input stop_button,
    input reset_button,
    output reg [3:0] level_num_out,
    output reg [143:0] matrixOut,
    output reg [15:0] timeout,
    output reg [15:0] scoreout
  );
  
  
  
  wire [144-1:0] M_endState_screen_matrix;
  reg [1-1:0] M_endState_endState;
  endState_13 endState (
    .endState(M_endState_endState),
    .screen_matrix(M_endState_screen_matrix)
  );
  
  wire [136-1:0] M_resetButton_screen_matrix;
  resetButton_14 resetButton (
    .screen_matrix(M_resetButton_screen_matrix)
  );
  
  wire [16-1:0] M_alu_alu;
  wire [1-1:0] M_alu_z;
  wire [1-1:0] M_alu_v;
  wire [1-1:0] M_alu_n;
  reg [6-1:0] M_alu_alufn;
  reg [16-1:0] M_alu_a;
  reg [16-1:0] M_alu_b;
  alu_15 alu (
    .alufn(M_alu_alufn),
    .a(M_alu_a),
    .b(M_alu_b),
    .alu(M_alu_alu),
    .z(M_alu_z),
    .v(M_alu_v),
    .n(M_alu_n)
  );
  
  reg [3:0] M_level_num_d, M_level_num_q = 4'h0;
  reg [15:0] M_current_row_d, M_current_row_q = 16'h0000;
  reg [15:0] M_pre_row_d, M_pre_row_q = 16'h0000;
  reg [143:0] M_matrixShow_d, M_matrixShow_q = 144'hff00000000000000000000000000000000ff;
  localparam IDLE_state = 4'd0;
  localparam INITIAL_state = 4'd1;
  localparam SHIFT_state = 4'd2;
  localparam INIT_CHECK_state = 4'd3;
  localparam INCREASE_LEVEL_state = 4'd4;
  localparam CHECK_state = 4'd5;
  localparam END_STATE_state = 4'd6;
  localparam WIN_state = 4'd7;
  localparam LOSE_state = 4'd8;
  localparam TIMER_state = 4'd9;
  localparam TIMER_END_state = 4'd10;
  
  reg [3:0] M_state_d, M_state_q = IDLE_state;
  reg M_reset_button_reg_d, M_reset_button_reg_q = 1'h0;
  reg M_stop_button_reg_d, M_stop_button_reg_q = 1'h0;
  wire [8-1:0] M_slowclock_value;
  counter_16 slowclock (
    .clk(clk),
    .rst(rst),
    .value(M_slowclock_value)
  );
  wire [1-1:0] M_slowClockEdge_out;
  reg [1-1:0] M_slowClockEdge_in;
  edge_detector_5 slowClockEdge (
    .clk(clk),
    .in(M_slowClockEdge_in),
    .out(M_slowClockEdge_out)
  );
  wire [16-1:0] M_rowShift_nextRefresh;
  reg [1-1:0] M_rowShift_shift_or_check;
  reg [16-1:0] M_rowShift_pre_row;
  reg [16-1:0] M_rowShift_current_row;
  rowShift_17 rowShift (
    .clk(clk),
    .shift_or_check(M_rowShift_shift_or_check),
    .pre_row(M_rowShift_pre_row),
    .current_row(M_rowShift_current_row),
    .nextRefresh(M_rowShift_nextRefresh)
  );
  reg [22:0] M_speed1_d, M_speed1_q = 23'h000000;
  reg [21:0] M_speed2_d, M_speed2_q = 22'h000000;
  reg M_speed1count_d, M_speed1count_q = 1'h0;
  reg [15:0] M_time_d, M_time_q = 16'h0060;
  reg [4:0] M_temp_d, M_temp_q = 5'h00;
  reg [15:0] M_score_d, M_score_q = 16'h0005;
  reg [15:0] M_final_score_d, M_final_score_q = 16'h0000;
  reg [15:0] M_final_time_d, M_final_time_q = 16'h0000;
  
  always @* begin
    M_state_d = M_state_q;
    M_pre_row_d = M_pre_row_q;
    M_temp_d = M_temp_q;
    M_level_num_d = M_level_num_q;
    M_reset_button_reg_d = M_reset_button_reg_q;
    M_speed1count_d = M_speed1count_q;
    M_current_row_d = M_current_row_q;
    M_matrixShow_d = M_matrixShow_q;
    M_score_d = M_score_q;
    M_final_score_d = M_final_score_q;
    M_final_time_d = M_final_time_q;
    M_time_d = M_time_q;
    M_speed2_d = M_speed2_q;
    M_speed1_d = M_speed1_q;
    M_stop_button_reg_d = M_stop_button_reg_q;
    
    M_alu_a = 16'h0000;
    M_alu_b = 16'h0000;
    M_alu_alufn = 8'h00;
    if (M_stop_button_reg_q == 1'h0 && stop_button == 1'h1) begin
      M_stop_button_reg_d = 1'h1;
    end
    if (M_reset_button_reg_q == 1'h0 && reset_button == 1'h1) begin
      M_reset_button_reg_d = 1'h1;
    end
    M_level_num_d = M_level_num_q;
    M_current_row_d = M_current_row_q;
    M_matrixShow_d = M_matrixShow_q;
    M_current_row_d = M_current_row_q;
    M_endState_endState = 1'h0;
    M_rowShift_pre_row = M_pre_row_q;
    M_rowShift_current_row = M_current_row_q;
    M_rowShift_shift_or_check = 1'h0;
    M_slowClockEdge_in = M_slowclock_value;
    
    case (M_state_q)
      IDLE_state: begin
        M_matrixShow_d = 144'h000000000000000000000000000000000000;
        matrixOut = M_matrixShow_q;
        if (M_stop_button_reg_q == 1'h1) begin
          M_state_d = INITIAL_state;
        end else begin
          M_state_d = M_state_q;
        end
      end
      INITIAL_state: begin
        M_level_num_d = 4'h0;
        M_matrixShow_d[8+135-:136] = M_resetButton_screen_matrix;
        M_matrixShow_d[0+7-:8] = 8'hf0;
        M_score_d = 16'h0005;
        M_time_d = 16'h0060;
        M_final_time_d = 16'h0000;
        M_final_score_d = 16'h0000;
        M_temp_d = 5'h00;
        M_current_row_d = 16'h00f0;
        matrixOut = M_matrixShow_q;
        M_pre_row_d[0+7-:8] = 8'hff;
        M_reset_button_reg_d = 1'h0;
        M_stop_button_reg_d = 1'h0;
        M_state_d = SHIFT_state;
      end
      SHIFT_state: begin
        if (M_stop_button_reg_q == 1'h0 && stop_button == 1'h1) begin
          M_stop_button_reg_d = 1'h1;
        end
        if (M_reset_button_reg_q == 1'h0 && reset_button == 1'h1) begin
          M_reset_button_reg_d = 1'h1;
        end
        M_time_d = M_time_q;
        if (M_slowClockEdge_out) begin
          if (M_time_q[0+3-:4] == 1'h0) begin
            if (M_time_q[4+3-:4] > 1'h0) begin
              M_time_d[4+3-:4] = M_time_q[4+3-:4] - 1'h1;
              M_time_d[0+3-:4] = 4'h9;
            end
          end else begin
            M_time_d[0+3-:4] = M_time_q[0+3-:4] - 1'h1;
          end
        end
        if (M_level_num_q < 4'h8) begin
          if (M_speed1_q == 23'h7fffff) begin
            M_speed1_d = 23'h000000;
            M_speed1count_d = 1'h1;
            M_matrixShow_d[(M_level_num_q)*8+7-:8] = M_rowShift_nextRefresh[0+7-:8];
            M_current_row_d = {8'h00, M_matrixShow_q[(M_level_num_q)*8+7-:8]};
          end else begin
            M_speed1_d = M_speed1_q + 1'h1;
          end
        end else begin
          if (M_speed2_q == 22'h3fffff) begin
            M_speed2_d = 22'h000000;
            M_speed1count_d = 1'h1;
            M_matrixShow_d[(M_level_num_q)*8+7-:8] = M_rowShift_nextRefresh[0+7-:8];
            M_current_row_d = {8'h00, M_matrixShow_q[(M_level_num_q)*8+7-:8]};
          end else begin
            M_speed2_d = M_speed2_q + 1'h1;
          end
        end
        M_current_row_d = M_current_row_q;
        M_pre_row_d = M_pre_row_q;
        M_rowShift_pre_row = M_pre_row_q;
        M_rowShift_current_row = M_current_row_q;
        M_rowShift_shift_or_check = 1'h1;
        M_matrixShow_d[120+7-:8] = {4'h0, M_level_num_q + 1'h1};
        M_matrixShow_d[0+127-:128] = M_matrixShow_q[0+127-:128];
        if (M_speed1count_q == 1'h1) begin
          M_matrixShow_d[(M_level_num_q)*8+7-:8] = M_rowShift_nextRefresh[0+7-:8];
          M_current_row_d = {8'h00, M_matrixShow_q[(M_level_num_q)*8+7-:8]};
          M_speed1count_d = 1'h0;
        end
        matrixOut = M_matrixShow_q;
        if (M_time_q == 16'h0000) begin
          M_state_d = LOSE_state;
        end else begin
          if (M_stop_button_reg_q == 1'h1 || M_reset_button_reg_q == 1'h1) begin
            M_state_d = INIT_CHECK_state;
          end else begin
            M_state_d = SHIFT_state;
          end
        end
        if (M_level_num_q == 1'h0) begin
          M_pre_row_d[0+7-:8] = 8'hff;
        end else begin
          M_pre_row_d[0+7-:8] = M_matrixShow_q[(M_level_num_q - 1'h1)*8+7-:8];
        end
      end
      INIT_CHECK_state: begin
        M_pre_row_d = M_pre_row_q;
        M_current_row_d = M_current_row_q;
        if (M_reset_button_reg_q == 1'h1) begin
          M_state_d = IDLE_state;
        end else begin
          if (M_stop_button_reg_q == 1'h1) begin
            M_state_d = CHECK_state;
          end
        end
      end
      CHECK_state: begin
        M_rowShift_pre_row = M_pre_row_q;
        M_rowShift_current_row = M_current_row_q;
        M_rowShift_shift_or_check = 1'h0;
        M_current_row_d = M_rowShift_nextRefresh;
        M_matrixShow_d[(M_level_num_q)*8+7-:8] = M_rowShift_nextRefresh[0+7-:8];
        M_matrixShow_d[(M_level_num_q + 1'h1)*8+7-:8] = M_rowShift_nextRefresh[0+7-:8];
        M_pre_row_d = M_pre_row_q;
        M_stop_button_reg_d = 1'h0;
        if (M_rowShift_nextRefresh == 16'h0000 || M_level_num_q == 4'hf || M_time_q == 16'h0000) begin
          M_state_d = END_STATE_state;
        end else begin
          M_state_d = INCREASE_LEVEL_state;
        end
      end
      INCREASE_LEVEL_state: begin
        M_alu_a = {12'h000, M_level_num_q};
        M_alu_b = 16'h0001;
        M_alu_alufn = 8'h00;
        M_level_num_d = M_alu_alu[0+3-:4];
        if (M_score_q[0+3-:4] == 3'h5) begin
          M_score_d[4+3-:4] = M_score_q[4+3-:4] + 1'h1;
          M_score_d[0+3-:4] = 1'h0;
        end else begin
          M_score_d[0+3-:4] = M_score_q[0+3-:4] + 3'h5;
        end
        M_state_d = SHIFT_state;
      end
      END_STATE_state: begin
        if (M_rowShift_nextRefresh == 16'h0000 || M_time_q == 16'h0000) begin
          M_state_d = LOSE_state;
        end else begin
          if (M_level_num_q == 4'hf) begin
            M_state_d = WIN_state;
          end
        end
      end
      WIN_state: begin
        M_endState_endState = 1'h1;
        M_matrixShow_d = M_endState_screen_matrix;
        matrixOut = M_matrixShow_q;
        M_final_time_d = M_time_q;
        M_final_score_d[0+3-:4] = M_final_time_q[0+3-:4];
        M_temp_d = 4'h8 + M_final_time_q[4+3-:4];
        if (M_temp_q >= 5'h0a) begin
          M_final_score_d[4+3-:4] = M_temp_q - 5'h0a;
          M_final_score_d[8+3-:4] = 4'h1;
        end else begin
          M_final_score_d[4+3-:4] = M_temp_q;
          M_final_score_d[8+3-:4] = 4'h0;
        end
        M_score_d = M_final_score_q;
        if (M_reset_button_reg_q == 1'h1) begin
          M_state_d = TIMER_END_state;
        end
      end
      LOSE_state: begin
        M_endState_endState = 1'h0;
        M_matrixShow_d = M_endState_screen_matrix;
        if (M_reset_button_reg_q == 1'h1) begin
          M_state_d = TIMER_END_state;
        end else begin
          M_state_d = M_state_q;
        end
        matrixOut = M_matrixShow_q;
      end
      TIMER_END_state: begin
        M_reset_button_reg_d = 1'h0;
        M_stop_button_reg_d = 1'h0;
        if (M_reset_button_reg_q == 1'h1) begin
          M_state_d = IDLE_state;
        end else begin
          M_state_d = M_state_q;
        end
      end
    endcase
    matrixOut = M_matrixShow_q;
    level_num_out = M_level_num_q;
    timeout = M_time_q;
    scoreout = M_score_q;
  end
  
  always @(posedge clk) begin
    M_current_row_q <= M_current_row_d;
    M_pre_row_q <= M_pre_row_d;
    M_matrixShow_q <= M_matrixShow_d;
    M_reset_button_reg_q <= M_reset_button_reg_d;
    M_stop_button_reg_q <= M_stop_button_reg_d;
    M_speed1_q <= M_speed1_d;
    M_speed2_q <= M_speed2_d;
    M_speed1count_q <= M_speed1count_d;
    M_time_q <= M_time_d;
    M_temp_q <= M_temp_d;
    M_score_q <= M_score_d;
    M_final_score_q <= M_final_score_d;
    M_final_time_q <= M_final_time_d;
    M_state_q <= M_state_d;
    
    if (rst == 1'b1) begin
      M_level_num_q <= 4'h0;
    end else begin
      M_level_num_q <= M_level_num_d;
    end
  end
  
endmodule
