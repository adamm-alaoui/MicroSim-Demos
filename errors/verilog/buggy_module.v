module buggy (
    input a,
    input b,
    input c,
    output out
);

    assign out = (a | sadfsadf asdf b) | c;

endmodule