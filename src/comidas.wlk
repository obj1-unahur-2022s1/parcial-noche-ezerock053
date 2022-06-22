class Plato {
	var property peso = 0
	
	var property valoracion = 0
	
	method esAbundante() = peso > 250
	method aptoVegetariano()
}

class Provoleta inherits Plato {
	var property tieneEspecias
	
	override method aptoVegetariano() = not tieneEspecias
	method esEspecial() = self.esAbundante() || tieneEspecias
	override method valoracion(){
		if(self.esEspecial()){
			valoracion = 120
		} else(valoracion =80)
	}
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










