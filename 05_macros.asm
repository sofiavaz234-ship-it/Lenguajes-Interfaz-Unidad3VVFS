; Materia: Lenguajes de Interfaz
; Alumna: Frida Sofia Vega Vazquez
; Horario: 8 a 9 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 05 - Macros 
;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INCLUDE Irvine32.inc                 

MostrarMensaje MACRO texto            ;definimos la macro MostrarMensaje que recibe como parametro el nombre de una cadena
	mov edx, OFFSET texto             ;cargamos en edx la direccion de memoria del texto que se paso como parametro
	call WriteString                  ;imprimimos el texto en pantalla
	call Crlf                         ;hacemos un salto de linea
ENDM                                  ;marca el fin de la macro MostrarMensaje

CalcularImporte MACRO precio, cantidad ;definimos la macro CalcularImporte que recibe dos parametros: precio y cantidad
	mov eax, precio                    ;movemos el valor del precio al registro eax
	imul eax, cantidad                ;multiplicamos con signo el valor de eax por la cantidad y el resultado queda en eax
ENDM                                  ;marca el fin de la macro CalcularImporte

.data                                 ;seccion de datos donde declaramos nuestros mensajes
	MensajeInicio BYTE "Bienvenido a tu salon favorito", 0 ;cadena inicial, el 0 indica el fin del texto
	MensajeFin BYTE "Nos vemos, vuelva pronto", 0          ;cadena de despedida, tambien terminada en 0

.code                                 ;seccion donde empieza el codigo
main PROC                             ;inicio del procedimiento principal
	MostrarMensaje MensajeInicio      ;invocamos la macro pasandole MensajeInicio (aqui se insertan sus instrucciones)
	MostrarMensaje MensajeFin         ;volvemos a usar la macro, ahora con MensajeFin para imprimir la despedida

	CalcularImporte 25, 3             ;llamamos a la macro pasandole 25 como precio y 3 como cantidad (25 * 3 = 75 en eax)
	call WriteInt                     ;imprime en pantalla el numero entero con signo que quedo guardado en eax (+75)
	call Crlf                         ;hace un salto de linea

	exit                              ;cierra y termina la ejecucion del programa
main ENDP                             ;fin del procedimiento principal

END main                              ;marca el final de todo el programa