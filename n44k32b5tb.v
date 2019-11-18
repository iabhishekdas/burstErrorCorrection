module tb;

	wire [0:31] msg, decmsg;
	reg [0:43] codeword;

	encoder ENC(msg, codeword);
	decoder DEC(codeword, decmsg);

	wire error;
	wire [31:0] err;
	genvar ii;
	generate 
		for(ii=0; ii<32; ii=ii+1) begin
			assign msg[ii] = 1'b1;
			assign err[ii] = (msg[ii] != decmsg[ii]);
		end
	endgenerate

	assign error = |(err);	

	reg [12:0] i;
	reg [1:0] j0,j1,j2,j3,j4;
	initial begin
		$monitor("Error: %b\t{%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,}\t%t", error,decmsg[0],decmsg[1],decmsg[2],decmsg[3],decmsg[4],decmsg[5],decmsg[6],decmsg[7],decmsg[8],decmsg[9],decmsg[10],decmsg[11],decmsg[12],decmsg[13],decmsg[14],decmsg[15],decmsg[16],decmsg[17],decmsg[18],decmsg[19],decmsg[20],decmsg[21],decmsg[22],decmsg[23],decmsg[24],decmsg[25],decmsg[26],decmsg[27],decmsg[28],decmsg[29],decmsg[30],decmsg[31],$time);
		// All possible errors
		for (i=0; i<40; i=i+1) begin
			for (j0=0; j0<2; j0=j0+1) begin
				for (j1=0; j1<2; j1=j1+1) begin
					for (j2=0; j2<2; j2=j2+1) begin
						for (j3=0; j3<2; j3=j3+1) begin
							for (j4=0; j4<2; j4=j4+1) begin
								case (i)
									0: begin #20 force codeword[0] = j0[0]; force codeword[1] = j1[0]; force codeword[2] = j2[0]; force codeword[3] = j3[0]; force codeword[4] = j4[0]; end 
									1: begin #20 force codeword[1] = j0[0]; force codeword[2] = j1[0]; force codeword[3] = j2[0]; force codeword[4] = j3[0]; force codeword[5] = j4[0]; end 
									2: begin #20 force codeword[2] = j0[0]; force codeword[3] = j1[0]; force codeword[4] = j2[0]; force codeword[5] = j3[0]; force codeword[6] = j4[0]; end 
									3: begin #20 force codeword[3] = j0[0]; force codeword[4] = j1[0]; force codeword[5] = j2[0]; force codeword[6] = j3[0]; force codeword[7] = j4[0]; end 
									4: begin #20 force codeword[4] = j0[0]; force codeword[5] = j1[0]; force codeword[6] = j2[0]; force codeword[7] = j3[0]; force codeword[8] = j4[0]; end 
									5: begin #20 force codeword[5] = j0[0]; force codeword[6] = j1[0]; force codeword[7] = j2[0]; force codeword[8] = j3[0]; force codeword[9] = j4[0]; end 
									6: begin #20 force codeword[6] = j0[0]; force codeword[7] = j1[0]; force codeword[8] = j2[0]; force codeword[9] = j3[0]; force codeword[10] = j4[0]; end 
									7: begin #20 force codeword[7] = j0[0]; force codeword[8] = j1[0]; force codeword[9] = j2[0]; force codeword[10] = j3[0]; force codeword[11] = j4[0]; end 
									8: begin #20 force codeword[8] = j0[0]; force codeword[9] = j1[0]; force codeword[10] = j2[0]; force codeword[11] = j3[0]; force codeword[12] = j4[0]; end 
									9: begin #20 force codeword[9] = j0[0]; force codeword[10] = j1[0]; force codeword[11] = j2[0]; force codeword[12] = j3[0]; force codeword[13] = j4[0]; end 
									10: begin #20 force codeword[10] = j0[0]; force codeword[11] = j1[0]; force codeword[12] = j2[0]; force codeword[13] = j3[0]; force codeword[14] = j4[0]; end 
									11: begin #20 force codeword[11] = j0[0]; force codeword[12] = j1[0]; force codeword[13] = j2[0]; force codeword[14] = j3[0]; force codeword[15] = j4[0]; end 
									12: begin #20 force codeword[12] = j0[0]; force codeword[13] = j1[0]; force codeword[14] = j2[0]; force codeword[15] = j3[0]; force codeword[16] = j4[0]; end 
									13: begin #20 force codeword[13] = j0[0]; force codeword[14] = j1[0]; force codeword[15] = j2[0]; force codeword[16] = j3[0]; force codeword[17] = j4[0]; end 
									14: begin #20 force codeword[14] = j0[0]; force codeword[15] = j1[0]; force codeword[16] = j2[0]; force codeword[17] = j3[0]; force codeword[18] = j4[0]; end 
									15: begin #20 force codeword[15] = j0[0]; force codeword[16] = j1[0]; force codeword[17] = j2[0]; force codeword[18] = j3[0]; force codeword[19] = j4[0]; end 
									16: begin #20 force codeword[16] = j0[0]; force codeword[17] = j1[0]; force codeword[18] = j2[0]; force codeword[19] = j3[0]; force codeword[20] = j4[0]; end 
									17: begin #20 force codeword[17] = j0[0]; force codeword[18] = j1[0]; force codeword[19] = j2[0]; force codeword[20] = j3[0]; force codeword[21] = j4[0]; end 
									18: begin #20 force codeword[18] = j0[0]; force codeword[19] = j1[0]; force codeword[20] = j2[0]; force codeword[21] = j3[0]; force codeword[22] = j4[0]; end 
									19: begin #20 force codeword[19] = j0[0]; force codeword[20] = j1[0]; force codeword[21] = j2[0]; force codeword[22] = j3[0]; force codeword[23] = j4[0]; end 
									20: begin #20 force codeword[20] = j0[0]; force codeword[21] = j1[0]; force codeword[22] = j2[0]; force codeword[23] = j3[0]; force codeword[24] = j4[0]; end 
									21: begin #20 force codeword[21] = j0[0]; force codeword[22] = j1[0]; force codeword[23] = j2[0]; force codeword[24] = j3[0]; force codeword[25] = j4[0]; end 
									22: begin #20 force codeword[22] = j0[0]; force codeword[23] = j1[0]; force codeword[24] = j2[0]; force codeword[25] = j3[0]; force codeword[26] = j4[0]; end 
									23: begin #20 force codeword[23] = j0[0]; force codeword[24] = j1[0]; force codeword[25] = j2[0]; force codeword[26] = j3[0]; force codeword[27] = j4[0]; end 
									24: begin #20 force codeword[24] = j0[0]; force codeword[25] = j1[0]; force codeword[26] = j2[0]; force codeword[27] = j3[0]; force codeword[28] = j4[0]; end 
									25: begin #20 force codeword[25] = j0[0]; force codeword[26] = j1[0]; force codeword[27] = j2[0]; force codeword[28] = j3[0]; force codeword[29] = j4[0]; end 
									26: begin #20 force codeword[26] = j0[0]; force codeword[27] = j1[0]; force codeword[28] = j2[0]; force codeword[29] = j3[0]; force codeword[30] = j4[0]; end 
									27: begin #20 force codeword[27] = j0[0]; force codeword[28] = j1[0]; force codeword[29] = j2[0]; force codeword[30] = j3[0]; force codeword[31] = j4[0]; end 
									28: begin #20 force codeword[28] = j0[0]; force codeword[29] = j1[0]; force codeword[30] = j2[0]; force codeword[31] = j3[0]; force codeword[32] = j4[0]; end 
									29: begin #20 force codeword[29] = j0[0]; force codeword[30] = j1[0]; force codeword[31] = j2[0]; force codeword[32] = j3[0]; force codeword[33] = j4[0]; end 
									30: begin #20 force codeword[30] = j0[0]; force codeword[31] = j1[0]; force codeword[32] = j2[0]; force codeword[33] = j3[0]; force codeword[34] = j4[0]; end 
									31: begin #20 force codeword[31] = j0[0]; force codeword[32] = j1[0]; force codeword[33] = j2[0]; force codeword[34] = j3[0]; force codeword[35] = j4[0]; end 
									32: begin #20 force codeword[32] = j0[0]; force codeword[33] = j1[0]; force codeword[34] = j2[0]; force codeword[35] = j3[0]; force codeword[36] = j4[0]; end 
									33: begin #20 force codeword[33] = j0[0]; force codeword[34] = j1[0]; force codeword[35] = j2[0]; force codeword[36] = j3[0]; force codeword[37] = j4[0]; end 
									34: begin #20 force codeword[34] = j0[0]; force codeword[35] = j1[0]; force codeword[36] = j2[0]; force codeword[37] = j3[0]; force codeword[38] = j4[0]; end 
									35: begin #20 force codeword[35] = j0[0]; force codeword[36] = j1[0]; force codeword[37] = j2[0]; force codeword[38] = j3[0]; force codeword[39] = j4[0]; end 
									36: begin #20 force codeword[36] = j0[0]; force codeword[37] = j1[0]; force codeword[38] = j2[0]; force codeword[39] = j3[0]; force codeword[40] = j4[0]; end 
									37: begin #20 force codeword[37] = j0[0]; force codeword[38] = j1[0]; force codeword[39] = j2[0]; force codeword[40] = j3[0]; force codeword[41] = j4[0]; end 
									38: begin #20 force codeword[38] = j0[0]; force codeword[39] = j1[0]; force codeword[40] = j2[0]; force codeword[41] = j3[0]; force codeword[42] = j4[0]; end 
									39: begin #20 force codeword[39] = j0[0]; force codeword[40] = j1[0]; force codeword[41] = j2[0]; force codeword[42] = j3[0]; force codeword[43] = j4[0]; end 
								endcase
								case (i)
									0: begin #20 release codeword[0]; release codeword[1]; release codeword[2]; release codeword[3]; release codeword[4]; end 
									1: begin #20 release codeword[1]; release codeword[2]; release codeword[3]; release codeword[4]; release codeword[5]; end 
									2: begin #20 release codeword[2]; release codeword[3]; release codeword[4]; release codeword[5]; release codeword[6]; end 
									3: begin #20 release codeword[3]; release codeword[4]; release codeword[5]; release codeword[6]; release codeword[7]; end 
									4: begin #20 release codeword[4]; release codeword[5]; release codeword[6]; release codeword[7]; release codeword[8]; end 
									5: begin #20 release codeword[5]; release codeword[6]; release codeword[7]; release codeword[8]; release codeword[9]; end 
									6: begin #20 release codeword[6]; release codeword[7]; release codeword[8]; release codeword[9]; release codeword[10]; end 
									7: begin #20 release codeword[7]; release codeword[8]; release codeword[9]; release codeword[10]; release codeword[11]; end 
									8: begin #20 release codeword[8]; release codeword[9]; release codeword[10]; release codeword[11]; release codeword[12]; end 
									9: begin #20 release codeword[9]; release codeword[10]; release codeword[11]; release codeword[12]; release codeword[13]; end 
									10: begin #20 release codeword[10]; release codeword[11]; release codeword[12]; release codeword[13]; release codeword[14]; end 
									11: begin #20 release codeword[11]; release codeword[12]; release codeword[13]; release codeword[14]; release codeword[15]; end 
									12: begin #20 release codeword[12]; release codeword[13]; release codeword[14]; release codeword[15]; release codeword[16]; end 
									13: begin #20 release codeword[13]; release codeword[14]; release codeword[15]; release codeword[16]; release codeword[17]; end 
									14: begin #20 release codeword[14]; release codeword[15]; release codeword[16]; release codeword[17]; release codeword[18]; end 
									15: begin #20 release codeword[15]; release codeword[16]; release codeword[17]; release codeword[18]; release codeword[19]; end 
									16: begin #20 release codeword[16]; release codeword[17]; release codeword[18]; release codeword[19]; release codeword[20]; end 
									17: begin #20 release codeword[17]; release codeword[18]; release codeword[19]; release codeword[20]; release codeword[21]; end 
									18: begin #20 release codeword[18]; release codeword[19]; release codeword[20]; release codeword[21]; release codeword[22]; end 
									19: begin #20 release codeword[19]; release codeword[20]; release codeword[21]; release codeword[22]; release codeword[23]; end 
									20: begin #20 release codeword[20]; release codeword[21]; release codeword[22]; release codeword[23]; release codeword[24]; end 
									21: begin #20 release codeword[21]; release codeword[22]; release codeword[23]; release codeword[24]; release codeword[25]; end 
									22: begin #20 release codeword[22]; release codeword[23]; release codeword[24]; release codeword[25]; release codeword[26]; end 
									23: begin #20 release codeword[23]; release codeword[24]; release codeword[25]; release codeword[26]; release codeword[27]; end 
									24: begin #20 release codeword[24]; release codeword[25]; release codeword[26]; release codeword[27]; release codeword[28]; end 
									25: begin #20 release codeword[25]; release codeword[26]; release codeword[27]; release codeword[28]; release codeword[29]; end 
									26: begin #20 release codeword[26]; release codeword[27]; release codeword[28]; release codeword[29]; release codeword[30]; end 
									27: begin #20 release codeword[27]; release codeword[28]; release codeword[29]; release codeword[30]; release codeword[31]; end 
									28: begin #20 release codeword[28]; release codeword[29]; release codeword[30]; release codeword[31]; release codeword[32]; end 
									29: begin #20 release codeword[29]; release codeword[30]; release codeword[31]; release codeword[32]; release codeword[33]; end 
									30: begin #20 release codeword[30]; release codeword[31]; release codeword[32]; release codeword[33]; release codeword[34]; end 
									31: begin #20 release codeword[31]; release codeword[32]; release codeword[33]; release codeword[34]; release codeword[35]; end 
									32: begin #20 release codeword[32]; release codeword[33]; release codeword[34]; release codeword[35]; release codeword[36]; end 
									33: begin #20 release codeword[33]; release codeword[34]; release codeword[35]; release codeword[36]; release codeword[37]; end 
									34: begin #20 release codeword[34]; release codeword[35]; release codeword[36]; release codeword[37]; release codeword[38]; end 
									35: begin #20 release codeword[35]; release codeword[36]; release codeword[37]; release codeword[38]; release codeword[39]; end 
									36: begin #20 release codeword[36]; release codeword[37]; release codeword[38]; release codeword[39]; release codeword[40]; end 
									37: begin #20 release codeword[37]; release codeword[38]; release codeword[39]; release codeword[40]; release codeword[41]; end 
									38: begin #20 release codeword[38]; release codeword[39]; release codeword[40]; release codeword[41]; release codeword[42]; end 
									39: begin #20 release codeword[39]; release codeword[40]; release codeword[41]; release codeword[42]; release codeword[43]; end 
								endcase
							end
						end
					end
				end
			end
		end
	#10 $finish;
	end

endmodule