; Materia: Lenguajes de Interfaz
; Alumna: Frida Sofia Vega Vazquez
; Horario: 8 a 9 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 04 - Manejo de Pila Manual
;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INCLUDE Irvine32.inc                 
.code                                 
main PROC                             ;inicio del procedimiento principal
	mov ebx, 999                      ;guardamos 999 en ebx para comprobar al final que el procedimiento no lo borra

	push 3                            ;metemos el segundo parametro (3) a la pila (ocupa 4 bytes)
	push 25                           ;metemos el primer parametro (25) a la pila (ocupa 4 bytes)

	call SumarPila                    ;guarda en la pila la direccion de regreso y salta a SumarPila
	nop                               ;punto de regreso del call 
	exit                              ;termina el programa y devuelve el control al sistema operativo
main ENDP                             ;fin del procedimiento principal

SumarPila PROC                        ;inicio del procedimiento que recibe parametros por pila
	push ebp                          ;respalda en la pila el valor anterior del puntero base ebp
	mov ebp, esp                      ;fija ebp en la posicion actual de esp para crear nuestro marco de pila

	push ebx                          ;guarda el 999 de ebx en la pila para poder usar ebx sin perder su valor original

	mov eax, [ebp+8]                  ;lee el primer parametro (25); +0 es el ebp viejo y +4 es la direccion de retorno
	mov ebx, [ebp+12]                 ;lee el segundo parametro (3) que quedo 4 bytes mas arriba en la pila

	imul eax, ebx                     ;multiplica eax por ebx (25 * 3 = 75) y deja el resultado en eax

	pop ebx                           ;recupera de la pila el 999 original y lo devuelve a ebx
	pop ebp                           ;restaura el valor original de ebp antes de salir

	ret 8                             ;regresa a main y ademas limpia los 8 bytes de los dos parametros (25 y 3) de la pila
SumarPila ENDP                        ;fin del procedimiento SumarPila

END main                              ;fin de todo el programa