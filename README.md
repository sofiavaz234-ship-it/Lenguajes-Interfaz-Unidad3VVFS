# Prácticas Unidad 3 - Lenguajes de Interfaz

* **Alumna:** Frida Sofia Vega Vazquez
* **Materia:** Lenguajes de Interfaz (8:00 a 9:00 am)
* **Docente:** Dr. José Luis Medina Jiménez

---

## 1. Práctica Procedimiento (`01_practica_procedimiento.asm`)

* **¿Qué hace el programa?**
  Implementa y demuestra el uso de subrutinas personalizadas en lenguaje ensamblador x86 mediante las instrucciones `CALL` y `RET`. El procedimiento principal (`main`) imprime un mensaje de inicio, asigna valores secuenciales al registro `EAX` (`10`, `20`, `30`) e invoca en dos ocasiones al procedimiento reutilizable `MostrarAviso` antes de finalizar la ejecución.

* **¿Qué se comprobó al ejecutarlo?**
  Se verificó el flujo de control de la pila: cada instrucción `CALL` transfiere la ejecución al procedimiento `MostrarAviso` y `RET` regresa exactamente a la instrucción inmediata posterior en `main` (permitiendo la asignación consecutiva de `EAX = 20` y `EAX = 30`) sin perder la secuencia ni corromper la ejecución del programa.

---

## 2. Procedimientos Anidados (`02_procedimientos_anidados.asm`)

* **¿Qué hace el programa?**
  Muestra cómo funciona el apuntador de la pila (`ESP`) cuando se llaman procedimientos. Primero lee e imprime en hexadecimal la dirección de retorno que está en el tope de la pila dentro de `main`, y después llama a `Rutina2`, donde vuelve a leer e imprimir `[ESP]` para observar la nueva dirección de retorno guardada por `CALL`.

* **¿Qué se comprobó al ejecutarlo?**
  Se comprobó que los dos valores impresos en hexadecimal son diferentes: en `main`, `[ESP]` apunta a la dirección de regreso hacia Windows, mientras que al entrar a `Rutina2`, `CALL` empuja a la pila la dirección de la siguiente instrucción en `main` (`nop`), cambiando el contenido del tope de la pila hasta que `RET` lo extrae para regresar.

---

## 3. Validar Cadena No Vacía (`03_validar_no_vacia.asm`)

* **¿Qué hace el programa?**
  Solicita una cadena de texto al usuario mediante `ReadString`, pasa la longitud capturada a través del registro `ECX` hacia el procedimiento `ValidarNoVacia` y evalúa el valor retornado en `EAX` (`1` = válida, `0` = vacía) utilizando la instrucción `test eax, eax` para mostrar el mensaje correspondiente.

* **¿Qué se comprobó al ejecutarlo?**
  Se verificó que al presionar únicamente `Enter` sin escribir texto, `ReadString` devuelve `0` en `EAX`, el procedimiento retorna `0` y el salto condicional `jz` redirige correctamente al mensaje de error. Al ingresar cualquier carácter, el procedimiento retorna `1` y confirma que la entrada es válida.

---

## 4. Manejo de Pila Manual (`04_manejo_pila_manual.asm`)

* **¿Qué hace el programa?**
  Demuestra el paso de parámetros por medio de la pila y la creación de un marco de pila manual usando `EBP` y `ESP`. El procedimiento `main` guarda un valor testigo (`999`) en `EBX`, empuja los valores `3` y `25` a la pila e invoca a `SumarPila`, donde se leen mediante desplazamientos (`[ebp+8]` y `[ebp+12]`), se multiplican con `imul` y se limpia la pila al retornar con `ret 8`.

* **¿Qué se comprobó al ejecutarlo?**
  Se verificó en el depurador que `EAX` recibe correctamente el resultado de la operación (`75`), que el registro `EBX` conserva intacto su valor original (`999`) gracias al respaldo con `push`/`pop`, y que `ret 8` libera los 8 bytes de los parámetros dejando el puntero de pila `ESP` equilibrado al volver a `main`.

---

## 5. Macros (`05_macros.asm`)

* **¿Qué hace el programa?**
  Implementa y demuestra el uso de macros personalizadas con parámetros en MASM (`MostrarMensaje` y `CalcularImporte`). En `main` se invoca `MostrarMensaje` dos veces para desplegar los mensajes de bienvenida y despedida, y posteriormente se ejecuta `CalcularImporte 25, 3` para multiplicar ambos valores mediante `imul` e imprimir el resultado entero con signo en consola con `WriteInt`.

* **¿Qué se comprobó al ejecutarlo?**
  Se comprobó que al invocar una macro el ensamblador expande e inserta directamente sus instrucciones dentro de `main` (sin usar `CALL` ni `RET`), sustituyendo los parámetros correctamente y mostrando en pantalla las dos cadenas seguidas del resultado `+75`.
