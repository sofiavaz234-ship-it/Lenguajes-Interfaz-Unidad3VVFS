; Materia: Lenguajes de Interfaz
; Alumna: Frida Sofia Vega Vazquez
; Horario: 8 a 9 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Ingreso de datos ReadString
;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INCLUDE Irvine32.inc                 
.data                                 ;seccion de datos donde declaramos mensajes y variables
	mensajeEntrada BYTE "Escribe tu nombre: ", 0              ;mensaje para pedir el nombre, el 0 marca el fin de la cadena
	caracteresEscritos BYTE "Numero de caracteres: ", 0       ;mensaje para mostrar el conteo de letras
	nombre BYTE 20 DUP(0)                                     ;reserva un buffer de 20 bytes llenos de ceros para guardar el texto

.code                                 ;seccion donde empieza el codigo
main PROC                             ;inicio del procedimiento principal
	mov edx, OFFSET mensajeEntrada    ;cargamos en edx la direccion de memoria del mensaje de entrada
	call WriteString                  ;imprimimos "Escribe tu nombre: " en pantalla

	mov edx, OFFSET nombre            ;apuntamos edx al buffer donde se va a guardar lo que escriba el usuario
	mov ecx, SIZEOF nombre            ;le pasamos a ecx el tamaño maximo del buffer (20 bytes) para evitar que se desborde
	call ReadString                   ;lee el texto del teclado, lo guarda en nombre y devuelve en eax cuantos caracteres se escribieron
	call Crlf                         ;hace un salto de linea

	mov edx, OFFSET nombre            ;cargamos en edx la direccion del buffer nombre ya con el texto guardado
	call WriteString                  ;muestra en pantalla el nombre que capturamos
	call Crlf                         ;hace otro salto de linea

	mov edx, OFFSET caracteresEscritos ;cargamos en edx la direccion del mensaje de conteo
	call WriteString                  ;imprimimos "Numero de caracteres: " en pantalla
	call WriteDec                     ;imprime el numero entero que quedo guardado en eax (la cantidad de caracteres leidos)

	exit                              ;cierra y termina la ejecucion del programa
main ENDP                             ;fin del procedimiento principal

END main                              ;marca el final de todo el programa