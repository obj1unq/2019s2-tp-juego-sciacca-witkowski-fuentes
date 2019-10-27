import wollok.game.*
import personajes.*
import objetosVisuales.*
import plataformas_nivel1.*
import obstaculos.*


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
		esqueletosNivel1.cargarEsqueletos()
		keyboard.left().onPressDo {personaje.moverIzquierda()}
		keyboard.right().onPressDo {personaje.moverDerecha()}
		keyboard.up().onPressDo {personaje.subir()}
		keyboard.down().onPressDo {personaje.bajar()}		
	}
}

