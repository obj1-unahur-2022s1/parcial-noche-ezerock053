/* Esto asi ```c.aptoVegetariano()==true``` lo consideramos mal. El resultado del método es un booleano y no tiene sentido compararlo con un booleano.

Esto asi ```c.aptoVegetariano()==false``` lo consideramos mal. El resultado del método es un booleano y no tiene sentido compararlo con un booleano.

En ``` elPlatoFuerteCarnivoro() ``` te falto sacar la maximo de la valoración revisa el codigo que te deje.

Esta mal ``` comidasQueLeGustanA(unComensal)  ``` el codigo que entregaste devuelve una lista de true|false
* 
*/


import comidas.*
import comensales.*

object cocina {
	var property parrilla = []
	
	method tieneBuenaOfertaVegetariana() = self.comidasVegetarianas() - self.comidasNoVegetarianas() >= 2
	
	method comidasVegetarianas() = parrilla.count{ c => c.aptoVegetariano() }
	method comidasNoVegetarianas() = parrilla.count{ c => ! c.aptoVegetariano() }
	
	method elPlatoFuerteCarnivoro() = parrilla.filter({ c => ! c.aptoVegetariano() }).max( { c => c.valoracion() })
	
	method comidasQueLeGustanA(unComensal) = parrilla.filter( { c=> unComensal.leAgrada(c)} )
}