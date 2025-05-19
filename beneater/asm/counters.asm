; tests the conditional jump instructions JC and JZ
; from "Conditional jump instructions", https://www.youtube.com/watch?v=Zg1NdPKoosU
0: OUT
1: ADD 15
2: JZ 4
3: JC 5
4: JMP 0
5: SUB 15
6: OUT
7: JZ 0
8: JC 9
9: JMP 5
15: 20 ; increase the step from 1 to 7
