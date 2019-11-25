import wollok.game.*
import personajes.*

class Enemigos{
	var property position = game.at(0,0)
	method puedoTreparlo() = false

}

class Atacables inherits Enemigos{
	method life()
	method life(cantidad)
	method danio()
	method serAtacado(cantidad) {
		self.life(self.life()-cantidad)
		game.say(self,"Recibi daño =/")
		if(self.life()<=0) {
			game.removeVisual(self)
		}
	}
	
	method chocarContra(personaje) {
		personaje.bajarVida(self.danio())
		personaje.volverAPosicionAnterior()
		game.say(self,"El enemigo te ha lastimado!")	
	} 
}

class Skeleton inherits Atacables{
	var property image = "skeleton_warrior.png"
	 
	var property life = 100
	var property danio = 20	
}

class Fuego{
	var property position
	var property image
							
	
	method actualizarPosicion(dragon){
 		if (dragon.proximoPaso()>0){position = position.right(1)}
 					else {position = position.left(1)}				
 	}		
 	
 	method serLanzado(dragon,posicionInicial){
 		game.schedule(500, {self.actualizarPosicion(dragon)})
 		game.schedule(1000, {self.actualizarPosicion(dragon)})
 		game.schedule(2000, {game.removeVisual(self)})
		position = posicionInicial
 	}
	
	method serAtacado(cantidad) {}
	
	method chocarContra(personaje) {
		personaje.morir()
		
	}
}

class Dragon inherits Atacables{
	var property image 						
	var posicionSiguiente = game.at(0,0)
	var property life = 20
	var property danio = 100
	var property fuego
	 
	
	method lanzarFuego(){
		game.addVisual(fuego)
		fuego.serLanzado(self,posicionSiguiente)
		
	 }
	 
	 override method serAtacado(cantidad) {
		self.life(self.life()-cantidad)
		game.say(self,"Recibi daño =/")
		if(self.life()<=0) {
			dragonesNivel2.listaDeDragones().remove(self)
			game.removeVisual(self)
		}		
	 }
	 
	 method proximoPaso() = posicionSiguiente.x() - position.x()  
}



class Ghost inherits Enemigos{
	var property image = "ghost.png" 
	
	method serAtacado(cantidad) {}
	
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
	
	method serAtacado(cantidad) {}
	
	method chocarContra(personaje) {
		personaje.ganarMana()
		
		game.say(game.uniqueCollider(self), "Tengo más mana")		
		game.removeVisual(self)
	}
}

object pocionesNivel1{
	const pocion1 = new Pocion (position = game.at(4, 8))
	const pocion3 = new Pocion (position = game.at(15, 2))
	const listaDePociones  = [pocion1,pocion3] 
	
	method cargarPociones(){
		listaDePociones.forEach{pocion => game.addVisual(pocion)}
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
	
	method hayUnEnemigo(obstaculo){
		return listaDeEsqueletos.contains(obstaculo)
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

// NIVEL 2



object dragonesNivel2{
	const fuego1 = new Fuego (position = game.at(3, 5), image = "fuegoL.png")
	const fuego2 = new Fuego (position = game.at(15, 5),image = "fuegoR.png")
	const fuego3 = new Fuego (position = game.at(6, 8),image = "fuegoR.png")
	const fuego4 = new Fuego (position = game.at(11, 8),image = "fuegoL.png")
	var property fuegos = [fuego1,fuego2,fuego3,fuego4] 
	
	const drag1 = new Dragon (position = game.at(4, 5), image = "dragL.png",fuego = fuego1, posicionSiguiente = game.at(3,5))
	const drag2 = new Dragon (position = game.at(14, 5),  image = "dragR.png",fuego = fuego2, posicionSiguiente = game.at(15,5))
	const drag3 = new Dragon (position = game.at(5, 8),  image = "dragR.png",fuego = fuego3, posicionSiguiente = game.at(6,8))
	const drag4 = new Dragon (position = game.at(12, 8),  image = "dragL.png",fuego = fuego4, posicionSiguiente = game.at(11,8))
	const property listaDeDragones = [drag1,drag2,drag3,drag4] 
	
	method cargarDragones(){
		listaDeDragones.forEach{dragon => game.addVisual(dragon)}
	}
	
	method lanzarFuegos(){
		listaDeDragones.forEach{dragon => dragon.lanzarFuego()}
	}
	
	method hayUnEnemigo(obstaculo){
		return listaDeDragones.contains(obstaculo)
	}
	
	
}
