0: LDI 1  ; init to 1
1: OUT
2: SLL
3: OUT
4: JC 6   ; while no overflow << 1
5: JMP 1  ; on overflow change the sens
6: OUT
7: SRL
8: OUT
9: JZ 0   ; while no underflow >> 1 
10: JMP 6 ; on undeflow, init to 1