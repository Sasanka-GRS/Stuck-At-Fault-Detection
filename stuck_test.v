module test();

    reg x1,x2,x3,x4,x5,x6,w1_in,w2_in,a_in,b_in,w1_check,w2_check,a_check,b_check;
    wire y;

    ckt uut(.x1(x1),.x2(x2),.x3(x3),.x4(x4),.x5(x5),.x6(x6),.w1_in(w1_in),.w2_in(w2_in),.a_in(a_in),.b_in(b_in),.w1_check(w1_check),.w2_check(w2_check),.a_check(a_check),.b_check(b_check),.y(y));

    initial begin
		$dumpfile("ckt.vcd");
     	$dumpvars(0,test);
		// Initialize Inputs
		x1 = 1'b0;
		x2 = 1'b0;
        x3 = 1'b0;
        x4 = 1'b0;
        x5 = 1'b0;
        x6 = 1'b0;
        //Change the below 4 values to 1 to force a stuck-at-fault at that location
        w1_check = 1'b0;
        w2_check = 1'b0;
        a_check = 1'b0;
        b_check = 1'b0;
        //The stuck-at-value at the given point (works only if the check register is set to 1)
        w1_in = 1'b0;
        w2_in = 1'b0;
        a_in = 1'b0;
        b_in = 1'b0;

		#320 $finish;//global reset
	end

    //Generating all possible 64 combinations
	always #5 x6=~x6;
	always #10 x5=~x5;
    always #20 x4=~x4;
    always #40 x3=~x3;
    always #80 x2=~x2;
    always #160 x1=~x1;

    //printing values for each new test vector
	always #5
    $display("%b",y);

endmodule