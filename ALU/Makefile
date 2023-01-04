test : alu.vhd adder.vhd subtractor.vhd tb_alu.vhd
	nvc -a adder.vhd subtractor.vhd alu.vhd tb_alu.vhd
	nvc -e tb_alu
	nvc -r tb_alu
