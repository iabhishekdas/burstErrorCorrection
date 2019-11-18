module tb;

	wire [0:15] msg, decmsg;
	reg [0:23] codeword;

	encoder ENC(msg, codeword);
	decoder DEC(codeword, decmsg);

	wire error;
	wire [15:0] err;
	genvar ii;
	generate 
		for(ii=0; ii<16; ii=ii+1) begin
			assign msg[ii] = 1'b1;
			assign err[ii] = (msg[ii] != decmsg[ii]);
		end
	endgenerate

	assign error = |(err);	

	reg [8:0] i;
	reg [1:0] j0,j1,j2;
	initial begin
		$monitor("Error: %b\t{%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,%d,}\t%t", error,decmsg[0],decmsg[1],decmsg[2],decmsg[3],decmsg[4],decmsg[5],decmsg[6],decmsg[7],decmsg[8],decmsg[9],decmsg[10],decmsg[11],decmsg[12],decmsg[13],decmsg[14],decmsg[15],$time);
		// All possible errors
		for (i=0; i<22; i=i+1) begin
			for (j0=0; j0<2; j0=j0+1) begin
				for (j1=0; j1<2; j1=j1+1) begin
					for (j2=0; j2<2; j2=j2+1) begin
						case (i)
							0: begin #20 force codeword[0] = j0[0]; force codeword[1] = j1[0]; force codeword[2] = j2[0]; end 
							1: begin #20 force codeword[1] = j0[0]; force codeword[2] = j1[0]; force codeword[3] = j2[0]; end 
							2: begin #20 force codeword[2] = j0[0]; force codeword[3] = j1[0]; force codeword[4] = j2[0]; end 
							3: begin #20 force codeword[3] = j0[0]; force codeword[4] = j1[0]; force codeword[5] = j2[0]; end 
							4: begin #20 force codeword[4] = j0[0]; force codeword[5] = j1[0]; force codeword[6] = j2[0]; end 
							5: begin #20 force codeword[5] = j0[0]; force codeword[6] = j1[0]; force codeword[7] = j2[0]; end 
							6: begin #20 force codeword[6] = j0[0]; force codeword[7] = j1[0]; force codeword[8] = j2[0]; end 
							7: begin #20 force codeword[7] = j0[0]; force codeword[8] = j1[0]; force codeword[9] = j2[0]; end 
							8: begin #20 force codeword[8] = j0[0]; force codeword[9] = j1[0]; force codeword[10] = j2[0]; end 
							9: begin #20 force codeword[9] = j0[0]; force codeword[10] = j1[0]; force codeword[11] = j2[0]; end 
							10: begin #20 force codeword[10] = j0[0]; force codeword[11] = j1[0]; force codeword[12] = j2[0]; end 
							11: begin #20 force codeword[11] = j0[0]; force codeword[12] = j1[0]; force codeword[13] = j2[0]; end 
							12: begin #20 force codeword[12] = j0[0]; force codeword[13] = j1[0]; force codeword[14] = j2[0]; end 
							13: begin #20 force codeword[13] = j0[0]; force codeword[14] = j1[0]; force codeword[15] = j2[0]; end 
							14: begin #20 force codeword[14] = j0[0]; force codeword[15] = j1[0]; force codeword[16] = j2[0]; end 
							15: begin #20 force codeword[15] = j0[0]; force codeword[16] = j1[0]; force codeword[17] = j2[0]; end 
							16: begin #20 force codeword[16] = j0[0]; force codeword[17] = j1[0]; force codeword[18] = j2[0]; end 
							17: begin #20 force codeword[17] = j0[0]; force codeword[18] = j1[0]; force codeword[19] = j2[0]; end 
							18: begin #20 force codeword[18] = j0[0]; force codeword[19] = j1[0]; force codeword[20] = j2[0]; end 
							19: begin #20 force codeword[19] = j0[0]; force codeword[20] = j1[0]; force codeword[21] = j2[0]; end 
							20: begin #20 force codeword[20] = j0[0]; force codeword[21] = j1[0]; force codeword[22] = j2[0]; end 
							21: begin #20 force codeword[21] = j0[0]; force codeword[22] = j1[0]; force codeword[23] = j2[0]; end 
						endcase
						case (i)
							0: begin #20 release codeword[0]; release codeword[1]; release codeword[2]; end 
							1: begin #20 release codeword[1]; release codeword[2]; release codeword[3]; end 
							2: begin #20 release codeword[2]; release codeword[3]; release codeword[4]; end 
							3: begin #20 release codeword[3]; release codeword[4]; release codeword[5]; end 
							4: begin #20 release codeword[4]; release codeword[5]; release codeword[6]; end 
							5: begin #20 release codeword[5]; release codeword[6]; release codeword[7]; end 
							6: begin #20 release codeword[6]; release codeword[7]; release codeword[8]; end 
							7: begin #20 release codeword[7]; release codeword[8]; release codeword[9]; end 
							8: begin #20 release codeword[8]; release codeword[9]; release codeword[10]; end 
							9: begin #20 release codeword[9]; release codeword[10]; release codeword[11]; end 
							10: begin #20 release codeword[10]; release codeword[11]; release codeword[12]; end 
							11: begin #20 release codeword[11]; release codeword[12]; release codeword[13]; end 
							12: begin #20 release codeword[12]; release codeword[13]; release codeword[14]; end 
							13: begin #20 release codeword[13]; release codeword[14]; release codeword[15]; end 
							14: begin #20 release codeword[14]; release codeword[15]; release codeword[16]; end 
							15: begin #20 release codeword[15]; release codeword[16]; release codeword[17]; end 
							16: begin #20 release codeword[16]; release codeword[17]; release codeword[18]; end 
							17: begin #20 release codeword[17]; release codeword[18]; release codeword[19]; end 
							18: begin #20 release codeword[18]; release codeword[19]; release codeword[20]; end 
							19: begin #20 release codeword[19]; release codeword[20]; release codeword[21]; end 
							20: begin #20 release codeword[20]; release codeword[21]; release codeword[22]; end 
							21: begin #20 release codeword[21]; release codeword[22]; release codeword[23]; end 
						endcase
					end
				end
			end
		end
	#10 $finish;
	end

endmodule