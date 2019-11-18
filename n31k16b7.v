module encoder (
	input [0:15] m,
	output [0:30] c
);

	wire [0:14] p;

	assign p[0] = m[2] ^ m[9] ^ 0;
	assign p[1] = m[3] ^ m[10] ^ 0;
	assign p[2] = m[4] ^ m[11] ^ 0;
	assign p[3] = m[5] ^ m[12] ^ 0;
	assign p[4] = m[6] ^ m[13] ^ 0;
	assign p[5] = m[0] ^ m[7] ^ m[14] ^ 0;
	assign p[6] = m[1] ^ m[8] ^ m[15] ^ 0;
	assign p[7] = m[0] ^ m[1] ^ m[2] ^ m[8] ^ 0;
	assign p[8] = m[3] ^ m[9] ^ 0;
	assign p[9] = m[4] ^ m[10] ^ 0;
	assign p[10] = m[5] ^ m[11] ^ 0;
	assign p[11] = m[0] ^ m[1] ^ m[6] ^ m[12] ^ 0;
	assign p[12] = m[0] ^ m[7] ^ m[13] ^ 0;
	assign p[13] = m[1] ^ m[2] ^ m[3] ^ m[4] ^ m[5] ^ m[6] ^ m[7] ^ m[14] ^ 0;
	assign p[14] = m[2] ^ m[3] ^ m[4] ^ m[5] ^ m[6] ^ m[7] ^ m[8] ^ m[15] ^ 0;

	assign c = {m,p};

endmodule

