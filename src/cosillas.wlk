import objetosVisuales.*
import wollok.game.*

object barravida{
	const vidas = [vida0,vida10,vida25,vida50,vida75,vida100]
	const manas = [mana0,mana25,mana50,mana75,mana100]
	
	method devolviendoVida(indice)= vidas.get(indice)
	method devolviendoMana(mana)= manas.get(self.calculandoIndiceMana(mana))
	method quitandoBarraMana(mana)=game.removeVisual(self.devolviendoMana(mana))
	method insertandoBarraMana(mana)=game.addVisualIn(self.devolviendoMana(mana),posicionBarras.posicionMana())
	method calculandoIndiceMana(mana) = self.mana120(mana)+ self.mana100(mana) + self.mana75(mana) + self.mana50(mana) + self.mana25(mana)
	
	method mana120(mana) = if(mana == 120) {4} else {0}
	method mana100(mana) = if(mana == 100) {4} else {0}
	method mana75(mana) = if(mana == 70) {3} else {0}
	method mana50(mana) = if(mana == 50) {2} else {0}
	method mana25(mana) = if(mana == 30) {1} else {0}
	
}

object posicionBarras{
	method posicionVida() = game.at(13,14)
	method posicionMana() = game.at(0,14)
}
