import wollok.game.*
import personajes.*

// plataformas

class Plataforma{
	const property position 
	const property image = "bloque1_50.png"	
	
	method puedoTreparlo() = false
}

object plataformas_nivel1 {

	const escalon1 = new Range (start=0,end=17)
	const escalon2 = new Range (start=0,end=16)
	const escalon3 = new Range (start=1,end=17)
	const escalon4 = new Range (start=0,end=16)

	method cargarPlataformas() { 
		self.armarEscalon(escalon1,1)
		self.armarEscalon(escalon2,4)
		self.armarEscalon(escalon3,7)
		self.armarEscalon(escalon4,10)
	
	}

	method armarEscalon(escalon,posicionY){
		escalon.forEach({ x => game.addVisual( new Plataforma(position = game.at(x,posicionY)) )})
	}
}

//escaleras

class Escalera{
	const property position 
	var property image = "stair.png"	
	
	method puedoTreparlo() = true
	method puedoAtravesarlo() = true	
}

object escaleras_nivel1 {

	const escalera1 = new Range (start=2,end=4)
	const escalera2 = new Range (start=5,end=7)
	const escalera3 = new Range (start=8,end=10)

	method cargarEscaleras() { 
		self.armarEscalera(17,escalera1)
		self.armarEscalera(0,escalera2)
		self.armarEscalera(17,escalera3)	
	}

	method armarEscalera(posicionX,escalera){
		escalera.forEach({ y => game.addVisual( new Escalera(position = game.at(posicionX,y)) )})
	}
}

//Fin de Nivel

object teleport {
	var property position = new Position(x = 0, y = 11)
	var property image = "teleport.png"

	method ponerTeleport(){game.addVisual(self)}
	
	method estaPersonaje(){
		if (game.colliders(self)!=[]){
			image = game.uniqueCollider(self).imagenDelFinal()
			game.say(self,"Has Superado el nivel")
			game.schedule(4000, {game.stop()})
		}
	}
	
	method puedoAtravesarlo() = true
}