;Rossetti Jacopo
;3INA
;09/02/2021

TITLE ciclo while do 
.MODEL SMALL    
    
.DATA 
   NUMERI DB 5Ah,59h,58h,57h,56h,55h,54h,53h,52h,51h,50h,4Fh,4Eh,4Dh,4Ch,4Bh,4Ah,49h,48h,47h,46h,45h,44h,43h,42h,41h,61h,62h,64h,65h,63h,69h,6Ah,66h,67h,68h,6Bh,6Ch,6Dh,6Eh,6Fh,73h,72h,71h,70h,74h,75h,77h,76h,79h,78h,7Ah,'$'
   TEMP   DB ?
.CODE                                                                                                
.STARTUP
    LEA SI,NUMERI       
    LEA DI,NUMERI
INIZIO:
     
    MOV AL,[SI]
    CMP AL,'$'
    JE RESET2
    JMP ORDINE
ORDINE:
    MOV BL,[DI]
    CMP BL,'$'
    JE RESET1
    CMP BL,AL
    JA MAGGIORE
    INC DI
    JMP ORDINE
MAGGIORE:
    MOV BL,[DI]
    MOV AL,[SI]
    MOV [DI],AL
    MOV [SI],BL
    INC DI
    JMP ORDINE         
       
RESET1:
    INC SI
    MOV DI,0
    JMP INIZIO
RESET2:
    MOV SI,0
    MOV DI,0
    JMP PRINT
PRINT:
    MOV DL,[SI]
    CMP DL,'$'
    JE FINE
    MOV AH,02h
    INT 21h
    INC SI
    JMP PRINT
      
FINE:
; exit to operating system. 
    mov AH, 4ch     ; numero del servizio  
    INT 21h         ; interruzione SW di MSDOS
END

