import wollok.game.*

class Plataforma{
	const property position 
	const property image = "bloque1_50.png"	
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



