object pepita {
	var energia = 100
	
	method comer(comida) {
		energia = energia + comida.energiaQueAporta()
	}

	method validarSiPuedeVolar(distancia) {
		if (energia < 10 + distancia) {
			self.error("La energia del ave, que es " + energia + ", es menor a la energia que gasta al volar la distancia dada.")
		}
	}
	
	method volar(distancia) {
		self.validarSiPuedeVolar(distancia)
		energia = energia - 10 - distancia
	}
		
	method energia() {
		return energia
	}
}

object alpiste {
	method energiaQueAporta() {
		return 20
	}
}

object manzana {
	var madurez = 1
	const base = 5
	
	method madurez() {
		return madurez
	}
	
	method madurez(_madurez) {
		madurez = _madurez
	}
	
	method madurar() {
		self.madurez(madurez + 1)
	}
	
	method energiaQueAporta() {
		return base * madurez
	}
	
}

object pepon {
	var energia = 30
	
	method energia() {
		return energia
	}
		
	method comer(comida) {
		energia += energia + comida.energiaQueAporta() / 2
	}
	
	method validarSiPuedeVolar(distancia) {
		if (energia < 20 + 2*distancia) {
			self.error("La energia del ave, que es " + energia + ", es menor a la energia que gasta al volar la distancia dada.")
		}
	}

	method volar(distancia) {
		self.validarSiPuedeVolar(distancia) 
		energia = energia - 20 - 2*distancia
	}
	
}

object roque {
	var ave = pepita
	var cenas = 0;
	
	method ave(_ave) {
		ave = _ave
		cenas = 0
	}
	
	method alimentar(alimento) {
		ave.comer(alimento)
		cenas = cenas + 1
	}
}

object milena {
	const aves = #{pepita, pepon}

	method movilizar(distancia) {
		aves.forEach({ave => ave.validarSiPuedeVolar(distancia)})
		aves.forEach({ave => ave.volar(distancia)})
	}
}