INCLUDE MACROS.LIB
.286
.MODEL SMALL
.STACK 64
.DATA
    L1 DB 'IGUALES','$'
    L2 DB 'DIFERENTES','$'
    CAD1 DB 50 DUP (?),'$'
    TAM1 DW (0)
    CAD2 DB 50 DUP (?),'$'
    TAM2 DW (0)
    LN DB 0AH,0DH,'$'
.CODE
MAIN PROC FAR
    ;EN ESTA CLASE VIMOS CMP DE CADENA
    ;CMPSB, COMPSW
    MOV AX, @DATA  
    MOV DS,AX
    MOV ES,AX
    
    READ_S CAD1
    READ_S CAD2
    
    WRITE LN
    WRITE CAD1
    WRITE LN
    WRITE CAD2
    
    WRITE LN
    WRITE LN
    
    
    ; ORIGEN  SI
    ; DESTINO DI
    CLD
    MOV SI, OFFSET CAD1
    MOV DI, OFFSET CAD2
    REPE CMPSB
    
    JNE DIFE
    WRITE L1
    JMP FIN
    DIFE:
    WRITE L2
    FIN:
    .EXIT
        
MAIN ENDP
END MAIN