; output Fibonacci numbers
; from "Programming Fibonacci on a breadboard computer BugFixed", https://www.youtube.com/watch?v=a73ZXDJtU48
; init:
0:  LDI 1   ; y=1
1:  STA 14  ; y => ram[14]
2:  LDI  0  ; A=0
; loop:
3:  STA 15  ; A => x
4:  OUT
5:  LDA 14  ; A <= y 
6:  ADD 15  ; A += x
7:  STA 14  ; y <= A
8:  OUT
9:  LDA 15  ; A <= x
10: ADD 14  ; A += y 
11: JC   0  ; if overflows then init
12: JMP  3  ; otherwise loop
; vars:
;14: y
;15: x