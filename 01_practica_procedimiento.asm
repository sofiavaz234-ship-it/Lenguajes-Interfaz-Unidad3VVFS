; Materia: Lenguajes de Interfaz
; Alumna: Frida Sofia Vega Vazquez
; Horario: 8 a 9 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: Práctica Procedimiento
;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INCLUDE Irvine32.inc                 

.data                                 ;seccion de datos donde declaramos nuestros mensajes
	MensajeInicio BYTE "Inicio Programa", 0                        ;cadena inicial, el 0 indica el fin del texto
	MensajeProcedimiento BYTE "Estoy dentro del procedimiento", 0  ;mensaje que se imprime dentro del procedimiento
	MensajeFin BYTE "Fin del programa", 0                          ;cadena final del programa

.code                                 ;seccion donde empieza el codigo
main PROC                             ;inicio del procedimiento principal
	mov edx, OFFSET MensajeInicio     ;guardamos en edx la direccion de memoria de MensajeInicio
	call WriteString                  ;muestra en pantalla la cadena a la que apunta edx
	call crlf                         ;hace un salto de linea

	mov eax, 10                       ;movemos el numero 10 al registro eax

	;PRIMER LLAMADO
	call MostrarAviso                 ;guarda en la pila la direccion de regreso y salta a MostrarAviso
	mov eax, 20                       ;cuando regresa del procedimiento, cambia el valor de eax a 20

	;SEGUNDO LLAMADO
	call MostrarAviso                 ;vuelve a llamar al mismo procedimiento para reutilizarlo
	mov eax, 30                       ;al regresar por segunda vez, asigna 30 a eax

	mov edx, OFFSET MensajeFin        ;guardamos en edx la direccion de memoria de MensajeFin
	call WriteString                  ;imprime el mensaje final en consola
	call crlf                         ;hace otro salto de linea

	exit                              ;cierra y termina la ejecucion del programa
main ENDP                             ;fin del procedimiento principal

MostrarAviso PROC                     ;inicio del procedimiento secundario MostrarAviso
	mov edx, OFFSET MensajeProcedimiento ;cargamos en edx la direccion de MensajeProcedimiento
	call WriteString                  ;imprime el mensaje en pantalla
	call crlf                         ;hace un salto de linea
	ret                               ;saca de la pila la direccion guardada y regresa a main donde nos quedamos
MostrarAviso ENDP                     ;fin del procedimiento MostrarAviso

END main                              ;marca el final de todo el programa