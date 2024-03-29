import wollok.game.*
import personajes.*
import objetosVisuales.*
import plataformas_nivel1.*
import obstaculos.*
import cosillas.*


object seleccion{

	method iniciar() {
		game.boardGround("seleccion_2.jpg")
		game.addVisual(titulo_principal)
		game.addVisual(seleccion_personaje)
		game.addVisual(mago_seleccion)
		game.addVisual(guerrero_seleccion)
		game.addVisual(orco_seleccion)
		game.addVisual(vikingo_seleccion)
		game.addVisualIn(mago_grande, game.at(0, 3))
		game.addVisualIn(guerrero_grande, game.at(4, 3))
		game.addVisualIn(orco_grande, game.at(9, 3))
		game.addVisualIn(vikingo_grande, game.at(13, 3))
		
		//Configuración de teclas
		
		keyboard.num1().onPressDo { comoJugar.iniciar(mago)}
		keyboard.num2().onPressDo { comoJugar.iniciar(guerrero)}
		keyboard.num3().onPressDo { comoJugar.iniciar(orco)}
		keyboard.num4().onPressDo { comoJugar.iniciar(vikingo)}
	}

}


object comoJugar{
	method iniciar(personaje){
		game.clear()
		game.addVisualIn(como_jugar, game.at(0,0))
		game.addVisualIn(personaje.imagenInicial(),game.at(13, 3))	
		game.schedule(3000, {nivel1.iniciar(personaje)})///
		
	}
}

object nivel1 {

	method iniciar(personaje) {
		
		//Inicialización de nivel
		
		game.clear()
		game.addVisualIn(iNivel1, game.at(0,0))
		
		plataformas_nivel1.cargarPlataformas()
		escaleras_nivel1.cargarEscaleras()
		esqueletosNivel1.cargarEsqueletos()
		fantasmasNivel1.cargarFantasmas()
		teleport.ponerFin()
		game.sound("sonidoFondo.mp3")
		game.addVisual(personaje)
		game.showAttributes(personaje)
		pocionesNivel1.cargarPociones()///
		
		//Colisiones
		
		game.onCollideDo(personaje, { obstaculo => obstaculo.chocarContra(personaje) })
		
		//Configuración Teclas
		keyboard.left().onPressDo {personaje.moverIzquierda()}
		keyboard.right().onPressDo {personaje.moverDerecha()}
		keyboard.up().onPressDo {personaje.subir()}
		keyboard.a().onPressDo {personaje.atacar()}	
		keyboard.h().onPressDo {personaje.lanzarHabilidad()}	
		
		// eventos 
		
		game.onTick(500, "movimientos de fantasmas", {fantasmasNivel1.actualizarPosiciones()})
		
		// barras
		barraVida.insertandoBarraVida(personaje)
		barraMana.insertandoBarraMana(personaje)
		
	}
}

object nivel2 {

	method iniciar(personaje) {
		
		//Inicialización de nivel
		
		game.clear()
		game.addVisualIn(iNivel2, game.at(0,0))
	    plataformas_nivel2.cargarPlataformas()
	    escaleras_nivel2.cargarEscaleras()
	    princesa.ponerFin()
	    personaje.position(game.at(8,2))
		dragonesNivel2.cargarDragones()
		bloqueoNivel2.cargarBloqueo()
		llaveN2.ponerLlave()
		game.addVisual(personaje)
		
		//Configuración Teclas
		keyboard.left().onPressDo {personaje.moverIzquierda()}
		keyboard.right().onPressDo {personaje.moverDerecha()}
		keyboard.up().onPressDo {personaje.subir()}
		keyboard.a().onPressDo {personaje.atacar()}	
		keyboard.h().onPressDo {personaje.lanzarHabilidad()}	
		
		// eventos 
		
		game.onTick(5000, "lanzar fuego",{if (!dragonesNivel2.listaDeDragones().isEmpty()){ dragonesNivel2.lanzarFuegos() } })
		
		//Colisiones
		
		game.onCollideDo(personaje, { obstaculo => obstaculo.chocarContra(personaje) })
		
		// barras
		barraVida.insertandoBarraVida(personaje)
		barraMana.insertandoBarraMana(personaje)
	
}

}