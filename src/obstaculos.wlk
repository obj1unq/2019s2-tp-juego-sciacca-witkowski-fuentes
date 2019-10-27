import wollok.game.*

class Skeleton {
	var property image = "skeleton_warrior.png"
	var property position 
	var life = 100
	
	method sufrirDanio(danio) {
		life-=danio
		if(life<=0) {game.removeVisual(self)}
	}
	
}

object esqueletosNivel1{
	const esqueleto1 = new Skeleton (position = game.at(5, 2))
	const esqueleto2 = new Skeleton (position = game.at(3, 5))
	const esqueleto3 = new Skeleton (position = game.at(14, 8))
	const esqueleto4 = new Skeleton (position = game.at(7, 11))
	const listaDeEsqueletos = [esqueleto1,esqueleto2,esqueleto3,esqueleto4] 
	
	method cargarEsqueletos(){
		listaDeEsqueletos.forEach{esqueleto => game.addVisual(esqueleto)}
	}
}
