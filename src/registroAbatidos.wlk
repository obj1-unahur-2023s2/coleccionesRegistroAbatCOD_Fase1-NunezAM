object registroAbatidosCOD {
	const registroAbatidos = []
	const registroDias = []
	
	method agregarAbatidosDia(cantidad, dia) {
		if(registroDias.contains(dia)) {
			const pos = self.posicionDelDia(dia)
			(0..registroDias.size()-1).forEach({i => if(i == pos) {registroAbatidos.get(i) + cantidad} })
		}
		else {
			registroAbatidos.add(cantidad)
			registroDias.add(dia)
		}
		
	}
	
	method agregarAbatidosVariosDias(cantidades, dias) {
		if( !registroDias.asSet().intersection(dias.asSet().isEmpty()) ) {
			self.error("Ya existe uno de los dias que se quiere agregar")
		}
		else {
		registroAbatidos.addAll(cantidades)
		registroDias.add(dias)
		}
	}
	
	method posicionDelDia(dia) {
		var posicion
		(0..registroDias.size() - 1).forEach({i => if(registroDias.get(i) == dia) posicion = i})
		
		return posicion
	}
	
	method eliminarElRegistroDelDia(dia) {
		if(!registroDias.contains(dia)) {
			self.error("El dia no existe")
		}
		else {
			registroAbatidos.remove(self.cantidadDeAbatidosElDia(dia))
			registroDias.remove(dia)
		}
	}
	
	method eliminarLosRegistrosDeDias(dias) {
		dias.forEach({dia => self.eliminarElRegistroDelDia(dia)})
	}
	
	method cantidadDeDiasRegistrados() = registroDias.size()
	method estaVacioElRegistro() = registroDias.isEmpty()
	method algunDiaAbatio(cantidad) = registroAbatidos.contains(cantidad)
	method primerValorDeAbatidos() = registroAbatidos.first()
	method ultimoValorDeAbatidos() = registroAbatidos.last()
	method maximoValorDeAbatidos() = registroAbatidos.max()
	method totalAbatidos() = registroAbatidos.sum()
	method cantidadDeAbatidosElDia(dia) = registroAbatidos.get(self.posicionDelDia(dia))
	method ultimoValorDeAbatidosConSize() = registroAbatidos.get(registroAbatidos.size() - 1)
	method diasConAbatidosSuperioresA(cuanto) = registroDias.filter({dia => self.cantidadDeAbatidosElDia(dia) > cuanto})
	method valoresDeAbatidosPares() = registroAbatidos.filter({abatidos => abatidos.even()})
	method elValorDeAbatidos(cantidad) = registroAbatidos.find({abatidos => abatidos == cantidad})
	method abatidosSumando(cantidad) = registroAbatidos.map({abatidos => abatidos + cantidad})
	method abatidosEsAcotada(n1,n2) = registroAbatidos.all({abatidos => abatidos.between(n1,n2)})
	method algunDiaAbatioMasDe(cantidad) = registroAbatidos.any({abatidos => abatidos > cantidad})
	method todosLosDiasAbatioMasDe(cantidad) = registroAbatidos.all({abatidos => abatidos > cantidad})
	method cantidadAbatidosMayorALaPrimera() = registroAbatidos.count({abatidos => abatidos > registroAbatidos.first()})
	
	method esCrack() {
		return if(registroAbatidos.isEmpty()) {
			self.error("No hay registro de abatidos")
		}
		else if(registroAbatidos.size() < 2) {
			false
		}
		else {
			(1..registroAbatidos.size()-1).all({i => registroAbatidos.get(i) > registroAbatidos.get(i - 1)})
		}
	}


/*Puntos desafio
 * 
	method agregarAbatidosDiaMod(cantidad,dia) {
		if(diasAbatidos.contains(dia)) {
			const pos = self.posicionDelDia(dia)
			cantAbatidos = (0..cantAbatidos.size()-1).map({
				i => if(i==pos) cantAbatidos.get(i) + cantidad else cantAbatidos.get(i)
			})
		}
		else {
			cantAbatidos.add(cantidad)
			diasAbatidos.add(dia)
		}
	}
	
	method ordenarRegistro() {
		if(cantAbatidos.size()>=2) {
			const indice = (0..diasAbatidos.size()-1).map({i=>i})
			indice.sortBy({a,b => diasAbatidos.get(a) < diasAbatidos.get(b)})
			cantAbatidos = indice.map({i => cantAbatidos.get(i)})
			diasAbatidos = indice.map({i => diasAbatidos.get(i)})
		}
	}
	
	method esCrackPlus() {
		self.ordenarRegistro()
		if(cantAbatidos.isEmpty()) self.error("No hay ningún registro de abatidos")
		if (cantAbatidos.size()<2) return false
		else return (1..cantAbatidos.size()-1).all({i => cantAbatidos.get(i) > cantAbatidos.get(i-1)})
	}

}
* 
* 
*/

}






























