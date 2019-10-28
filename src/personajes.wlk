import wollok.game.*
import plataformas_nivel1.*
import obstaculos.*


object mago {
	var property position = game.at(0, 2) 
	var property image = "mago.png"
	
	// Atributos del personaje
	const vida = 50
	const fuerza = 20
	const inteligencia = 100
	const velocidadDeAtaque = 70
	
	method atacar(){
		if(game.getObjectsIn(position.right(1))!=[]){
			game.getObjectsIn(position.right(1)).first().serAtacado(fuerza)
		}
		if(game.getObjectsIn(position.left(1))!=[]){
			game.getObjectsIn(position.left(1)).first().serAtacado(fuerza)
		}
	}
	
	method imagenDelFinal() = "magoTeleport.png"
	
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

object guerrero {
	var property position = game.at(0, 2) 
	var property image = "guerrero.png"

	// Atributos del personaje
	const vida = 70
	const fuerza = 50
	const inteligencia = 70
	const velocidadDeAtaque = 50
	
	method atacar(){
		if(game.getObjectsIn(position.right(1))!=[]){
			game.getObjectsIn(position.right(1)).first().serAtacado(fuerza)
		}
		if(game.getObjectsIn(position.left(1))!=[]){
			game.getObjectsIn(position.left(1)).first().serAtacado(fuerza)
		}
	}
	
	method imagenDelFinal() = "guerreroTeleport.png"
	
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

object orco {
	var property position = game.at(0, 2) 
	var property image = "orco.png"
	
	// Atributos del personaje
	const vida = 100
	const fuerza = 70
	const inteligencia = 20
	const velocidadDeAtaque = 50
	
	method atacar(){
		if(game.getObjectsIn(position.right(1))!=[]){
			game.getObjectsIn(position.right(1)).first().serAtacado(fuerza)
		}
		if(game.getObjectsIn(position.left(1))!=[]){
			game.getObjectsIn(position.left(1)).first().serAtacado(fuerza)
		}
	}
	
	method imagenDelFinal() = "orcoTeleport.png"
	
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

object vikingo {
	var property position = game.at(0, 2) 
	var property image = "vikingo.png"
	
	// Atributos del personaje
	const vida = 70
	const fuerza = 100
	const inteligencia = 40
	const velocidadDeAtaque = 30
	
		method atacar(){
		if(game.getObjectsIn(position.right(1))!=[]){
			game.getObjectsIn(position.right(1)).first().serAtacado(fuerza)
		}
		if(game.getObjectsIn(position.left(1))!=[]){
			game.getObjectsIn(position.left(1)).first().serAtacado(fuerza)
		}
	}
	
	method imagenDelFinal() = "vikingoTeleport.png"
	
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




