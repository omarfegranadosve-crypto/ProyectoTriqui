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
//ejecucion 3 - Pedir una jugada y convertirla en fila y columna 
SubProceso PedirJugada(posicion Por Referencia, fila Por Referencia, columna Por Referencia)
	Repetir
		Escribir "Digite una posicion entre 1 y 9:"
		leer posicion
		Si posicion < 1 O posicion > 9 Entonces
			Escribir "La posición Ingresada No es valida"
		FinSi
	Hasta Que posicion>=1 y posicion<=9
	
	fila<-Trunc((posicion-1)/3)+1
	columna<-((posicion-1) MOD 3)+1
FinSubProceso
//fin ejecucion 3
Funcion libre <- CeldaLibre(tablero, fila, columna)
    Si tablero[fila,columna] = "-" Entonces
        libre <- Verdadero
    Sino
        libre <- Falso
    FinSi
FinFuncion
SubProceso RegistrarJugada(tablero, fila, columna, jugador)
    tablero[fila,columna] <- jugador
FinSubProceso
//Fin ejecución
Funcion ganador <- HayGanador(tablero,jugador)
	Definir i Como Entero
	ganador <- Falso
	Para i <- 1 Hasta 3 Hacer
		si tablero(i,1)=jugador y tablero(i,2)=jugador y tablero(i,3)=jugador Entonces
			ganador<-Verdadero
		FinSi
		si tablero(1,i)=jugador y tablero(2,i)=jugador y tablero(3,i)=jugador Entonces
			ganador<-Verdadero
		FinSi
	FinPara 
	si tablero(1,1)=jugador y tablero(2,2)=jugador y tablero(3,1)=jugador Entonces
		ganador<-Verdadero
	FinSi
	si tablero(1,3)=jugador y tablero(2,2)=jugador y tablero(3,1)=jugador Entonces
		ganador<-Verdadero
	FinSi
FinFuncion
Funcion lleno <- Tablerolleno(tablero)
	Definir f,c Como Entero
	lleno<-Verdadero
	Para f <-1 Hasta 3 Hacer
		Para c <- 1 Hasta 3 Hacer
			si tablero(f,c)="-" Entonces
				lleno<- Falso
			FinSi
		FinPara
	FinPara
FinFuncion
Funcion gano <- VerificarGanador(tablero, jugador)
    Definir gano Como Logico
    gano <- Falso
    
    // Revisar Filas
    Si (tablero[1,1]=jugador Y tablero[1,2]=jugador Y tablero[1,3]=jugador) O (tablero[2,1]=jugador Y tablero[2,2]=jugador Y tablero[2,3]=jugador) O (tablero[3,1]=jugador Y tablero[3,2]=jugador Y tablero[3,3]=jugador) Entonces
        gano <- Verdadero
    FinSi
    // Revisar Columnas
    Si (tablero[1,1]=jugador Y tablero[2,1]=jugador Y tablero[3,1]=jugador) O (tablero[1,2]=jugador Y tablero[2,2]=jugador Y tablero[3,2]=jugador) O (tablero[1,3]=jugador Y tablero[2,3]=jugador Y tablero[3,3]=jugador) Entonces
        gano <- Verdadero
    FinSi
    // Revisar Diagonales
    Si (tablero[1,1]=jugador Y tablero[2,2]=jugador Y tablero[3,3]=jugador) O (tablero[1,3]=jugador Y tablero[2,2]=jugador Y tablero[3,1]=jugador) Entonces
        gano <- Verdadero
    FinSi
FinFuncion
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
	Repetir
		
		InicializarTablero(tablero) //Llamado ejecución parte 1 se crea pero no hay visualización
		jugador <- "O"               //Definimos cual ficha incia el jugador 1 a medida que acabe el turno se sobre escribe esta variable
		turnos <- 0                  //Inicialización de Turnos puede cambiar
		finJuego <- Falso    //´para crear el ciclo  mientras que nadie gane no termine o a menos que lo obliguen a terminar
		Escribir "Bienvenido al Juego de 3 en Línea"
		Escribir "A continuación se visualizara el formato numérico a ingresar para escoger la posición a marcar"
		instrucTablero(tablero)    
		Escribir "La siguiente imagén es el tablero de 3 en línea, por favor escoja su posición"
		Mientras finJuego = Falso Y turnos < 9 Hacer 
			MostrarTablero(tablero) 
			PedirJugada(posicion, fila, columna)
			Si CeldaLibre(tablero, fila, columna) = Verdadero Entonces
				RegistrarJugada(tablero, fila, columna, jugador)
				turnos <- turnos + 1
			SiNo
				Escribir "Esa casilla ya está ocupada. ¡Intenta de nuevo con otra posición!"
				
			FinSi
			RegistrarJugada(tablero, fila, columna, jugador)
			Si VerificarGanador(tablero, jugador) Entonces
				MostrarTablero(tablero)
                Escribir "Gana el jugador ", jugador
                finPartida <- Verdadero
            SiNo
                Si TableroLleno(tablero) Entonces
                    MostrarTablero(tablero)
                    Escribir "Empate."
                    finPartida <- Verdadero
				SiNo
					Si jugador = "X" Entonces
						jugador <- "O"
					Sino
						jugador <- "X"
					Finsi 
		    	FinSi
	        FinSi
		Si  VerificarGanador(tablero, jugador) = Verdadero Entonces
			finJuego<-Verdadero
		FinSi
		FinMientras
		Escribir "Desea jugar otra partida? (S/N)"
		Leer respuesta
	Hasta Que  respuesta = "N" O respuesta = "n"
FinAlgoritmo
