lw_inc r1,20(r0)	# Queremos probar la interacción con 2 lw_inc sobre el mismo registro y dirección
lw_inc r1,20(r0)	# de memoria para ver que la memoria se actualiza correctamente a la vez que el registro r1.
add r1,r1,r1		# A su vez nos permite asegurarnos de que anticipamos el valor del segundo lw_inc.
sw r1,28(r0)		## Con estas instrucciones vamos a probar que el add que tiene '##' a la derecha no intenta
add r2,r1,r2		## anticipar el sw pero sí que intenta anticipar el valor del add r1,r1,r1 de más arriba.
add r3,r2,r1		### Probamos la anticipacion a distancia 1 Rs.
sw r2,24(r0)		### Probamos anticipacion a distancia 2 de Rs.
beq r3,r1,5			#### Buscamos ver si se detiene o no correctamente con un escritor a distancia 2.
sub r3,r3,r1		##### Buscamos probar en la instrucción add r3,r2,r3
add r3,r2,r3		##### la correcta anticipacion de Rt a distancia 1.
beq r0,r0,2			###### Ver el funcionamiento de un BEQ que va a saltar
NOP					####### Relleno
NOP					####### Relleno
beq r0,r0,#-1		####### Relleno

010000 00000 00001 0000 0000 0001 0100 lw_inc r1,20(r0)
0x40010014
010000 00000 00001 0000 0000 0001 0100 lw_inc r1,20(r0)
0x40010014
000001 00001 00001 00001 000000 00000 add r1,r1,r1
0x04210800
000011 00000 00001 0000 0000 0001 1100 sw r1,28(r0)
0x0C01001C
000001 00010 00001 00010 000000 00000 add r2,r1,r2
0x04411000
000001 00001 00010 00011 000000 00000 add r3,r2,r1
0x04221800
000011 00000 00011 0000 0000 0001 1000 sw r2,24(r0)
0x0C030018
000100 00001 00011 0000 0000 0000 0101 beq r3,r1,#5
0x10230005
000001 00011 00001 00011 000000 00001 sub r3,r1,r3
0x04231801
000001 00010 00011 00011 000000 00000 add r3,r3,r2
0x04431800
000100 00000 00000 0000 0000 0000 0010 beq r0,r0,FIN (#2)
0x10000002
0000 0000 0000 0000 0000 0000 0000 0000 NOP
0x00000000
0000 0000 0000 0000 0000 0000 0000 0000 NOP
0x00000000
000100 00000 00000 1111 1111 1111 1111 beq r0,r0,-1
0x1000FFFF