; Materia: Lenguajes de Interfaz
; Alumna: Frida Sofia Vega Vazquez
; Horario: 8 a 9 am
; Docente: Dr. José Luis Medina Jiménez
; Práctica: 03 - Validar Cadena No Vacía
;------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
INCLUDE Irvine32.inc                  

.data                                 ;declaramos variables y mensajes
    cadena      BYTE 10 DUP(?)        ;reserva 10 bytes sin inicializar en memoria para guardar lo que escriba el usuario
    msg1        BYTE "Ingrese una cadena: ", 0              ;mensaje inicial, el 0 indica el fin de la cadena
    msgValida   BYTE "La cadena es valida.", 0              ;mensaje si el usuario escribio al menos un caracter
    msgInvalida BYTE "Entrada invalida (cadena vacia).", 0  ;mensaje si el usuario solo presiono Enter

.code                                 ;inicio de la seccion de instrucciones
main PROC                             ;procedimiento principal
   
    mov edx, OFFSET msg1              ;guarda en edx la direccion de memoria de msg1
    call WriteString                  ;imprime en consola el mensaje pidiendo la cadena

    mov edx, OFFSET cadena            ;apunta edx al buffer donde se guardara lo que se lea
    mov ecx, SIZEOF cadena            ;indica en ecx el limite maximo de bytes a leer (10)
    call ReadString                   ;lee el teclado y deja en eax la cantidad real de caracteres escritos

    mov ecx, eax                      ;copiamos el total de caracteres de eax hacia ecx para enviarlo al procedimiento

    call ValidarNoVacia               ;guarda la direccion de retorno en la pila y salta a ValidarNoVacia


    test eax, eax                     ;hace un AND logico de eax consigo mismo para checar si es cero sin alterar su valor
    jz entradaInvalida                ;si la bandera de cero se activa, salta a entradaInvalida

    
    mov edx, OFFSET msgValida         ;carga la direccion del mensaje de cadena valida
    call WriteString                  ;muestra el mensaje en pantalla
    call Crlf                         ;hace un salto de linea
    jmp fin                           ;salta directo al final para no ejecutar el bloque de error

entradaInvalida:                      ;etiqueta a la que se llega cuando eax es 0
    mov edx, OFFSET msgInvalida       ;carga en edx el mensaje de error
    call WriteString                  ;muestra el mensaje de entrada invalida
    call Crlf                         ;hace un salto de linea

fin:                                  ;etiqueta de cierre
    exit                              ;termina el programa y devuelve el control al sistema operativo
main ENDP                             ;fin del procedimiento principal

ValidarNoVacia PROC                   ;procedimiento que recibe en ecx el numero de caracteres
    cmp ecx, 0                        ;compara la longitud de la cadena contra 0
    jg  esValida                      ;si ecx es mayor que 0, salta a esValida

    mov eax, 0                        ;si ecx es 0, pone 0 en eax para indicar que la cadena esta vacia
    ret                               ;regresa a main donde se quedo

esValida:                             ;etiqueta cuando la cadena tiene uno o mas caracteres
    mov eax, 1                        ;pone 1 en eax para indicar que la entrada es valida
    ret                               ;regresa a main con el resultado en eax
ValidarNoVacia ENDP                   ;fin del procedimiento ValidarNoVacia

END main                              ;fin de todo el programa