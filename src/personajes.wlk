import wollok.game.*
import plataformas_nivel1.*
import obstaculos.*


class Personaje{
	var property position = game.at(0, 2) 
	
	method atacar(){
		if(game.getObjectsIn(position.right(1))!=[]){
			game.getObjectsIn(position.right(1)).first().serAtacado(self.fuerza())
		}
		if(game.getObjectsIn(position.left(1))!=[]){
			game.getObjectsIn(position.left(1)).first().serAtacado(self.fuerza())
		}

	}
	
	method fuerza()
		
	// Posicionamiento
	method moverIzquierda(){
		if (game.colliders(self)== [] and position.x()>0){position = position.left(1)}
	}
	
	method moverDerecha(){
		if (game.colliders(self)== [] and position.x()<17){position = position.right(1)}
	}
	
	method subir(){
		if (game.colliders(self)!= [] and game.uniqueCollider(self).puedoTreparlo())
						{position = self.position().up(1)}
				else {game.say(self, "                              No puedo subir!")}
	}
}

object mago inherits Personaje{
	
	var property image = "mago.png"
	
	// Atributos del personaje
	const vida = 50
	const property fuerza = 20
	const inteligencia = 100
	const velocidadDeAtaque = 70
	
	method imagenDelFinal() = "magoTeleport.png"
	
}

object guerrero { 
	var property image = "guerrero.png"

	// Atributos del personaje
	const vida = 70
	const property fuerza = 50
	const inteligencia = 70
	const velocidadDeAtaque = 50
	
	method imagenDelFinal() = "guerreroTeleport.png"
		
}

object orco {
	var property image = "orco.png"
	
	// Atributos del personaje
	const vida = 100
	const property fuerza = 70
	const inteligencia = 20
	const velocidadDeAtaque = 50

	method imagenDelFinal() = "orcoTeleport.png"
		
}

object vikingo { 
	var property image = "vikingo.png"
	
	// Atributos del personaje
	const vida = 70
	const property fuerza = 100
	const inteligencia = 40
	const velocidadDeAtaque = 30
	
	method imagenDelFinal() = "vikingoTeleport.png"
	
}




