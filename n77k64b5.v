module encoder (
	input [0:63] m,
	output [0:76] c
);

	wire [0:12] p;

	assign p[0] = m[4] ^ m[9] ^ m[14] ^ m[19] ^ m[24] ^ m[29] ^ m[34] ^ m[39] ^ m[44] ^ m[49] ^ m[54] ^ m[59];
	assign p[1] = m[0] ^ m[5] ^ m[10] ^ m[15] ^ m[20] ^ m[25] ^ m[30] ^ m[35] ^ m[40] ^ m[45] ^ m[50] ^ m[55] ^ m[60];
	assign p[2] = m[1] ^ m[6] ^ m[11] ^ m[16] ^ m[21] ^ m[26] ^ m[31] ^ m[36] ^ m[41] ^ m[46] ^ m[51] ^ m[56] ^ m[61];
	assign p[3] = m[2] ^ m[7] ^ m[12] ^ m[17] ^ m[22] ^ m[27] ^ m[32] ^ m[37] ^ m[42] ^ m[47] ^ m[52] ^ m[57] ^ m[62];
	assign p[4] = m[3] ^ m[8] ^ m[13] ^ m[18] ^ m[23] ^ m[28] ^ m[33] ^ m[38] ^ m[43] ^ m[48] ^ m[53] ^ m[58] ^ m[63];
	assign p[5] = m[4] ^ m[10] ^ m[11] ^ m[12] ^ m[13] ^ m[14] ^ m[17] ^ m[18] ^ m[19] ^ m[20] ^ m[21] ^ m[27] ^ m[34] ^ m[35] ^ m[36] ^ m[37] ^ m[38] ^ m[39] ^ m[50] ^ m[51] ^ m[52] ^ m[53] ^ m[54] ^ m[55] ^ m[56];
	assign p[6] = m[0] ^ m[5] ^ m[11] ^ m[12] ^ m[13] ^ m[15] ^ m[16] ^ m[17] ^ m[18] ^ m[19] ^ m[20] ^ m[22] ^ m[23] ^ m[24] ^ m[28] ^ m[29] ^ m[30] ^ m[34] ^ m[35] ^ m[40] ^ m[41] ^ m[42] ^ m[50] ^ m[57];
	assign p[7] = m[0] ^ m[1] ^ m[4] ^ m[6] ^ m[10] ^ m[11] ^ m[12] ^ m[15] ^ m[17] ^ m[18] ^ m[22] ^ m[25] ^ m[26] ^ m[28] ^ m[31] ^ m[32] ^ m[36] ^ m[40] ^ m[43] ^ m[44] ^ m[45] ^ m[46] ^ m[51] ^ m[58];
	assign p[8] = m[2] ^ m[3] ^ m[10] ^ m[11] ^ m[12] ^ m[14] ^ m[15] ^ m[16] ^ m[17] ^ m[19] ^ m[20] ^ m[21] ^ m[23] ^ m[25] ^ m[26] ^ m[29] ^ m[31] ^ m[36] ^ m[37] ^ m[38] ^ m[43] ^ m[47] ^ m[52] ^ m[59];
	assign p[9] = m[2] ^ m[8] ^ m[10] ^ m[11] ^ m[13] ^ m[14] ^ m[15] ^ m[16] ^ m[18] ^ m[19] ^ m[21] ^ m[22] ^ m[23] ^ m[24] ^ m[25] ^ m[26] ^ m[29] ^ m[30] ^ m[33] ^ m[34] ^ m[41] ^ m[44] ^ m[48] ^ m[49] ^ m[53] ^ m[60];
	assign p[10] = m[0] ^ m[1] ^ m[2] ^ m[3] ^ m[7] ^ m[10] ^ m[12] ^ m[13] ^ m[14] ^ m[15] ^ m[16] ^ m[17] ^ m[20] ^ m[22] ^ m[23] ^ m[24] ^ m[25] ^ m[27] ^ m[28] ^ m[29] ^ m[31] ^ m[32] ^ m[33] ^ m[37] ^ m[39] ^ m[42] ^ m[43] ^ m[45] ^ m[47] ^ m[48] ^ m[49] ^ m[54] ^ m[61];
	assign p[11] = m[0] ^ m[1] ^ m[2] ^ m[3] ^ m[5] ^ m[7] ^ m[10] ^ m[11] ^ m[12] ^ m[13] ^ m[14] ^ m[15] ^ m[16] ^ m[18] ^ m[19] ^ m[21] ^ m[22] ^ m[24] ^ m[26] ^ m[27] ^ m[30] ^ m[32] ^ m[33] ^ m[35] ^ m[40] ^ m[41] ^ m[44] ^ m[45] ^ m[46] ^ m[48] ^ m[55] ^ m[57] ^ m[62];
	assign p[12] = m[1] ^ m[3] ^ m[4] ^ m[6] ^ m[9] ^ m[10] ^ m[13] ^ m[14] ^ m[16] ^ m[20] ^ m[21] ^ m[23] ^ m[24] ^ m[25] ^ m[26] ^ m[27] ^ m[28] ^ m[30] ^ m[31] ^ m[32] ^ m[33] ^ m[38] ^ m[39] ^ m[42] ^ m[46] ^ m[47] ^ m[49] ^ m[56] ^ m[58] ^ m[63];

	assign c = {m,p};

endmodule

