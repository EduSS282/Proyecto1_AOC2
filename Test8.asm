lw r1, 20(r0)
add r1,r1,r2
ret r1
nop				# Instrucción irrelevante (Va a ser invalidada)
nop				## {/*
add r0,r0,r0	## { * Con estas 3 instrucciones pretendemos probar que la nop no afecta a la anticipación
nop				## { */
jal r30, 0		###	[	/* Probamos 2 jal seguidos, de manera que debería invalidar el segundo jal para luego saltar 
jal r30, 2		### [	 * a ese mismo jal invalidado antes
nop				### [	*/
nop
add r1,r1,r1
jal r30, 1		# Con estas tres instrucciones queremos poner a prueba la anticipación e invalidación.
add r30,r30,r30 # El segundo ADD debería detectar 2 anticipaciones, pero una de ellas es inválida
add r30,r30,r30 # debido a que el JAL invalida el primer ADD.
beq r30,r30, 2	## Aquí queremos probar la detención por dependencia en Rt y Rs.
nop				### Relleno
nop				### Relleno
add r2,r2,r2	#### Con estas instrucciones buscamos probar la doble anticipación
add r1,r1,r1	#### para el último ADD de tanto Rs como Rt.
add r3,r1,r2	#### Y a su vez la detención de BEQ por dependecia a distancia 1.
beq r3,r1,-1 	#### Con los datos puestos en memoria de datos, debería de invalidar 
beq r0,r0,-1	#### el segundo beq y hacer un bucle infinito en el primero.