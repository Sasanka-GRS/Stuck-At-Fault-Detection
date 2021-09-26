module ckt(x1,x2,x3,x4,x5,x6,w1_in,w2_in,a_in,b_in,w1_check,w2_check,a_check,b_check,y);
    
    input x1,x2,x3,x4,x5,x6,w1_in,w2_in,a_in,b_in,w1_check,w2_check,a_check,b_check;
    output reg y;

    wire a,b,w1,c,d,e;

    always @ (*)
    begin
        if(w2_check)
        begin
            //stuck-at-fault at w2
            y = w2_in;
        end
        else if(w1_check)
        begin
            //stuck-at-fault at w1
            y = ~(w1_in & ~(~(x3 & x4) & x6));
        end
        else if(a_check)
        begin
            //stuck-at-fault at a
            y = ~(~(a_in & ~(~(x3 & x4) & x5)) & ~(~(x3 & x4) & x6));
        end
        else if(b_check)
        begin
            //stuck-at-fault at b
            y = ~(~(~(x1 & ~(x2 & ~(x3 & x4))) & b_in) & ~(~(x3 & x4) & x6));
        end
        else
        begin
            //no stuck-at-faults (ideal circuit)
            y = ~(~(~(x1 & ~(x2 & ~(x3 & x4))) & ~(~(x3 & x4) & x5)) & ~(~(x3 & x4) & x6));
        end
    end

endmodule