module decoder (
	input [0:76] c,
	output [0:63] m
);

	wire [0:12] p, s;
	wire [0:63] b, en;
	assign b = c[0:63];
	assign p = c[64:76];

	assign s[0] = p[0] ^ b[4] ^ b[9] ^ b[14] ^ b[19] ^ b[24] ^ b[29] ^ b[34] ^ b[39] ^ b[44] ^ b[49] ^ b[54] ^ b[59];
	assign s[1] = p[1] ^ b[0] ^ b[5] ^ b[10] ^ b[15] ^ b[20] ^ b[25] ^ b[30] ^ b[35] ^ b[40] ^ b[45] ^ b[50] ^ b[55] ^ b[60];
	assign s[2] = p[2] ^ b[1] ^ b[6] ^ b[11] ^ b[16] ^ b[21] ^ b[26] ^ b[31] ^ b[36] ^ b[41] ^ b[46] ^ b[51] ^ b[56] ^ b[61];
	assign s[3] = p[3] ^ b[2] ^ b[7] ^ b[12] ^ b[17] ^ b[22] ^ b[27] ^ b[32] ^ b[37] ^ b[42] ^ b[47] ^ b[52] ^ b[57] ^ b[62];
	assign s[4] = p[4] ^ b[3] ^ b[8] ^ b[13] ^ b[18] ^ b[23] ^ b[28] ^ b[33] ^ b[38] ^ b[43] ^ b[48] ^ b[53] ^ b[58] ^ b[63];
	assign s[5] = p[5] ^ b[4] ^ b[10] ^ b[11] ^ b[12] ^ b[13] ^ b[14] ^ b[17] ^ b[18] ^ b[19] ^ b[20] ^ b[21] ^ b[27] ^ b[34] ^ b[35] ^ b[36] ^ b[37] ^ b[38] ^ b[39] ^ b[50] ^ b[51] ^ b[52] ^ b[53] ^ b[54] ^ b[55] ^ b[56];
	assign s[6] = p[6] ^ b[0] ^ b[5] ^ b[11] ^ b[12] ^ b[13] ^ b[15] ^ b[16] ^ b[17] ^ b[18] ^ b[19] ^ b[20] ^ b[22] ^ b[23] ^ b[24] ^ b[28] ^ b[29] ^ b[30] ^ b[34] ^ b[35] ^ b[40] ^ b[41] ^ b[42] ^ b[50] ^ b[57];
	assign s[7] = p[7] ^ b[0] ^ b[1] ^ b[4] ^ b[6] ^ b[10] ^ b[11] ^ b[12] ^ b[15] ^ b[17] ^ b[18] ^ b[22] ^ b[25] ^ b[26] ^ b[28] ^ b[31] ^ b[32] ^ b[36] ^ b[40] ^ b[43] ^ b[44] ^ b[45] ^ b[46] ^ b[51] ^ b[58];
	assign s[8] = p[8] ^ b[2] ^ b[3] ^ b[10] ^ b[11] ^ b[12] ^ b[14] ^ b[15] ^ b[16] ^ b[17] ^ b[19] ^ b[20] ^ b[21] ^ b[23] ^ b[25] ^ b[26] ^ b[29] ^ b[31] ^ b[36] ^ b[37] ^ b[38] ^ b[43] ^ b[47] ^ b[52] ^ b[59];
	assign s[9] = p[9] ^ b[2] ^ b[8] ^ b[10] ^ b[11] ^ b[13] ^ b[14] ^ b[15] ^ b[16] ^ b[18] ^ b[19] ^ b[21] ^ b[22] ^ b[23] ^ b[24] ^ b[25] ^ b[26] ^ b[29] ^ b[30] ^ b[33] ^ b[34] ^ b[41] ^ b[44] ^ b[48] ^ b[49] ^ b[53] ^ b[60];
	assign s[10] = p[10] ^ b[0] ^ b[1] ^ b[2] ^ b[3] ^ b[7] ^ b[10] ^ b[12] ^ b[13] ^ b[14] ^ b[15] ^ b[16] ^ b[17] ^ b[20] ^ b[22] ^ b[23] ^ b[24] ^ b[25] ^ b[27] ^ b[28] ^ b[29] ^ b[31] ^ b[32] ^ b[33] ^ b[37] ^ b[39] ^ b[42] ^ b[43] ^ b[45] ^ b[47] ^ b[48] ^ b[49] ^ b[54] ^ b[61];
	assign s[11] = p[11] ^ b[0] ^ b[1] ^ b[2] ^ b[3] ^ b[5] ^ b[7] ^ b[10] ^ b[11] ^ b[12] ^ b[13] ^ b[14] ^ b[15] ^ b[16] ^ b[18] ^ b[19] ^ b[21] ^ b[22] ^ b[24] ^ b[26] ^ b[27] ^ b[30] ^ b[32] ^ b[33] ^ b[35] ^ b[40] ^ b[41] ^ b[44] ^ b[45] ^ b[46] ^ b[48] ^ b[55] ^ b[57] ^ b[62];
	assign s[12] = p[12] ^ b[1] ^ b[3] ^ b[4] ^ b[6] ^ b[9] ^ b[10] ^ b[13] ^ b[14] ^ b[16] ^ b[20] ^ b[21] ^ b[23] ^ b[24] ^ b[25] ^ b[26] ^ b[27] ^ b[28] ^ b[30] ^ b[31] ^ b[32] ^ b[33] ^ b[38] ^ b[39] ^ b[42] ^ b[46] ^ b[47] ^ b[49] ^ b[56] ^ b[58] ^ b[63];

	assign en[0] = (s[5] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[1] ^ s[2] ^ s[0]) | (s[8] ^ s[3] ^ s[4]) | (s[9] ^ s[3]) | (s[10] ^ s[1] ^ s[2] ^ s[3] ^ s[4]) | (s[11] ^ s[1] ^ s[2] ^ s[3] ^ s[4]) | (s[12] ^ s[2] ^ s[4] ^ s[0]);
	assign en[1] = (s[5] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[2] ^ s[0]) | (s[8] ^ s[3] ^ s[4]) | (s[9] ^ s[3]) | (s[10] ^ s[2] ^ s[3] ^ s[4]) | (s[11] ^ s[2] ^ s[3] ^ s[4] ^ s[1]) | (s[12] ^ s[2] ^ s[4] ^ s[0]);
	assign en[2] = (s[5] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[0] ^ s[2]) | (s[8] ^ s[3] ^ s[4]) | (s[9] ^ s[3]) | (s[10] ^ s[3] ^ s[4]) | (s[11] ^ s[3] ^ s[4] ^ s[1]) | (s[12] ^ s[4] ^ s[0] ^ s[2]);
	assign en[3] = (s[5] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[0] ^ s[2]) | (s[8] ^ s[4]) | (s[9]) | (s[10] ^ s[4] ^ s[3]) | (s[11] ^ s[4] ^ s[1] ^ s[3]) | (s[12] ^ s[4] ^ s[0] ^ s[2]);
	assign en[4] = (s[5] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[0] ^ s[2]) | (s[8]) | (s[9] ^ s[4]) | (s[10] ^ s[3]) | (s[11] ^ s[1] ^ s[3]) | (s[12] ^ s[0] ^ s[2]);
	assign en[5] = (s[5]) | (s[6] ^ s[1]) | (s[7] ^ s[2]) | (s[8]) | (s[9] ^ s[4]) | (s[10] ^ s[3]) | (s[11] ^ s[1] ^ s[3]) | (s[12] ^ s[2] ^ s[0]);
	assign en[6] = (s[5] ^ s[1]) | (s[6]) | (s[7] ^ s[2] ^ s[1]) | (s[8] ^ s[1]) | (s[9] ^ s[4] ^ s[1]) | (s[10] ^ s[3] ^ s[1]) | (s[11] ^ s[3] ^ s[1]) | (s[12] ^ s[2] ^ s[0] ^ s[1]);
	assign en[7] = (s[5] ^ s[1] ^ s[2]) | (s[6] ^ s[2]) | (s[7] ^ s[1] ^ s[2]) | (s[8] ^ s[1] ^ s[2]) | (s[9] ^ s[4] ^ s[1] ^ s[2]) | (s[10] ^ s[3] ^ s[1]) | (s[11] ^ s[3] ^ s[1] ^ s[2]) | (s[12] ^ s[0] ^ s[1]);
	assign en[8] = (s[5] ^ s[1] ^ s[2] ^ s[3]) | (s[6] ^ s[2] ^ s[3]) | (s[7] ^ s[1] ^ s[2] ^ s[3]) | (s[8] ^ s[1] ^ s[2] ^ s[3]) | (s[9] ^ s[4] ^ s[1] ^ s[2]) | (s[10] ^ s[1] ^ s[3]) | (s[11] ^ s[1] ^ s[2] ^ s[3]) | (s[12] ^ s[0] ^ s[1]);
	assign en[9] = (s[5] ^ s[1] ^ s[2] ^ s[3] ^ s[4]) | (s[6] ^ s[2] ^ s[3] ^ s[4]) | (s[7] ^ s[1] ^ s[2] ^ s[3]) | (s[8] ^ s[1] ^ s[2] ^ s[3]) | (s[9] ^ s[1] ^ s[2] ^ s[4]) | (s[10] ^ s[1] ^ s[3] ^ s[4]) | (s[11] ^ s[1] ^ s[2] ^ s[3] ^ s[4]) | (s[12] ^ s[0] ^ s[1] ^ s[4]);
	assign en[10] = (s[5] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[2] ^ s[3] ^ s[4]) | (s[7] ^ s[1] ^ s[2] ^ s[3]) | (s[8] ^ s[1] ^ s[2] ^ s[3] ^ s[0]) | (s[9] ^ s[1] ^ s[2] ^ s[4] ^ s[0]) | (s[10] ^ s[1] ^ s[3] ^ s[4] ^ s[0]) | (s[11] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[12] ^ s[1] ^ s[4] ^ s[0]);
	assign en[11] = (s[5] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[2] ^ s[3] ^ s[4] ^ s[1]) | (s[7] ^ s[2] ^ s[3] ^ s[1]) | (s[8] ^ s[2] ^ s[3] ^ s[0] ^ s[1]) | (s[9] ^ s[2] ^ s[4] ^ s[0] ^ s[1]) | (s[10] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[11] ^ s[2] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[12] ^ s[4] ^ s[0]);
	assign en[12] = (s[5] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[3] ^ s[4] ^ s[1] ^ s[2]) | (s[7] ^ s[3] ^ s[1]) | (s[8] ^ s[3] ^ s[0] ^ s[1] ^ s[2]) | (s[9] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[10] ^ s[3] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[11] ^ s[3] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[12] ^ s[4] ^ s[0] ^ s[2]);
	assign en[13] = (s[5] ^ s[4] ^ s[0] ^ s[3]) | (s[6] ^ s[4] ^ s[1] ^ s[2] ^ s[3]) | (s[7] ^ s[1] ^ s[3]) | (s[8] ^ s[0] ^ s[1] ^ s[2] ^ s[3]) | (s[9] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[10] ^ s[4] ^ s[0] ^ s[1] ^ s[2] ^ s[3]) | (s[11] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[12] ^ s[4] ^ s[0] ^ s[2]);
	assign en[14] = (s[5] ^ s[0] ^ s[3] ^ s[4]) | (s[6] ^ s[1] ^ s[2] ^ s[3] ^ s[4]) | (s[7] ^ s[1] ^ s[3] ^ s[4]) | (s[8] ^ s[0] ^ s[1] ^ s[2] ^ s[3]) | (s[9] ^ s[0] ^ s[1] ^ s[2] ^ s[4]) | (s[10] ^ s[0] ^ s[1] ^ s[2] ^ s[3]) | (s[11] ^ s[0] ^ s[1] ^ s[2] ^ s[4]) | (s[12] ^ s[0] ^ s[2]);
	assign en[15] = (s[5] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[7] ^ s[1] ^ s[3] ^ s[4]) | (s[8] ^ s[1] ^ s[2] ^ s[3] ^ s[0]) | (s[9] ^ s[1] ^ s[2] ^ s[4] ^ s[0]) | (s[10] ^ s[1] ^ s[2] ^ s[3]) | (s[11] ^ s[1] ^ s[2] ^ s[4] ^ s[0]) | (s[12] ^ s[2]);
	assign en[16] = (s[5] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[6] ^ s[2] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[7] ^ s[3] ^ s[4]) | (s[8] ^ s[2] ^ s[3] ^ s[0] ^ s[1]) | (s[9] ^ s[2] ^ s[4] ^ s[0]) | (s[10] ^ s[2] ^ s[3] ^ s[1]) | (s[11] ^ s[2] ^ s[4] ^ s[0]) | (s[12] ^ s[2] ^ s[1]);
	assign en[17] = (s[5] ^ s[3] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[6] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[7] ^ s[3] ^ s[4]) | (s[8] ^ s[3] ^ s[0] ^ s[1] ^ s[2]) | (s[9] ^ s[4] ^ s[0] ^ s[2]) | (s[10] ^ s[3] ^ s[1]) | (s[11] ^ s[4] ^ s[0] ^ s[2]) | (s[12] ^ s[1] ^ s[2]);
	assign en[18] = (s[5] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[6] ^ s[4] ^ s[0] ^ s[1] ^ s[3]) | (s[7] ^ s[4] ^ s[3]) | (s[8] ^ s[0] ^ s[1] ^ s[2]) | (s[9] ^ s[4] ^ s[0] ^ s[2] ^ s[3]) | (s[10] ^ s[1] ^ s[3]) | (s[11] ^ s[4] ^ s[0] ^ s[2] ^ s[3]) | (s[12] ^ s[1] ^ s[2]);
	assign en[19] = (s[5] ^ s[0] ^ s[1] ^ s[2]) | (s[6] ^ s[0] ^ s[1] ^ s[3] ^ s[4]) | (s[7] ^ s[3]) | (s[8] ^ s[0] ^ s[1] ^ s[2] ^ s[4]) | (s[9] ^ s[0] ^ s[2] ^ s[3] ^ s[4]) | (s[10] ^ s[1] ^ s[3] ^ s[4]) | (s[11] ^ s[0] ^ s[2] ^ s[3]) | (s[12] ^ s[1] ^ s[2] ^ s[4]);
	assign en[20] = (s[5] ^ s[1] ^ s[2]) | (s[6] ^ s[1] ^ s[3] ^ s[4] ^ s[0]) | (s[7] ^ s[3]) | (s[8] ^ s[1] ^ s[2] ^ s[4]) | (s[9] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[10] ^ s[1] ^ s[3] ^ s[4] ^ s[0]) | (s[11] ^ s[2] ^ s[3] ^ s[0]) | (s[12] ^ s[1] ^ s[2] ^ s[4] ^ s[0]);
	assign en[21] = (s[5] ^ s[2]) | (s[6] ^ s[3] ^ s[4] ^ s[0]) | (s[7] ^ s[3] ^ s[1]) | (s[8] ^ s[2] ^ s[4] ^ s[1]) | (s[9] ^ s[2] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[10] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[11] ^ s[2] ^ s[3] ^ s[0]) | (s[12] ^ s[2] ^ s[4] ^ s[0] ^ s[1]);
	assign en[22] = (s[5]) | (s[6] ^ s[3] ^ s[4] ^ s[0]) | (s[7] ^ s[3] ^ s[1] ^ s[2]) | (s[8] ^ s[4] ^ s[1] ^ s[2]) | (s[9] ^ s[3] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[10] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[11] ^ s[3] ^ s[0] ^ s[2]) | (s[12] ^ s[4] ^ s[0] ^ s[1] ^ s[2]);
	assign en[23] = (s[5] ^ s[3]) | (s[6] ^ s[4] ^ s[0]) | (s[7] ^ s[1] ^ s[2]) | (s[8] ^ s[4] ^ s[1] ^ s[2]) | (s[9] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[10] ^ s[4] ^ s[0] ^ s[1] ^ s[3]) | (s[11] ^ s[0] ^ s[2] ^ s[3]) | (s[12] ^ s[4] ^ s[0] ^ s[1] ^ s[2] ^ s[3]);
	assign en[24] = (s[5] ^ s[3]) | (s[6] ^ s[0] ^ s[4]) | (s[7] ^ s[1] ^ s[2] ^ s[4]) | (s[8] ^ s[1] ^ s[2]) | (s[9] ^ s[0] ^ s[1] ^ s[2]) | (s[10] ^ s[0] ^ s[1] ^ s[3] ^ s[4]) | (s[11] ^ s[0] ^ s[2] ^ s[3]) | (s[12] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4]);
	assign en[25] = (s[5] ^ s[3]) | (s[6] ^ s[4] ^ s[0]) | (s[7] ^ s[1] ^ s[2] ^ s[4]) | (s[8] ^ s[1] ^ s[2] ^ s[0]) | (s[9] ^ s[1] ^ s[2] ^ s[0]) | (s[10] ^ s[1] ^ s[3] ^ s[4] ^ s[0]) | (s[11] ^ s[2] ^ s[3]) | (s[12] ^ s[1] ^ s[2] ^ s[3] ^ s[4]);
	assign en[26] = (s[5] ^ s[3]) | (s[6] ^ s[4] ^ s[0] ^ s[1]) | (s[7] ^ s[2] ^ s[4]) | (s[8] ^ s[2] ^ s[0]) | (s[9] ^ s[2] ^ s[0] ^ s[1]) | (s[10] ^ s[3] ^ s[4] ^ s[0]) | (s[11] ^ s[2] ^ s[3] ^ s[1]) | (s[12] ^ s[2] ^ s[3] ^ s[4] ^ s[1]);
	assign en[27] = (s[5] ^ s[3]) | (s[6] ^ s[4] ^ s[0] ^ s[1]) | (s[7] ^ s[4] ^ s[2]) | (s[8] ^ s[0] ^ s[2]) | (s[9] ^ s[0] ^ s[1]) | (s[10] ^ s[3] ^ s[4] ^ s[0] ^ s[2]) | (s[11] ^ s[3] ^ s[1]) | (s[12] ^ s[3] ^ s[4] ^ s[1] ^ s[2]);
	assign en[28] = (s[5]) | (s[6] ^ s[4] ^ s[0] ^ s[1]) | (s[7] ^ s[4] ^ s[2] ^ s[3]) | (s[8] ^ s[0] ^ s[2]) | (s[9] ^ s[0] ^ s[1]) | (s[10] ^ s[4] ^ s[0] ^ s[2] ^ s[3]) | (s[11] ^ s[1] ^ s[3]) | (s[12] ^ s[4] ^ s[1] ^ s[2] ^ s[3]);
	assign en[29] = (s[5]) | (s[6] ^ s[0] ^ s[1]) | (s[7] ^ s[2] ^ s[3]) | (s[8] ^ s[0] ^ s[2]) | (s[9] ^ s[0] ^ s[1] ^ s[4]) | (s[10] ^ s[0] ^ s[2] ^ s[3] ^ s[4]) | (s[11] ^ s[1] ^ s[3] ^ s[4]) | (s[12] ^ s[1] ^ s[2] ^ s[3] ^ s[4]);
	assign en[30] = (s[5] ^ s[0]) | (s[6] ^ s[1] ^ s[0]) | (s[7] ^ s[2] ^ s[3]) | (s[8] ^ s[2]) | (s[9] ^ s[1] ^ s[4] ^ s[0]) | (s[10] ^ s[2] ^ s[3] ^ s[4]) | (s[11] ^ s[1] ^ s[3] ^ s[4]) | (s[12] ^ s[1] ^ s[2] ^ s[3] ^ s[4]);
	assign en[31] = (s[5] ^ s[0] ^ s[1]) | (s[6] ^ s[0] ^ s[1]) | (s[7] ^ s[2] ^ s[3]) | (s[8] ^ s[2]) | (s[9] ^ s[4] ^ s[0]) | (s[10] ^ s[2] ^ s[3] ^ s[4]) | (s[11] ^ s[3] ^ s[4] ^ s[1]) | (s[12] ^ s[2] ^ s[3] ^ s[4]);
	assign en[32] = (s[5] ^ s[0] ^ s[1] ^ s[2]) | (s[6] ^ s[0] ^ s[1]) | (s[7] ^ s[3] ^ s[2]) | (s[8] ^ s[2]) | (s[9] ^ s[4] ^ s[0]) | (s[10] ^ s[3] ^ s[4]) | (s[11] ^ s[3] ^ s[4] ^ s[1]) | (s[12] ^ s[3] ^ s[4]);
	assign en[33] = (s[5] ^ s[0] ^ s[1] ^ s[2] ^ s[3]) | (s[6] ^ s[0] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[2] ^ s[3]) | (s[9] ^ s[4] ^ s[0]) | (s[10] ^ s[4] ^ s[3]) | (s[11] ^ s[4] ^ s[1]) | (s[12] ^ s[4]);
	assign en[34] = (s[5] ^ s[0] ^ s[1] ^ s[2] ^ s[3] ^ s[4]) | (s[6] ^ s[0] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[2] ^ s[3] ^ s[4]) | (s[9] ^ s[0]) | (s[10] ^ s[3]) | (s[11] ^ s[1]) | (s[12] ^ s[4]);
	assign en[35] = (s[5] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[2] ^ s[3] ^ s[4]) | (s[9]) | (s[10] ^ s[3] ^ s[0]) | (s[11] ^ s[1]) | (s[12] ^ s[4] ^ s[0]);
	assign en[36] = (s[5] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[2] ^ s[1]) | (s[8] ^ s[2] ^ s[3] ^ s[4]) | (s[9]) | (s[10] ^ s[3] ^ s[0]) | (s[11] ^ s[1]) | (s[12] ^ s[4] ^ s[0]);
	assign en[37] = (s[5] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[1] ^ s[2]) | (s[7] ^ s[1]) | (s[8] ^ s[3] ^ s[4]) | (s[9] ^ s[2]) | (s[10] ^ s[3] ^ s[0]) | (s[11] ^ s[1] ^ s[2]) | (s[12] ^ s[4] ^ s[0]);
	assign en[38] = (s[5] ^ s[4] ^ s[0]) | (s[6] ^ s[1] ^ s[2] ^ s[3]) | (s[7] ^ s[1]) | (s[8] ^ s[4]) | (s[9] ^ s[2]) | (s[10] ^ s[0] ^ s[3]) | (s[11] ^ s[1] ^ s[2]) | (s[12] ^ s[4] ^ s[0] ^ s[3]);
	assign en[39] = (s[5] ^ s[0]) | (s[6] ^ s[1] ^ s[2] ^ s[3]) | (s[7] ^ s[1] ^ s[4]) | (s[8] ^ s[4]) | (s[9] ^ s[2]) | (s[10] ^ s[0] ^ s[3] ^ s[4]) | (s[11] ^ s[1] ^ s[2]) | (s[12] ^ s[0] ^ s[3]);
	assign en[40] = (s[5]) | (s[6] ^ s[1] ^ s[2] ^ s[3]) | (s[7] ^ s[1] ^ s[4] ^ s[0]) | (s[8] ^ s[4]) | (s[9] ^ s[2] ^ s[0]) | (s[10] ^ s[3] ^ s[4]) | (s[11] ^ s[1] ^ s[2] ^ s[0]) | (s[12] ^ s[3]);
	assign en[41] = (s[5]) | (s[6] ^ s[2] ^ s[3]) | (s[7] ^ s[4] ^ s[0] ^ s[1]) | (s[8] ^ s[4]) | (s[9] ^ s[2] ^ s[0]) | (s[10] ^ s[3] ^ s[4] ^ s[1]) | (s[11] ^ s[2] ^ s[0] ^ s[1]) | (s[12] ^ s[3]);
	assign en[42] = (s[5]) | (s[6] ^ s[3]) | (s[7] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[8] ^ s[4]) | (s[9] ^ s[0]) | (s[10] ^ s[3] ^ s[4] ^ s[1]) | (s[11] ^ s[0] ^ s[1] ^ s[2]) | (s[12] ^ s[3] ^ s[2]);
	assign en[43] = (s[5]) | (s[6]) | (s[7] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[8] ^ s[4] ^ s[3]) | (s[9] ^ s[0]) | (s[10] ^ s[4] ^ s[1] ^ s[3]) | (s[11] ^ s[0] ^ s[1] ^ s[2]) | (s[12] ^ s[2] ^ s[3]);
	assign en[44] = (s[5]) | (s[6]) | (s[7] ^ s[0] ^ s[1] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[0] ^ s[4]) | (s[10] ^ s[1] ^ s[3] ^ s[4]) | (s[11] ^ s[0] ^ s[1] ^ s[2] ^ s[4]) | (s[12] ^ s[2] ^ s[3]);
	assign en[45] = (s[5]) | (s[6]) | (s[7] ^ s[1] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[4] ^ s[0]) | (s[10] ^ s[1] ^ s[3] ^ s[4] ^ s[0]) | (s[11] ^ s[1] ^ s[2] ^ s[4]) | (s[12] ^ s[2] ^ s[3] ^ s[0]);
	assign en[46] = (s[5] ^ s[1]) | (s[6] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[4] ^ s[0]) | (s[10] ^ s[3] ^ s[4] ^ s[0]) | (s[11] ^ s[2] ^ s[4]) | (s[12] ^ s[2] ^ s[3] ^ s[0]);
	assign en[47] = (s[5] ^ s[1] ^ s[2]) | (s[6] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[4] ^ s[0]) | (s[10] ^ s[3] ^ s[4] ^ s[0]) | (s[11] ^ s[4]) | (s[12] ^ s[3] ^ s[0]);
	assign en[48] = (s[5] ^ s[1] ^ s[2] ^ s[3]) | (s[6] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[4] ^ s[0]) | (s[10] ^ s[4] ^ s[0]) | (s[11] ^ s[4]) | (s[12] ^ s[0]);
	assign en[49] = (s[5] ^ s[1] ^ s[2] ^ s[3] ^ s[4]) | (s[6] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[0] ^ s[4]) | (s[10] ^ s[0]) | (s[11]) | (s[12] ^ s[0]);
	assign en[50] = (s[5] ^ s[1] ^ s[2] ^ s[3] ^ s[4] ^ s[0]) | (s[6] ^ s[1]) | (s[7] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[4]) | (s[10] ^ s[0]) | (s[11]) | (s[12]);
	assign en[51] = (s[5] ^ s[2] ^ s[3] ^ s[4] ^ s[0] ^ s[1]) | (s[6]) | (s[7] ^ s[2]) | (s[8] ^ s[3]) | (s[9] ^ s[4]) | (s[10] ^ s[0]) | (s[11] ^ s[1]) | (s[12]);
	assign en[52] = (s[5] ^ s[3] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[6]) | (s[7]) | (s[8] ^ s[3]) | (s[9] ^ s[4]) | (s[10] ^ s[0]) | (s[11] ^ s[1]) | (s[12] ^ s[2]);
	assign en[53] = (s[5] ^ s[4] ^ s[0] ^ s[1] ^ s[2]) | (s[6] ^ s[3]) | (s[7]) | (s[8]) | (s[9] ^ s[4]) | (s[10] ^ s[0]) | (s[11] ^ s[1] ^ s[3]) | (s[12] ^ s[2]);
	assign en[54] = (s[5] ^ s[0] ^ s[1] ^ s[2]) | (s[6] ^ s[3]) | (s[7] ^ s[4]) | (s[8]) | (s[9]) | (s[10] ^ s[0]) | (s[11] ^ s[1] ^ s[3]) | (s[12] ^ s[2] ^ s[4]);
	assign en[55] = (s[5] ^ s[1] ^ s[2]) | (s[6] ^ s[3]) | (s[7] ^ s[4]) | (s[8] ^ s[0]) | (s[9]) | (s[10]) | (s[11] ^ s[1] ^ s[3]) | (s[12] ^ s[2] ^ s[4]);
	assign en[56] = (s[5] ^ s[2]) | (s[6] ^ s[3]) | (s[7] ^ s[4]) | (s[8] ^ s[0]) | (s[9] ^ s[1]) | (s[10]) | (s[11] ^ s[3]) | (s[12] ^ s[2] ^ s[4]);
	assign en[57] = (s[5]) | (s[6] ^ s[3]) | (s[7] ^ s[4]) | (s[8] ^ s[0]) | (s[9] ^ s[1]) | (s[10] ^ s[2]) | (s[11] ^ s[3]) | (s[12] ^ s[4]);
	assign en[58] = (s[5]) | (s[6]) | (s[7] ^ s[4]) | (s[8] ^ s[0]) | (s[9] ^ s[1]) | (s[10] ^ s[2]) | (s[11] ^ s[3]) | (s[12] ^ s[4]);
	assign en[59] = (s[5]) | (s[6]) | (s[7]) | (s[8] ^ s[0]) | (s[9] ^ s[1]) | (s[10] ^ s[2]) | (s[11] ^ s[3]) | (s[12] ^ s[4]);
	assign en[60] = (s[5]) | (s[6]) | (s[7]) | (s[8]) | (s[9] ^ s[1]) | (s[10] ^ s[2]) | (s[11] ^ s[3]) | (s[12] ^ s[4]);
	assign en[61] = (s[5]) | (s[6]) | (s[7]) | (s[8]) | (s[9]) | (s[10] ^ s[2]) | (s[11] ^ s[3]) | (s[12] ^ s[4]);
	assign en[62] = (s[5]) | (s[6]) | (s[7]) | (s[8]) | (s[9]) | (s[10]) | (s[11] ^ s[3]) | (s[12] ^ s[4]);
	assign en[63] = (s[5]) | (s[6]) | (s[7]) | (s[8]) | (s[9]) | (s[10]) | (s[11]) | (s[12] ^ s[4]);

	assign m[0] = ((~( en[0] )) & s[1]) ^ b[0];
	assign m[1] = ((~( en[1] & en[0] )) & s[2]) ^ b[1];
	assign m[2] = ((~( en[2] & en[1] & en[0] )) & s[3]) ^ b[2];
	assign m[3] = ((~( en[3] & en[2] & en[1] & en[0] )) & s[4]) ^ b[3];
	assign m[4] = ((~( en[4] & en[3] & en[2] & en[1] & en[0] )) & s[0]) ^ b[4];
	assign m[5] = ((~( en[5] & en[4] & en[3] & en[2] & en[1] )) & s[1]) ^ b[5];
	assign m[6] = ((~( en[6] & en[5] & en[4] & en[3] & en[2] )) & s[2]) ^ b[6];
	assign m[7] = ((~( en[7] & en[6] & en[5] & en[4] & en[3] )) & s[3]) ^ b[7];
	assign m[8] = ((~( en[8] & en[7] & en[6] & en[5] & en[4] )) & s[4]) ^ b[8];
	assign m[9] = ((~( en[9] & en[8] & en[7] & en[6] & en[5] )) & s[0]) ^ b[9];
	assign m[10] = ((~( en[10] & en[9] & en[8] & en[7] & en[6] )) & s[1]) ^ b[10];
	assign m[11] = ((~( en[11] & en[10] & en[9] & en[8] & en[7] )) & s[2]) ^ b[11];
	assign m[12] = ((~( en[12] & en[11] & en[10] & en[9] & en[8] )) & s[3]) ^ b[12];
	assign m[13] = ((~( en[13] & en[12] & en[11] & en[10] & en[9] )) & s[4]) ^ b[13];
	assign m[14] = ((~( en[14] & en[13] & en[12] & en[11] & en[10] )) & s[0]) ^ b[14];
	assign m[15] = ((~( en[15] & en[14] & en[13] & en[12] & en[11] )) & s[1]) ^ b[15];
	assign m[16] = ((~( en[16] & en[15] & en[14] & en[13] & en[12] )) & s[2]) ^ b[16];
	assign m[17] = ((~( en[17] & en[16] & en[15] & en[14] & en[13] )) & s[3]) ^ b[17];
	assign m[18] = ((~( en[18] & en[17] & en[16] & en[15] & en[14] )) & s[4]) ^ b[18];
	assign m[19] = ((~( en[19] & en[18] & en[17] & en[16] & en[15] )) & s[0]) ^ b[19];
	assign m[20] = ((~( en[20] & en[19] & en[18] & en[17] & en[16] )) & s[1]) ^ b[20];
	assign m[21] = ((~( en[21] & en[20] & en[19] & en[18] & en[17] )) & s[2]) ^ b[21];
	assign m[22] = ((~( en[22] & en[21] & en[20] & en[19] & en[18] )) & s[3]) ^ b[22];
	assign m[23] = ((~( en[23] & en[22] & en[21] & en[20] & en[19] )) & s[4]) ^ b[23];
	assign m[24] = ((~( en[24] & en[23] & en[22] & en[21] & en[20] )) & s[0]) ^ b[24];
	assign m[25] = ((~( en[25] & en[24] & en[23] & en[22] & en[21] )) & s[1]) ^ b[25];
	assign m[26] = ((~( en[26] & en[25] & en[24] & en[23] & en[22] )) & s[2]) ^ b[26];
	assign m[27] = ((~( en[27] & en[26] & en[25] & en[24] & en[23] )) & s[3]) ^ b[27];
	assign m[28] = ((~( en[28] & en[27] & en[26] & en[25] & en[24] )) & s[4]) ^ b[28];
	assign m[29] = ((~( en[29] & en[28] & en[27] & en[26] & en[25] )) & s[0]) ^ b[29];
	assign m[30] = ((~( en[30] & en[29] & en[28] & en[27] & en[26] )) & s[1]) ^ b[30];
	assign m[31] = ((~( en[31] & en[30] & en[29] & en[28] & en[27] )) & s[2]) ^ b[31];
	assign m[32] = ((~( en[32] & en[31] & en[30] & en[29] & en[28] )) & s[3]) ^ b[32];
	assign m[33] = ((~( en[33] & en[32] & en[31] & en[30] & en[29] )) & s[4]) ^ b[33];
	assign m[34] = ((~( en[34] & en[33] & en[32] & en[31] & en[30] )) & s[0]) ^ b[34];
	assign m[35] = ((~( en[35] & en[34] & en[33] & en[32] & en[31] )) & s[1]) ^ b[35];
	assign m[36] = ((~( en[36] & en[35] & en[34] & en[33] & en[32] )) & s[2]) ^ b[36];
	assign m[37] = ((~( en[37] & en[36] & en[35] & en[34] & en[33] )) & s[3]) ^ b[37];
	assign m[38] = ((~( en[38] & en[37] & en[36] & en[35] & en[34] )) & s[4]) ^ b[38];
	assign m[39] = ((~( en[39] & en[38] & en[37] & en[36] & en[35] )) & s[0]) ^ b[39];
	assign m[40] = ((~( en[40] & en[39] & en[38] & en[37] & en[36] )) & s[1]) ^ b[40];
	assign m[41] = ((~( en[41] & en[40] & en[39] & en[38] & en[37] )) & s[2]) ^ b[41];
	assign m[42] = ((~( en[42] & en[41] & en[40] & en[39] & en[38] )) & s[3]) ^ b[42];
	assign m[43] = ((~( en[43] & en[42] & en[41] & en[40] & en[39] )) & s[4]) ^ b[43];
	assign m[44] = ((~( en[44] & en[43] & en[42] & en[41] & en[40] )) & s[0]) ^ b[44];
	assign m[45] = ((~( en[45] & en[44] & en[43] & en[42] & en[41] )) & s[1]) ^ b[45];
	assign m[46] = ((~( en[46] & en[45] & en[44] & en[43] & en[42] )) & s[2]) ^ b[46];
	assign m[47] = ((~( en[47] & en[46] & en[45] & en[44] & en[43] )) & s[3]) ^ b[47];
	assign m[48] = ((~( en[48] & en[47] & en[46] & en[45] & en[44] )) & s[4]) ^ b[48];
	assign m[49] = ((~( en[49] & en[48] & en[47] & en[46] & en[45] )) & s[0]) ^ b[49];
	assign m[50] = ((~( en[50] & en[49] & en[48] & en[47] & en[46] )) & s[1]) ^ b[50];
	assign m[51] = ((~( en[51] & en[50] & en[49] & en[48] & en[47] )) & s[2]) ^ b[51];
	assign m[52] = ((~( en[52] & en[51] & en[50] & en[49] & en[48] )) & s[3]) ^ b[52];
	assign m[53] = ((~( en[53] & en[52] & en[51] & en[50] & en[49] )) & s[4]) ^ b[53];
	assign m[54] = ((~( en[54] & en[53] & en[52] & en[51] & en[50] )) & s[0]) ^ b[54];
	assign m[55] = ((~( en[55] & en[54] & en[53] & en[52] & en[51] )) & s[1]) ^ b[55];
	assign m[56] = ((~( en[56] & en[55] & en[54] & en[53] & en[52] )) & s[2]) ^ b[56];
	assign m[57] = ((~( en[57] & en[56] & en[55] & en[54] & en[53] )) & s[3]) ^ b[57];
	assign m[58] = ((~( en[58] & en[57] & en[56] & en[55] & en[54] )) & s[4]) ^ b[58];
	assign m[59] = ((~( en[59] & en[58] & en[57] & en[56] & en[55] )) & s[0]) ^ b[59];
	assign m[60] = ((~( en[60] & en[59] & en[58] & en[57] & en[56] )) & s[1]) ^ b[60];
	assign m[61] = ((~( en[61] & en[60] & en[59] & en[58] & en[57] )) & s[2]) ^ b[61];
	assign m[62] = ((~( en[62] & en[61] & en[60] & en[59] & en[58] )) & s[3]) ^ b[62];
	assign m[63] = ((~( en[63] & en[62] & en[61] & en[60] & en[59] )) & s[4]) ^ b[63];

endmodule