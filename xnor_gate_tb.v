`timescale 1ns/1ps
module xnor_gate_tb;
	reg a,b;
	wire y;
	integer f;
	
	xnor_gate uut(
	.a(a),
	.b(b),
	.y(y)
	);

	initial begin
		$dumpfile("xnor_gate.vcd");
		$dumpvars(0,xnor_gate_tb);
		
		f=$fopen("monitor_log.txt","w");
		if(!f) begin
			$display("Failed to open file.");
			$finish;
		end
		
		$display("File opened");
		
		a=0;b=0;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0t ns\n",a,b,y,$time);
		a=0;b=1;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0t ns\n",a,b,y,$time);
		a=1;b=0;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0t ns\n",a,b,y,$time);
		a=1;b=1;#10;
		$fwrite(f,"a=%b, b=%b, y=%b @ %0t ns\n",a,b,y,$time);
		
		$fclose(f);
		$display("Simulation done.");
		$finish;
	end
endmodule