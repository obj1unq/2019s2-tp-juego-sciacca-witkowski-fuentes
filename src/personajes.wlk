import wollok.game.*
import plataformas_nivel1.*

object guerrero {
	var property position = game.at(0, 2) 
	var property image = "guerrero.png"

	// Atributos del personaje
	const vida = 70
	const fuerza = 50
	const inteligencia = 70
	const velocidadDeAtaque = 50
	
	// Posicionamiento
	method moverIzquierda(){
		if (position.x()>0){position = position.left(1)}
		if (game.colliders(self)!=#{} and game.uniqueCollider(self).Treparlo())
				 {image = "guerreroEnEscalera.png"}
			else {image = "guerrero"}
	}
	
	method moverDerecha(){
		if (position.x()<17){position = position.right(1)}
	}
	
	method subir(){
		if (game.uniqueCollider(self).puedoTreparlo()){position = self.position().up(1)}
	}
	
	
	
}

object mago {
	var property position = game.at(0, 2) 
	const property image = "mago.png"
	
	// Atributos del personaje
	const vida = 50
	const fuerza = 20
	const inteligencia = 100
	const velocidadDeAtaque = 70
	
	// Posicionamiento
	method moverIzquierda(){
		if (position.x()>0){position = position.left(1)}
	}
	
	method moverDerecha(){
		if (position.x()<17){position = position.right(1)}
	}
	
	method subir(){
		if (game.uniqueCollider(self).puedoTreparlo()){position = self.position().up(1)}
	}
	
}

object orco {
	var property position = game.at(0, 2) 
	const property image = "orco.png"
	
	// Atributos del personaje
	const vida = 100
	const fuerza = 70
	const inteligencia = 20
	const velocidadDeAtaque = 50
	
	// Posicionamiento
	method moverIzquierda(){
		if (position.x()>0){position = position.left(1)}
	}
	
	method moverDerecha(){
		if (position.x()<17){position = position.right(1)}
	}
	
	method subir(){
		if (game.uniqueCollider(self).puedoTreparlo()){position = self.position().up(1)}
	}

}

object vikingo {
	var property position = game.at(0, 2) 
	const property image = "vikingo.png"
	
	// Atributos del personaje
	const vida = 70
	const fuerza = 100
	const inteligencia = 40
	const velocidadDeAtaque = 30
	
	// Posicionamiento
	method moverIzquierda(){
		if (position.x()>0){position = position.left(1)}
	}
	
	method moverDerecha(){
		if (position.x()<17){position = position.right(1)}
	}
	
	method subir(){
		if (game.uniqueCollider(self).puedoTreparlo()){position = self.position().up(1)}
	}
	
	
}




