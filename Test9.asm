# Programa para mostrar anticipación, explicada en memoria.
lw r1,20(r0)	#
add r2,r2,r1	# Bloqueo y anticipo de r1 con lw
add r3,r2,r1	# Anticipación de r1 con lw a distancia 2 y r2 con add r2,r2,r1 a distancia 1.
add r4,r2,r5	# Anticipacion de r2 con add r2,r2,r1 a distancia 2.
add r5,r3,r4	# Anticipacion de r3 con add r3,r2,r1 a distancia 2 y anticipación de r4 con add r4,r2,r5 a distancia 1.