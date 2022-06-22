import comidas.*
import comensales.*

object cocina {
	var property parrilla = []
	
	method tieneBuenaOfertaVegetariana() = self.comidasVegetarianas() - self.comidasNoVegetarianas() >= 2
	
	method comidasVegetarianas() = parrilla.count{ c => c.aptoVegetariano() == true}
	method comidasNoVegetarianas() = parrilla.count{ c => c.aptoVegetariano() == false}
	
	method elPlatoFuerteCarnivoro() = parrilla.filter({ c => c.aptoVegetariano() == false}).max()
	
	method comidasQueLeGustanA(unComensal) = parrilla.map{ c => unComensal.leAgrada(c)}
}