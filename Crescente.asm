;Rossetti Jacopo
;3INA
;15/12/2020

TITLE ciclo while do 
.MODEL SMALL    
    
.DATA 
   NUMERI DB 64h,63h,62h,61h,65h,66h,67h,68h,69h,6Ah,'$'
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
    JB MINORE
    INC DI
    JMP ORDINE
MINORE:
    MOV BL,[DI]
    MOV AL,[SI]
    MOV [DI],AL
    MOV [SI],BL
    INC DI
    JMP ORDINE         
       
RESET1:
    INC SI
    MOV DI,SI
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

