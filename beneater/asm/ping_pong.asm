0: LDI 1 ; init A to 1
1: OUT
2: SLL
3: OUT
4: JC 6 ;while no overflow
5: JMP 1 ; no overflow can continue
6: OUT
7: SRL
8: OUT
9: JZ 0; on underflow init
10: JMP 6; otherwise we can continue SRLs