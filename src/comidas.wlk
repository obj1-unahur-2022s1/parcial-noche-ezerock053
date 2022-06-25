/*
 La mejor opción para manejar el peso en las comidas era la siguiente
. método abstracto peso en Plato
. const property peso en Provoleta
. en esAbundante() usar self.peso()
. En los test no hace falta pasarle el peso a las hamburguesas y a la parrillada
 */

/* En Provoleta Valoración() era un método no era un atributo y los metodos debían retornar el valor */

class Plato {
	method peso()
	
	method valoracion()
	
	method esAbundante() = self.peso() > 250
	method aptoVegetariano()
}

class Provoleta inherits Plato {
	var property tieneEspecias
	const property peso
	override method aptoVegetariano() = not tieneEspecias
	method esEspecial() = self.esAbundante() || tieneEspecias
	override method valoracion() = 
		if(self.esEspecial()) 120 else 80
	
}

class HamburguesaDeCarne inherits Plato {
	var property pan
	
	override method peso() = 250
	override method aptoVegetariano() = false
	override method valoracion() = 60 + pan.valoracion()
	
}

object panIndustrial {
	method valoracion() = 0
}

object panCasero {
	method valoracion() = 20
}

object panDeMasaMadre {
	method valoracion() = 45
}

class HamburguesaVegetariana inherits HamburguesaDeCarne {
	var property estaHechaDe
	
	override method aptoVegetariano() = true
	override method valoracion() = super() + (estaHechaDe.size()*2).min(17)
}

class Parrillada inherits Plato {
	var property cortesDeCarne = []
	
	override method peso() = cortesDeCarne.sum{ c => c.peso()}
	override method aptoVegetariano() = false
	override method valoracion() = 0.max(15 * self.maximaCalidadDeLosCortes().calidad() - self.cantidadDeCortes())
	
	method maximaCalidadDeLosCortes() = cortesDeCarne.max{ c => c.calidad()}
	method cantidadDeCortes() = cortesDeCarne.size()
	method agregarCorte(unCorte) = cortesDeCarne.add(unCorte)
}

class Cortes {
	var property nombre
	var property peso
	var property calidad
}










