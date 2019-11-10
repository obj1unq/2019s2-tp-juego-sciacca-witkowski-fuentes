import wollok.game.*
import personajes.*

class Skeleton {
	var property image = "skeleton_warrior.png"
	var property position 
	var life = 100
	var danio = 20
	
	method puedoTreparlo() = false
	method puedoAtravesarlo() = false	
	
	method serAtacado(cantidad) {
		life-=cantidad
		if(life<=0) {game.removeVisual(self)}
	}
	
	method chocarContra(personaje) {
		personaje.bajarVida(danio)
		personaje.volverAPosicionAnterior()
		game.say(self,"				El esqueleto te ha lastimado!")	
	} 
}

class Ghost {
	var property image = "ghost.png"
	var property position 
	
	method puedoTreparlo() = false
	method puedoAtravesarlo() = false	
	
	method chocarContra(personaje) {
		personaje.morir()

	}
	
	method actualizarPosicion(){
		if(position.y()<15){position = position.up(1)} else {position = game.at(position.x(),0)}
	} 
}

/// pocion que da mana!!
class Pocion {
	var property image = "pocionMagica.png"
	var property position 
	
	method puedoTreparlo() = false
	method puedoAtravesarlo() = false
	
		
	method chocarContra(personaje) {
		personaje.ganarMana()
		
		game.say(self, "Tengo más mana")		

	}
	
	method actualizarPosicion(){
		if(position.y()>0){position = position.down(1)} else {position = game.at(position.x(),15)}
	} 
}//////////////

object pocionesNivel1{
	const pocion1 = new Pocion (position = game.at(4, 8))
	const pocion3 = new Pocion (position = game.at(15, 2))
	const listaDePociones  = [pocion1,pocion3] 
	
	method cargarPociones(){
		listaDePociones.forEach{pocion => game.addVisual(pocion)}
	}
	
	method actualizarPosiciones(){
		listaDePociones.forEach{ pocion => pocion.actualizarPosicion()}
	}

}



object esqueletosNivel1{
	const esqueleto1 = new Skeleton (position = game.at(5, 2))
	const esqueleto2 = new Skeleton (position = game.at(3, 5))
	const esqueleto3 = new Skeleton (position = game.at(14, 8))
	const esqueleto4 = new Skeleton (position = game.at(7, 11))
	const listaDeEsqueletos = [esqueleto1,esqueleto2,esqueleto3,esqueleto4] 
	
	method cargarEsqueletos(){
		listaDeEsqueletos.forEach{esqueleto => game.addVisual(esqueleto)}
	}

}

object fantasmasNivel1{
	const fantasma1 = new Ghost (position = game.at(2, 2))
	const fantasma2 = new Ghost (position = game.at(10, 5))
	const fantasma3 = new Ghost (position = game.at(12, 8))
	const listaDeFantasmas  = [fantasma1,fantasma2,fantasma3] 
	
	method cargarFantasmas(){
		listaDeFantasmas.forEach{esqueleto => game.addVisual(esqueleto)}
	}
	
	method actualizarPosiciones(){
		listaDeFantasmas.forEach{ fantasma => fantasma.actualizarPosicion()}
	}

}
