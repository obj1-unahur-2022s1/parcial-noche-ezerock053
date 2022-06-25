/*
 * En el  ```estaSastifecho()``` de Vegetarianos y DePaladarFino te falto el super()  y además en la condicion especial de Vegetarianos, la negacion va en el dentro del closuere
 */
import comidas.*

class Comensales {
	const property peso
	var property comidasQueComio = []
	
	method leAgrada(unaComida)
	method comer(unaComida) = comidasQueComio.add(unaComida)
	method estaSastifecho() = comidasQueComio.sum{c => c.peso()} >= self.unoPorcientoDeSuPeso()
	method unoPorcientoDeSuPeso() = 0.01 * peso
}

class Vegetarianos inherits Comensales{
	
	override method leAgrada(unaComida) = unaComida.aptoVegetariano() == true && unaComida.valoracion() > 85
	override method estaSastifecho() = super() and comidasQueComio.all{ c => not c.esAbundante()}
}

class HambrePopular inherits Comensales {
	override method leAgrada(unaComida) = unaComida.esAbundante()
}

class DePaladarFino inherits Comensales {
	
	override method leAgrada(unaComida) = unaComida.peso().between(150,300) && unaComida.valoracion() > 100
	override method estaSastifecho() = super() and comidasQueComio.size().even()
}





