INTERRUPCION EN ETAPAS DE LW_INC
COMPROBAR DETENCION POR DEPENDENCIAS CON INSTRUCCIONENS RET
COMPROBAR SW
comprobar RTE

Reset: beq R1, R1, INI; ;
IRQ  : beq R1, R1, RTI;
DAbort: beq R1, R2, RTI;
UNDEF: beq R1, R1, RT_UNDEF

INI: LW R3, 20(r0)
     SW R3, 24(r0) 
     ADD R4, R3, R3      ;@ DIR, Se comprueba que sw no puede generar detención ya que
                         ;       no es productor sobre r3 
     RET R4              ;     , Se Comprueba detención con ret por dependencia con R4
     NOP
     NOP
     LW_INC R2, 0(R4)   ; Llega interrupción de IRQ en el primer ciclo en memoria
     SW   R2, 0(r4)     ;
     beq r0, r0, -1     ;

RTI   LW R3, 28(r0)     ;
      SW r3, 0x7008(r0) ;  INT_ACK <= 1
      NOP
      RTE
RT_abort: 
BEQ r0, r0, #-1; 
RT_undef: 
BEQ r0, r0, #-1;     
