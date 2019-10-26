import wollok.game.*
import personajes.*
import objetosVisuales.*
import plataformas_nivel1.*


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
		keyboard.num1().onPressDo { nivel1.iniciar(mago)}
		keyboard.num2().onPressDo { nivel1.iniciar(guerrero)}
		keyboard.num3().onPressDo { nivel1.iniciar(orco)}
		keyboard.num4().onPressDo { nivel1.iniciar(vikingo)}
	}

}


object nivel1 {

	method iniciar(personaje) {
		game.clear()
		game.addVisualIn(iNivel1, game.at(0,0))
		game.addVisual(personaje)
		plataformas_nivel1.cargarPlataformas()
		escaleras_nivel1.cargarEscaleras()
		keyboard.left().onPressDo {personaje.moverIzquierda()}
		keyboard.right().onPressDo {personaje.moverDerecha()}
		keyboard.up().onPressDo {personaje.subir()}
		keyboard.down().onPressDo {personaje.bajar()}		
	}
}

// CODIGO EXTRAIDO DE OTROS JUEGOS A MODO DE EJEMPLO

/* 
object tutorial2 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
		game.onTick(5000, "gravedad", { pepita.caer() } )
		game.onTick(100, "Pepita cansancio", { pepita.terminarCuandoEsteCansada()})
	}
}

object tutorial3 {

	method iniciar() {
		game.addVisual(manzana)
		game.addVisual(alpiste)
		game.addVisual(nido)
		game.addVisual(silvestre)
		game.addVisual(pepita)
		config.configurarTeclas()
		config.configurarColisiones()
	}

}

object config {

	method configurarTeclas() {
		
		//keyboard.c().onPressDo({pepita.come(game.uniqueCollider(pepita))})
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

}

*/