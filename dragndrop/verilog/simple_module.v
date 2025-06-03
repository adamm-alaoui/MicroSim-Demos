module simple_logic (
    input a,
    input b,
    input c,
    output out
);

    assign out = (a | b) | c;

endmodule