module decoder (
	input [0:30] c,
	output [0:15] m
);

	wire [0:14] p, s;
	wire [0:15] b, en;
	assign b = c[0:15];
	assign p = c[16:30];

	assign s[0] = p[0] ^ b[2] ^ b[9] ^ 0;
	assign s[1] = p[1] ^ b[3] ^ b[10] ^ 0;
	assign s[2] = p[2] ^ b[4] ^ b[11] ^ 0;
	assign s[3] = p[3] ^ b[5] ^ b[12] ^ 0;
	assign s[4] = p[4] ^ b[6] ^ b[13] ^ 0;
	assign s[5] = p[5] ^ b[0] ^ b[7] ^ b[14] ^ 0;
	assign s[6] = p[6] ^ b[1] ^ b[8] ^ b[15] ^ 0;
	assign s[7] = p[7] ^ b[0] ^ b[1] ^ b[2] ^ b[8] ^ 0;
	assign s[8] = p[8] ^ b[3] ^ b[9] ^ 0;
	assign s[9] = p[9] ^ b[4] ^ b[10] ^ 0;
	assign s[10] = p[10] ^ b[5] ^ b[11] ^ 0;
	assign s[11] = p[11] ^ b[0] ^ b[1] ^ b[6] ^ b[12] ^ 0;
	assign s[12] = p[12] ^ b[0] ^ b[7] ^ b[13] ^ 0;
	assign s[13] = p[13] ^ b[1] ^ b[2] ^ b[3] ^ b[4] ^ b[5] ^ b[6] ^ b[7] ^ b[14] ^ 0;
	assign s[14] = p[14] ^ b[2] ^ b[3] ^ b[4] ^ b[5] ^ b[6] ^ b[7] ^ b[8] ^ b[15] ^ 0;

	assign en[0] = (s[7] ^ s[5] ^ s[6] ^ s[0] ^ 0) | (s[8] ^ s[1] ^ 0) | (s[9] ^ s[2] ^ 0) | (s[10] ^ s[3] ^ 0) | (s[11] ^ s[5] ^ s[6] ^ s[4] ^ 0) | (s[12] ^ s[5] ^ 0) | (s[13] ^ s[6] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ 0) | (s[14] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ 0);
	assign en[1] = (s[7] ^ s[6] ^ s[0] ^ 0) | (s[8] ^ s[1] ^ 0) | (s[9] ^ s[2] ^ 0) | (s[10] ^ s[3] ^ 0) | (s[11] ^ s[6] ^ s[4] ^ 0) | (s[12] ^ s[5] ^ 0) | (s[13] ^ s[6] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ 0) | (s[14] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ 0);
	assign en[2] = (s[7] ^ s[0] ^ s[6] ^ 0) | (s[8] ^ s[1] ^ 0) | (s[9] ^ s[2] ^ 0) | (s[10] ^ s[3] ^ 0) | (s[11] ^ s[4] ^ 0) | (s[12] ^ s[5] ^ 0) | (s[13] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ 0) | (s[14] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ s[6] ^ 0);
	assign en[3] = (s[7] ^ s[6] ^ 0) | (s[8] ^ s[1] ^ s[0] ^ 0) | (s[9] ^ s[2] ^ 0) | (s[10] ^ s[3] ^ 0) | (s[11] ^ s[4] ^ 0) | (s[12] ^ s[5] ^ 0) | (s[13] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ 0) | (s[14] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ s[6] ^ 0);
	assign en[4] = (s[7] ^ s[6] ^ 0) | (s[8] ^ s[0] ^ 0) | (s[9] ^ s[2] ^ s[1] ^ 0) | (s[10] ^ s[3] ^ 0) | (s[11] ^ s[4] ^ 0) | (s[12] ^ s[5] ^ 0) | (s[13] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ 0) | (s[14] ^ s[2] ^ s[3] ^ s[4] ^ s[5] ^ s[6] ^ 0);
	assign en[5] = (s[7] ^ s[6] ^ 0) | (s[8] ^ s[0] ^ 0) | (s[9] ^ s[1] ^ 0) | (s[10] ^ s[3] ^ s[2] ^ 0) | (s[11] ^ s[4] ^ 0) | (s[12] ^ s[5] ^ 0) | (s[13] ^ s[3] ^ s[4] ^ s[5] ^ 0) | (s[14] ^ s[3] ^ s[4] ^ s[5] ^ s[6] ^ 0);
	assign en[6] = (s[7] ^ s[6] ^ 0) | (s[8] ^ s[0] ^ 0) | (s[9] ^ s[1] ^ 0) | (s[10] ^ s[2] ^ 0) | (s[11] ^ s[4] ^ s[3] ^ 0) | (s[12] ^ s[5] ^ 0) | (s[13] ^ s[4] ^ s[5] ^ 0) | (s[14] ^ s[4] ^ s[5] ^ s[6] ^ 0);
	assign en[7] = (s[7] ^ s[6] ^ 0) | (s[8] ^ s[0] ^ 0) | (s[9] ^ s[1] ^ 0) | (s[10] ^ s[2] ^ 0) | (s[11] ^ s[3] ^ 0) | (s[12] ^ s[5] ^ s[4] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[5] ^ s[6] ^ 0);
	assign en[8] = (s[7] ^ s[6] ^ 0) | (s[8] ^ s[0] ^ 0) | (s[9] ^ s[1] ^ 0) | (s[10] ^ s[2] ^ 0) | (s[11] ^ s[3] ^ 0) | (s[12] ^ s[4] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[6] ^ 0);
	assign en[9] = (s[7] ^ 0) | (s[8] ^ s[0] ^ 0) | (s[9] ^ s[1] ^ 0) | (s[10] ^ s[2] ^ 0) | (s[11] ^ s[3] ^ 0) | (s[12] ^ s[4] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[6] ^ 0);
	assign en[10] = (s[7] ^ 0) | (s[8] ^ 0) | (s[9] ^ s[1] ^ 0) | (s[10] ^ s[2] ^ 0) | (s[11] ^ s[3] ^ 0) | (s[12] ^ s[4] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[6] ^ 0);
	assign en[11] = (s[7] ^ 0) | (s[8] ^ 0) | (s[9] ^ 0) | (s[10] ^ s[2] ^ 0) | (s[11] ^ s[3] ^ 0) | (s[12] ^ s[4] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[6] ^ 0);
	assign en[12] = (s[7] ^ 0) | (s[8] ^ 0) | (s[9] ^ 0) | (s[10] ^ 0) | (s[11] ^ s[3] ^ 0) | (s[12] ^ s[4] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[6] ^ 0);
	assign en[13] = (s[7] ^ 0) | (s[8] ^ 0) | (s[9] ^ 0) | (s[10] ^ 0) | (s[11] ^ 0) | (s[12] ^ s[4] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[6] ^ 0);
	assign en[14] = (s[7] ^ 0) | (s[8] ^ 0) | (s[9] ^ 0) | (s[10] ^ 0) | (s[11] ^ 0) | (s[12] ^ 0) | (s[13] ^ s[5] ^ 0) | (s[14] ^ s[6] ^ 0);
	assign en[15] = (s[7] ^ 0) | (s[8] ^ 0) | (s[9] ^ 0) | (s[10] ^ 0) | (s[11] ^ 0) | (s[12] ^ 0) | (s[13] ^ 0) | (s[14] ^ s[6] ^ 0);

	assign m[0] = ((~( en[0] )) & s[5]) ^ b[0];
	assign m[1] = ((~( en[1] & en[0] )) & s[6]) ^ b[1];
	assign m[2] = ((~( en[2] & en[1] & en[0] )) & s[0]) ^ b[2];
	assign m[3] = ((~( en[3] & en[2] & en[1] & en[0] )) & s[1]) ^ b[3];
	assign m[4] = ((~( en[4] & en[3] & en[2] & en[1] & en[0] )) & s[2]) ^ b[4];
	assign m[5] = ((~( en[5] & en[4] & en[3] & en[2] & en[1] & en[0] )) & s[3]) ^ b[5];
	assign m[6] = ((~( en[6] & en[5] & en[4] & en[3] & en[2] & en[1] & en[0] )) & s[4]) ^ b[6];
	assign m[7] = ((~( en[7] & en[6] & en[5] & en[4] & en[3] & en[2] & en[1] )) & s[5]) ^ b[7];
	assign m[8] = ((~( en[8] & en[7] & en[6] & en[5] & en[4] & en[3] & en[2] )) & s[6]) ^ b[8];
	assign m[9] = ((~( en[9] & en[8] & en[7] & en[6] & en[5] & en[4] & en[3] )) & s[0]) ^ b[9];
	assign m[10] = ((~( en[10] & en[9] & en[8] & en[7] & en[6] & en[5] & en[4] )) & s[1]) ^ b[10];
	assign m[11] = ((~( en[11] & en[10] & en[9] & en[8] & en[7] & en[6] & en[5] )) & s[2]) ^ b[11];
	assign m[12] = ((~( en[12] & en[11] & en[10] & en[9] & en[8] & en[7] & en[6] )) & s[3]) ^ b[12];
	assign m[13] = ((~( en[13] & en[12] & en[11] & en[10] & en[9] & en[8] & en[7] )) & s[4]) ^ b[13];
	assign m[14] = ((~( en[14] & en[13] & en[12] & en[11] & en[10] & en[9] & en[8] )) & s[5]) ^ b[14];
	assign m[15] = ((~( en[15] & en[14] & en[13] & en[12] & en[11] & en[10] & en[9] )) & s[6]) ^ b[15];

endmodule