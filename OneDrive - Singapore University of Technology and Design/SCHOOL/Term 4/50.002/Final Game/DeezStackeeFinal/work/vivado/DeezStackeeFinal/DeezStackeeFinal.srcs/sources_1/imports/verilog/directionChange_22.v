/*
   This file was generated automatically by Alchitry Labs version 1.2.7.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module directionChange_22 (
    input clk,
    input direction,
    input [15:0] current_row,
    output reg next_direction
  );
  
  
  
  always @* begin
    next_direction = 1'h0;
    if (direction == 1'h0) begin
      if (current_row[0+0-:1] == 1'h1) begin
        next_direction = 1'h1;
      end else begin
        if (current_row[0+0-:1] == 1'h0) begin
          next_direction = 1'h0;
        end
      end
    end else begin
      if (direction == 1'h1) begin
        if (current_row[7+0-:1] == 1'h1) begin
          next_direction = 1'h0;
        end else begin
          if (current_row[7+0-:1] == 1'h0) begin
            next_direction = 1'h1;
          end
        end
      end
    end
  end
endmodule
