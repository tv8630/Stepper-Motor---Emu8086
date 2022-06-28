#start=stepper_motor.exe#
jmp start

datcw    db 0000_0011b
         db 0000_0110b
         db 0000_1100b
         db 0000_1001b
         
start: mov bx,offset datcw
       mov si,0

next_step: 
     wait: in al,07h
           test al,10000000b
           jz wait
           mov al,[bx][si]
           out 7,al
           inc si
           cmp si,4
           jc next_step
           mov si,0
           jmp next_step              