import wollok.game.*
import plataformas_nivel1.*
import obstaculos.*
import objetosVisuales.*
import cosillas.*

class Personaje {

	var property position = game.at(0, 2)
	var posicionAnterior = game.at(0, 17)
	
	method fuerza()

	method image(imagen)

	method vida()

	method vida(vida)

	method mana()

	method mana(mana)
	
	method serAtacado(cantidad) {}
	
	

	method bajarVida(danio) {
		barraVida.quitandoBarraVida()
		self.vida(self.vida() - danio)
		barraVida.insertandoBarraVida(self)
			
		if (self.vida() < 0) {
			self.morir()
		}
	}

	method atacarOpenenteEnPosicion(posicion) {
		if (game.getObjectsIn(posicion) != []) {
			game.getObjectsIn(posicion).first().serAtacado(self.fuerza())
		}
	}

	method atacar() {
		self.atacarOpenenteEnPosicion(position.left(1))
		self.atacarOpenenteEnPosicion(position.right(1))
	}

	method morir() {
		game.say(self, "Te mataron, perdiste el juego =(")
		self.image("Lapida.png")
		game.sound("BombaMata.mp3")
		game.schedule(4000, { game.stop()})
	}

	method ganarMana() {
		barraMana.quitandoBarraMana()
		self.mana(self.mana() + 50)
		barraMana.insertandoBarraMana(self)
	}


	// Posicionamiento
	method moverIzquierda() {
		if ( game.colliders(self) != [] and game.uniqueCollider(self).puedoTreparlo() ) 
			self.error("Tengo que subir para poder moverme!")
		if (position.x() > 0) {
			posicionAnterior = position
			position = position.left(1)
		}
	}

	method moverDerecha() {
		if ( game.colliders(self) != [] and game.uniqueCollider(self).puedoTreparlo() ) 
			self.error("Tengo que subir para poder moverme!")
		if (position.x() < 17) {
			posicionAnterior = position
			position = position.right(1)
		}
	}

	method subir() {
		if (not (game.colliders(self) != [] and game.uniqueCollider(self).puedoTreparlo())) 
			self.error("No puedo subir!")
		posicionAnterior = position
		position = self.position().up(1)
	}

	method volverAPosicionAnterior() {
		position = posicionAnterior
	}
	
	method lanzarHabilidad() {
			barraMana.quitandoBarraMana()
			barraMana.insertandoBarraMana(self)	
	}

}

object mago inherits Personaje {
	
	var property image = "mago.png"
	// Atributos del personaje
	var property vida = 50
	var property mana = 70
	const property fuerza = 20

	method imagenInicial() = mago_grande

    //mago lanza bola magica ataca 1 esqueleto por vez (mana)
	override method lanzarHabilidad() {
		var enemigosAbatidos = 0
		if (mana>=70){
			mana -=70
			super()
			game.addVisual(bolaMagica)
			game.sound("sonidoBola.mp3")
			game.onTick(10, "movimiento",{bolaMagica.movete()})
			game.onCollideDo(bolaMagica,{ 
				obstaculo => if(self.esEnemigo(obstaculo) and enemigosAbatidos==0){
															obstaculo.serAtacado(100)
															enemigosAbatidos=1 
															bolaMagica.detenerse()
														   }
									})	
			
			}
			else{
				self.error("No tengo mana para la habilidad!")	
			}
		
	}
	
	method esEnemigo(obstaculo) = esqueletosNivel1.hayUnEnemigo(obstaculo) or dragonesNivel2.hayUnEnemigo(obstaculo) 
		         
}

object guerrero inherits Personaje {

	var property image = "guerrero.png"
	// Atributos del personaje
	var property vida = 70
	var property mana = 70
	const property fuerza = 50

	method imagenInicial() = guerrero_grande

	// El Guerrero tiene como habilidad especial la curación
	
	override method lanzarHabilidad() {
		if (mana >= 70) {
			barraVida.quitandoBarraVida()
			vida += 50
			mana -= 70
			barraVida.insertandoBarraVida(self)
			super()
			game.say(self, "Recuperaste 50 de salud!")
		} else {
			game.say(self, "No tengo mana para la habilidad")
		}
	}

}

object orco inherits Personaje {

	var property image = "orco.png"
	// Atributos del personaje
	var property vida = 100
	var property mana = 70
	const property fuerza = 70

	method imagenInicial() = orco_grande

	// El orco tiene la habilidad de saltar a la plataforma de arriba
	
	override method lanzarHabilidad() {
		if (mana >= 70) {
			position = position.up(3)
			game.sound("saltar.mp3")
			mana -= 70
			super()	
		} else {
			game.say(self, "No tengo mana para la habilidad")
		}
	}
	

}

object vikingo inherits Personaje {

	var property image = "vikingo.png"
	// Atributos del personaje
	var property vida = 70
	var property mana = 70
	const property fuerza = 100

	method imagenInicial() = vikingo_grande

// El Vikingo tiene la habilidad de lanzar un hacha

	method proximoPaso() = if (self.position().x() == 0 ) 17
 								else position.x() - posicionAnterior.x()
 	
 	override method lanzarHabilidad(){
 			if(mana>=70){ // Esta validación se repite
 				
 				mana-=70
 				const hacha = new Hacha(position = position)	
  				hacha.serLanzada(self)
  				super()		
 			}
 			else{
 				game.say(self, "No tengo mana para la habilidad") //TODO: Lanzar un error
 			}
 			
 	} 
}

class Hacha{
 	var property image = "hacha.png"
 	var property position
 	
 	method serAtacado(cantidad) {}
 	
 	method chocarContra(personaje) {}
 	
 	method puedoTreparlo() = false
 	
 	method actualizarPosicion(personaje){
 		if (personaje.proximoPaso()>0){position = position.right(1)}
 			else if(self.position().x()==0){ position = game.at(17,position.y())}
 					else {position = position.left(1)}				
 	}

 	method serLanzada(personaje){
 		position = game.at( personaje.position().x() + personaje.proximoPaso()  , personaje.position().y())
 		
		game.addVisual(self)
		game.onCollideDo(self, { obstaculo => obstaculo.serAtacado(100) })
 		game.sound("lanzarHacha.mp3")
 		game.schedule(500, {self.actualizarPosicion(personaje)})
 		game.schedule(1000, {self.actualizarPosicion(personaje)})
 		game.schedule(1500, {self.actualizarPosicion(personaje)})
 		game.schedule(2000, {game.removeVisual(self)})
 	}
 	
}

object bolaMagica{
	var property image = "bolaMagica_.png"
	var property position = game.center()
	
	method serAtacado(cantidad) {}
 	
 	method chocarContra(personaje) {}
 	
 	method puedoTreparlo() = false
 	
 	method movete(){
 		const x=0.randomUpTo(game.width()).truncate(0)
 		const y=0.randomUpTo(game.width()).truncate(0)
 		position= game.at(x,y)
 		
 		
 	}
 	method detenerse(){
 		game.removeVisual(self)
 	} 	
}


