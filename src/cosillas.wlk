import objetosVisuales.*
import wollok.game.*
import personajes.*


object barraVida{
	const property position = game.at(13,14)
	var property image
	
	method insertandoBarraVida(personaje){
		if (personaje.vida() < 10) {image = "barravida0.png"}
		else if (personaje.vida() > 100) {image= "barravida110.png"}
		else { image = "barravida" + personaje.vida() + ".png"}
		game.addVisual(self)
	} 
	
	method quitandoBarraVida(){
		game.removeVisual(self)
	}
	
}
 
object barraMana{
	const property position = game.at(0,14)
	var property image
	
	method insertandoBarraMana(personaje){
		if (personaje.mana() > 100) {image = "barramana120.png"} 
		else { image = "barramana" + personaje.mana() + ".png"}
		game.addVisual(self)
	} 
	
	method quitandoBarraMana(){
		game.removeVisual(self)
	}
}


