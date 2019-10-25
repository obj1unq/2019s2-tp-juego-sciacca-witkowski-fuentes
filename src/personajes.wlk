import wollok.game.*

object guerrero {
	var property position = new Position(x = 3, y = 3)
	const property image = "guerrero.png"
	
	// Atributos del personaje
	const vida = 70
	const fuerza = 50
	const inteligencia = 70
	const velocidadDeAtaque = 50
	
}

object mago {
	var property position = new Position(x = 4, y = 3)
	const property image = "mago.png"
	
	const vida = 50
	const fuerza = 20
	const inteligencia = 100
	const velocidadDeAtaque = 70
	
}

object orco {
	var property position = new Position(x = 5, y = 3)
	const property image = "orco.png"
	
	const vida = 100
	const fuerza = 70
	const inteligencia = 20
	const velocidadDeAtaque = 50
	
}

object vikingo {
	var property position = new Position(x = 6, y = 3)
	const property image = "vikingo.png"
	
	const vida = 70
	const fuerza = 100
	const inteligencia = 40
	const velocidadDeAtaque = 30
	
}


