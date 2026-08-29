//Ejecución 1 Creación del tablero
SubProceso InicializarTablero(tablero)
    Definir f, c Como Entero
    Para f <- 1 Hasta 3 Hacer
        Para c <- 1 Hasta 3 Hacer
            tablero[f,c] <- " "
        FinPara
    FinPara
FinSubProceso
//Fin Ejecución parte 1
//Ejecución 2	Visualización tablero
SubProceso MostrarTablero(tablero)
	Escribir ""
	Escribir "  ", tablero[1,1], " | ", tablero[1,2], " | ", tablero[1,3]
	Escribir " ---+---+---"	
	Escribir "  ", tablero[2,1], " | ", tablero[2,2], " | ", tablero[2,3]
	Escribir " ---+---+---"
	Escribir "  ", tablero[3,1], " | ", tablero[3,2], " | ", tablero[3,3]
	Escribir ""
FinSubProceso
//Fin ejecución 2
//Ejecucion Instructivo
SubProceso instrucTablero(tablero)
	Definir c Como Entero
	c<-1
	Escribir " ---+---+---"
	Para i <- 1 Hasta 3 Con Paso 1 Hacer
		Mostrar  " | ", c , " | ", c+1, " | ", c+2 //Explicación de la numeración a llamar
		Escribir " ---+---+---"
		c=c+3
	FinPara
	Para i <- 1 Hasta 3 Con Paso 1 Hacer
        Para j <- 1 Hasta 3 Con Paso 1 Hacer
            tablero[i,j] <- "-"   //De esta forma inicializamos las casillas del Juego al cambiarlo podemos probar posiciones
        FinPara
    FinPara
FinSubProceso
//ejecucion3-pedir una jugada y convertirla en fila y columna Subproceso PedirJugada (Posicion, fila, columna)
Repetir
Escribir "Digite una posicion entre 1 y 9:"
leer posicion
Hasta Que posicion>=1 y posicion<=9

fila<- Trunc((posicion-1)/3)+1
columna<-((posicion-1)MOD 3)+1
FinSubProceso
//Fin ejecucion 3
//Fin ejecución

Algoritmo Proyecto3enLínea
	//Como el bloque de Algoritmo  es el principal (donde se ejecuta el programa)
	//Aqui llamamos a inicializar el tablero
	//Iniciamos con la definición de nuestras VARIABLES
	Definir tablero Como Caracter  //el tablero contendra x,o y los simbolos - 
	Definir jugador Como Caracter //los juagdorres son los que contienen la X o O por ello caracter
	Definir turno Como Entero //VARIABLE que dirá a que jugador le toca
	Definir finJuego Como Logico //Determinar si gano o no hay mas movimientos
	//Al tener definido el tablero, ahora se debe crear la matriz con este
Definir posicion, fila, columna Como Entero
	Dimension tablero[3,3]
	InicializarTablero(tablero) //Llamado ejecución parte 1 se crea pero no hay visualización
    jugador <- "O"               //Definimos cual ficha incia el jugador 1 a medida que acabe el turno se sobre escribe esta variable
    turnos <- 0                  //Inicialización de Turnos puede cambiar
    finJuego <- Falso    //´para crear el ciclo  mientras que nadie gane no termine o a menos que lo obliguen a terminar
	Escribir "Bienvenido al Juego de 3 en Línea"
	Escribir "A continuación se visualizara el formato numérico a ingresar para escoger la posición a marcar"
	instrucTablero(tablero)    
	Escribir "La siguiente imagén es el tablero de 3 en línea, por favor escoja su posición"
    Mientras juego_terminado = Falso Y turnos < 1 Hacer //como se pruebe jugadas y turnos ya ponerlo <9 actualmente como prueba esta en 1
        MostrarTablero(tablero)    //llamada para visualizar como aparece el tablero
        // Aqui se llamaria  la función o subproceso para registrar jugada recordar que al tablero se debe devolver coordenadas 
		//RegistrarJugada(tablero, jugador), se sobre escribira el tablero permitiendo que al vovler a mostrar tablero se actualice
        turnos <- turnos + 1
PedirJugada(posicion, fila, columna)
	FinMientras
FinAlgoritmo
