import wollok.game.*
import personajes.*
import objetosVisuales.*


object seleccion{

	method iniciar() {
		game.boardGround("pantalla_seleccion.png")
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
		game.addVisualCharacter(personaje)
	
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
		keyboard.left().onPressDo({ pepita.irA(pepita.position().left(1))})
		keyboard.right().onPressDo({ pepita.irA(pepita.position().right(1))})
		keyboard.up().onPressDo({ pepita.irA(pepita.position().up(1))})
		keyboard.down().onPressDo({ pepita.irA(pepita.position().down(1))})
		//keyboard.c().onPressDo({pepita.come(game.uniqueCollider(pepita))})
	}

	method configurarColisiones() {
		game.onCollideDo(pepita, { algo => algo.teEncontro(pepita)})
	}

}

*/