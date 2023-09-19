object registroAbatidos {
	const registroAbatidos = []
	
	method dia(reg) = reg.last()
	method cant(reg) = reg.first()
	method yaEstaElDia(dia) = registroAbatidos.any({reg => self.dia(reg) == dia})
	method registroDia(dia) = registroAbatidos.find({reg => self.dia(reg) == dia}) 
	method registroDias(reg) = reg.map({r => self.dia(r)})
	
	method agregarAbatidosDia(cantidad, dia) {
		if(self.yaEstaElDia(dia)) {
			self.error("El dia ya está ingresado")
		}
		registroAbatidos.add([cantidad,dia])
		
	}
	
	method agregarAbatidosVariosDias(lista) {
		if(lista.any( {reg => self.yaEstaElDia(self.dia(reg))} )) {
			self.error("Un dia de la lista ya está ingresado")
		}
		registroAbatidos.addAll(lista)
	}
	
	method eliminarElRegistroDelDia(dia) {
		if(!self.yaEstaElDia(dia)) {
			self.error("El dia no esta en el registro")
		}
		registroAbatidos.remove(dia)
	}
	
	method eliminarLosRegistrosDeDias(listaDias) {
		if(!listaDias.any( {d => self.yaEstaElDia(d)} )){
			self.error("Uno de los dias a remover no está en el registro")
		}
		registroAbatidos.forEach({dia => self.eliminarElRegistroDelDia(dia)})
	}
	
	method cantidadDeDiasRegistrados() = registroAbatidos.size()
	method estaVacioElRegistro() = registroAbatidos.isEmpty()
	method algunDiaAbatio(cantidad) = registroAbatidos.any({reg => self.cant(reg) == cantidad})
	method primerValorDeAbatidos() = self.cant(registroAbatidos.first())
	method ultimoValorDeAbatidos() = self.cant(registroAbatidos.last())
	method maximoValorDeAbatidos() = self.cant(registroAbatidos.max({reg => self.cant(reg)}))
	method totalAbatidos() = registroAbatidos.sum({reg => self.cant(reg)})
	method cantidadDeAbatidosElDia(dia) {
		return if(!self.yaEstaElDia(dia)) {
			self.error("El dia indicado no está en el registro")
		}
		else {
			self.cant(self.registroDia(dia))
		}	
	}
	method ultimoValorDeAbatidosConSize() = self.cant(registroAbatidos.get(registroAbatidos.size() - 1))
	method diasConAbatidosSuperioresA(cuanto) = registroAbatidos.filter({reg => self.cant(reg) > cuanto}).
												map({reg => self.dia(reg)})
	method valoresDeAbatidosPares() = registroAbatidos.filter({reg => self.cant(reg).even()}).map({r=>self.cant(r)})
	method elValorDeAbatidos(cantidad)  = registroAbatidos.find({reg => self.cant(reg) == cantidad})
	method abatidosSumando(cantidad) = registroAbatidos.map({reg => self.cant(reg) + cantidad})
	method abatidosEsAcotada(n1,n2) = registroAbatidos.all({reg => self.cant(reg).betwenn(n1,n2)})
	method algunDiaAbatioMasDe(cantidad) = registroAbatidos.any({reg => self.cant(reg) > cantidad})
	method todosLosDiasAbatioMasDe(cantidad) = registroAbatidos.all({reg => self.cant(reg) > cantidad})
	method cantidadAbatidosMayorALaPrimera() = registroAbatidos.count({reg => self.cant(reg) > 
																				self.cant(registroAbatidos.first())})
	method esCrack() { 
		return if(self.estaVacioElRegistro()) {
			 self.error("el registro está vacío")
		}
		else if(registroAbatidos.size() < 2) {
			 false
		}
		else {
			 (1..registroAbatidos.size() - 1).all({i => self.cant(registroAbatidos.get(i)) >
															  self.cant(registroAbatidos.get(i - 1))})
													
		}
																	
	}
	
	method agregarAbatidosDiaPlus(cantidad, dia) {
		if(self.yaEstaElDia(dia)) {
			const regi = self.registroDia(dia)
			self.eliminarElRegistroDelDia(dia)
			self.agregarAbatidosDia(self.cant(regi) + cantidad, dia)
		}
		else {
			self.agregarAbatidosDia(cantidad, dia)
		}
	}
	
	method ordenarRegistro() {
		if(registroAbatidos.size() >= 2) {
			registroAbatidos.sortBy({a,b => self.dia(a) < self.dia(b)})
		}
	}
	
	method esCrackPlus() {
		self.ordenarRegistro() 
		return if(self.estaVacioElRegistro()) {
			 self.error("el registro está vacío")
		}
		else if(registroAbatidos.size() < 2) {
			 false
		}
		else {
			 (1..registroAbatidos.size() - 1).all({i => self.cant(registroAbatidos.get(i)) >
															  self.cant(registroAbatidos.get(i - 1))})
													
		}
	}
																
}









