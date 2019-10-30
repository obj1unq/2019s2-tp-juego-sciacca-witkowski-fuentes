import wollok.game.*
import plataformas_nivel1.*
import obstaculos.*


class Personaje{
	var property position = game.at(0, 2) 
	var posicionAnterior = game.at(0, 2) 
	
	method fuerza()
	
	method image(imagen)
	
		
	method vida()
	
	method vida(vida)
	
	method bajarVida(danio) {
		self.vida(self.vida()-danio)
		if (self.vida()<0){self.morir()}
	}
	
	method atacarOpenenteEnPosicion(posicion){
		if(game.getObjectsIn(posicion)!=[]){
			game.getObjectsIn(posicion).first().serAtacado(self.fuerza())
		}	
	}
	
	method atacar(){
		self.atacarOpenenteEnPosicion(position.left(1))
		self.atacarOpenenteEnPosicion(position.right(1))
	}
	
	method morir(){
		game.say(self, "Te mataron, perdiste el juego =(")
		self.image("Lapida.png") 
		game.schedule( 4000 , {game.stop()})
	}
		
	// Posicionamiento
	method moverIzquierda(){
		if ( position.x()>0){
			posicionAnterior = position
			position = position.left(1)
		}
	}
	
	method moverDerecha(){
		if ( position.x()<17){
			posicionAnterior = position
			position = position.right(1)
		}
	}
	
	method subir(){
		if (game.colliders(self)!= [] and game.uniqueCollider(self).puedoTreparlo()){
					posicionAnterior = position
					position = self.position().up(1)
		}
		else {
			game.say(self, "                              No puedo subir!")
		}
	}
	
	method volverAPosicionAnterior(){ position = posicionAnterior}
}

object mago inherits Personaje{
	
	var property image = "mago.png"
	
	// Atributos del personaje
	var property vida = 50
	const property fuerza = 20
	const inteligencia = 100
	const velocidadDeAtaque = 70

	
	method imagenDelFinal() = "magoTeleport.png"
	
}

object guerrero inherits Personaje{ 
	var property image = "guerrero.png"

	// Atributos del personaje
	var property vida = 70
	const property fuerza = 50
	const inteligencia = 70
	const velocidadDeAtaque = 50
	
	method imagenDelFinal() = "guerreroTeleport.png"
		
}

object orco inherits Personaje{
	var property image = "orco.png"
	
	// Atributos del personaje
	var property vida = 100
	const property fuerza = 70
	const inteligencia = 20
	const velocidadDeAtaque = 50

	method imagenDelFinal() = "orcoTeleport.png"
		
}

object vikingo inherits Personaje{ 
	var property image = "vikingo.png"
	
	// Atributos del personaje
	var property vida = 70
	const property fuerza = 100
	const inteligencia = 40
	const velocidadDeAtaque = 30
	
	method imagenDelFinal() = "vikingoTeleport.png"
	
}




