import wollok.game.*
import plataformas_nivel1.*
import obstaculos.*
import objetosVisuales.*


class Personaje{
	var property position = game.at(0, 2) 
	var posicionAnterior = game.at(0, 17) 
	
	method fuerza()
	
	method image(imagen)
	
		
	method vida()
	
	method vida(vida)
	
	method mana()
	
	method mana(mana)
	
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
	
	method ganarMana() {
		self.mana(self.mana()+50)
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
	
	method bajar(){ game.say(self, "                          No puedo bajar!")}	
	
}



object mago inherits Personaje{
	
	var property image = "mago.png"
	
	// Atributos del personaje
	var property vida = 50
	var property mana = 70
	const property fuerza = 20
	const inteligencia = 100

	
	method imagenDelFinal() = "magoTeleport.png"
	
	method imagenInicial() = mago_grande
	
	method lanzarHabilidad(){
		
	}
	

	
}

object guerrero inherits Personaje{ 
	var property image = "guerrero.png"

	// Atributos del personaje
	var property vida = 70
	var property mana = 70
	const property fuerza = 50
	const inteligencia = 70
	
	method imagenDelFinal() = "guerreroTeleport.png"
	
	method imagenInicial() = guerrero_grande
	
	
	// El Guerrero tiene como habilidad especial la curación
	method lanzarHabilidad(){
		if(mana>=70){
			vida+=50
			mana-=70	
		}
		else {game.say(self,"No tengo mana para la habilidad")}
				
	}	
		
}

object orco inherits Personaje{
	var property image = "orco.png"
	
	// Atributos del personaje
	var property vida = 100
	var property mana = 70
	const property fuerza = 70
	const inteligencia = 20

	method imagenDelFinal() = "orcoTeleport.png"
	
	method imagenInicial() = orco_grande
	
	// El orco tiene la habilidad de saltar a la plataforma de arriba
	method lanzarHabilidad(){
		if(mana>=70){
			position= position.up(3)
			mana-=70	
		}
		else {game.say(self,"No tengo mana para la habilidad")}
				
	}
}

object vikingo inherits Personaje{ 
	var property image = "vikingo.png"
	
	// Atributos del personaje
	var property vida = 70
	var property mana = 70
	const property fuerza = 100
	const inteligencia = 40
	
	method imagenDelFinal() = "vikingoTeleport.png"
	
	method imagenInicial() = vikingo_grande
	
	// El Vikingo tiene la habilidad de lanzar un hacha
	method proximoPaso() = if (self.position().x() == 0 ) 17
								else position.x() - posicionAnterior.x()
	
	method lanzarHabilidad(){
			game.addVisual(hacha)
			game.onCollideDo(hacha, { obstaculo => obstaculo.serAtacado(100) })	
			hacha.serLanzada(self)	
	}	
	
}	


object hacha{
	var property image = "hacha.png"
	var property position = game.at(0,0)

	method actualizarPosicion(personaje){
		if (personaje.proximoPaso()>0){position = position.right(1)}
			else if(self.position().x()==0){ position = game.at(17,position.y())}
					else {position = position.left(1)}				
	}

	method serLanzada(personaje){
		position = game.at( personaje.position().x() + personaje.proximoPaso()  , personaje.position().y())
		game.schedule(1000, {self.actualizarPosicion(personaje)})
		game.schedule(2000, {self.actualizarPosicion(personaje)})
		game.schedule(3000, {game.removeVisual(self)})
	}
	
}
