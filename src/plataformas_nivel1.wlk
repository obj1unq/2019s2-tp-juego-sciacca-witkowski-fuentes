import wollok.game.*
import personajes.*
import niveles.*

// plataformas

class Plataforma{
	const property position 
	
	method puedoTreparlo() = false
	
	method chocarContra(personaje) {
		personaje.volverAPosicionAnterior()
		game.say(self,"No podes atravesar plataformas!!")
		
	} 
}

class Platlvl1 inherits Plataforma{
	const property image = "bloque1_50.png"		
}

class Platlvl2 inherits Plataforma{
	const property image = "bloquen2.png"		
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
		escalon.forEach({ x => game.addVisual( new Platlvl1(position = game.at(x,posicionY)) )})
	}
	

}

object plataformas_nivel2 {

	const escalon1 = new Range (start=0,end=17)
	const escalon2 = new Range (start=1,end=16)
	const escalon3 = new Range (start=0,end=7)
	const escalon3A = new Range (start=10,end=17)
	const escalon4 = new Range (start=0,end=16)

	
	
	method cargarPlataformas() { 
		self.armarEscalon(escalon1,1)
		self.armarEscalon(escalon2,4)
		self.armarEscalon(escalon3,7)
		self.armarEscalon(escalon3A,7)
		self.armarEscalon(escalon4,10)
	
	}

	method armarEscalon(escalon,posicionY){
		escalon.forEach({ x => game.addVisual( new Platlvl2(position = game.at(x,posicionY)) )})
	}
	

}

//escaleras

class Escalera{
	const property position 
	var property image = "stair.png"	
	
	method puedoTreparlo() = true
	method chocarContra(personaje) {}
	method serAtacado(cantidad) {}
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

object escaleras_nivel2 {

	const escalera1 = new Range (start=2,end=4)
	const escalera2 = new Range (start=5,end=7)
	const escalera3 = new Range (start=8,end=10)

	method cargarEscaleras() { 
		self.armarEscalera(17,escalera1)
		self.armarEscalera(0,escalera1)
		self.armarEscalera(8,escalera2)
		self.armarEscalera(9,escalera2)
		self.armarEscalera(17,escalera3)	
	}

	method armarEscalera(posicionX,escalera){
		escalera.forEach({ y => game.addVisual( new Escalera(position = game.at(posicionX,y)) )})
	}
}


object  bloqueoNivel2{
	const bloqueo1 = new Platlvl2(position = game.at(1,11))
	const bloqueo2 = new Platlvl2(position = game.at(1,12))
	const bloqueo3 = new Platlvl2(position = game.at(1,13))
	const bloqueo4 = new Platlvl2(position = game.at(1,14))
	const listaBloqueo = [bloqueo1,bloqueo2,bloqueo3,bloqueo4]
	
	
	method cargarBloqueo(){ 
		listaBloqueo.forEach({ bloqueo => game.addVisual(bloqueo)})
	}
	
	method quitarBloqueo(){ 
		listaBloqueo.forEach({ bloqueo => game.removeVisual(bloqueo)})
	}

}

object llaveN2{
	var property image = "lever.png"
	var property position = game.at(0,8)
	method puedoTreparlo() = false
	method serAtacado(cantidad) {}
	method ponerLlave(){game.addVisual(self)}
		
	method chocarContra(personaje) {
		bloqueoNivel2.quitarBloqueo()
		game.removeVisual(self)
	}
}

//Fin de Nivel
class FinDeNivel{
	var property position = new Position(x = 0, y = 11)
	
	method serAtacado(cantidad) {}
	method ponerFin(){game.addVisual(self)}
	method puedoTreparlo() = false
	
}

object teleport inherits FinDeNivel{
	
	var property image = "teleport.png"
	
	method chocarContra(personaje) {
		   	game.say(self,"Has Superado el nivel")
		   	game.sound("gameOver_no.mp3")
			game.schedule(4000, {nivel2.iniciar(personaje)})
	}
}

object princesa inherits FinDeNivel{
	var property image = "princess.png"
	
	method chocarContra(personaje) {
		   	game.say(self,"Rescataste a la princesa!!")
		   	game.sound("gameOver_no.mp3")
			game.schedule(6000, {game.stop()})
	}
}



