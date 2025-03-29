# Programa simple de la práctica 3
# no buscamos forzar ninguna situación específica pero nos sirve
# para comprobar el funcionamiento de JAL, RET.
beq r0,r0,inicio
beq r0,r0,fin
beq r0,r0,fin
beq r0,r0,fin
lw r1,24(r0)		# Cargar inicio
lw r2,28(r0)		# Cargar incrementador
lw r3,32(r0)		# Cargar fin de iteraciones.
jal r7, 2			# Irme a saber donde.
sw r5,20(r0)		# Guardar valores.
beq r0,r0,-1 		# Está linea es el fin.
beq r1,r3, 4 		# Carga	r valores.
lw r6,0(r1)			# Cargar dato de @memoria.
add r1,r1,r2		# Sumar a la @mememoria
add r5,r5,r6		# Sumatorio.
beq r0,r0, 7		# Volver arriba.
ret r7				# Ir a FIN.

000100 00000 00000 0000 0000 0000 0011 beq r0,r0,INICIO (#3)
0x10000003
000100 00000 00000 0000 0000 0000 0111 beq r0,r0,FIN (#7)
0x10000007
000100 00000 00000 0000 0000 0000 0110 beq r0,r0,FIN (#6)
0x10000006
000100 00000 00000 0000 0000 0000 0101 beq r0,r0,FIN (#5)
0x10000005
000010 00000 00001 0000 0000 0001 1000 lw r1,24(r0) #INICIO	
0x08010018	
000010 00000 00010 0000 0000 0001 1100 lw r2,28(r0)		
0x0802001C
000010 00000 00011 0000 0000 0010 0000 lw r3,32(r0)
0x08030020
000101 00000 00111 0000 0000 0000 0010 jal r7,2
0x14070002
000011 00000 00101 0000 0000 0001 0100 sw r5,20(r0)
0x0C050014
000100 00000 00000 1111 1111 1111 1111 beq r0,r0,-1
0x1000FFFF
000100 00001 00011 0000 0000 0000 0100 beq r1,r3,4
0x10230004
000010 00001 00110 0000 0000 0000 0000 lw r6,0(r1)
0x08260000
000001 00001 00010 00001 000000  00000 add r1,r1,r2
0x04220800
000001 00101 00110 00101 000000  00000 add r5,r5,r6
0x04A62800
000100 00000 00000 1111 1111 1111 1011 beq r0,r0,-5
0x1000FFFB
000110 00111 00111 0000 0000 0000 0000 ret r7
0x18E70000
0x20000000