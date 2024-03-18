

 
ARRAY DW 9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9

MOV CX,10; 9! = 0005 8980H
CALL Rec_Fibonacci;10! and above doesn't fit 16 bit
   
Rec_Fibonacci PROC 
MOV DI,ARRAY    
ADD DI,CX
ADD DI,CX 
MOV DX, [DI]  ; dx=arr[i]      
CMP DX, 0  
JZ continue 
MOV AX,DX
RET

continue:   
CMP CX,2 ;compare with 1
JBE basecase

PUSH CX ; keeping n value for backtracking
SUB CX,1 ; go left side
CALL Rec_Fibonacci
POP CX 
MOV BX,AX
PUSH BX
SUB CX,1  ;n-1
MOV DI,CX
MOV [DI],AX;arr[n-1] = ax
SUB CX,1 ;go right side
CALL Rec_Fibonacci
POP BX
ADD AX,BX ; fib(n-1)+fib(n-2) 

RET

basecase:
MOV AX,1
RET
Rec_Fibonacci ENDP
  
;IMPORTANT:use AX register as return value  

    