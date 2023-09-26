class Pasajero {
	const property largo  
	const property ancho
	const property tieneBanios
	var property estaOrdenado = true
	
	
	method cantidadDePasajeros(){
		const pasajeros = if(ancho <= 3){ 8 * largo}else{10 * largo}
		return if(not estaOrdenado){0.max(pasajeros - 15)}else{pasajeros}
	}
	
	method cantidadMaximaDeCarga(){
		if(tieneBanios){
			return 300
		}
		else{
			return 800
		}
	}
	
	method pesoMaximo(){
		return 2000 + (80 * self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()
	}
	
	method esPopular(){
		return self.cantidadDePasajeros() >= 50
	}
	
	method esCarguero(){
		return self.cantidadMaximaDeCarga() >= 1000
	}
	
	method hacerMantenimiento(){
	 	estaOrdenado = true
	 	return estaOrdenado 
	}
}

class Carga{
	const property cargaMaximaIdeal
	var property cantidadDeMaderasSueltas
	
	method cantidadMaximaDeCarga(){
		return 0.max(cargaMaximaIdeal - (400 * cantidadDeMaderasSueltas))
	}
	
	method cantidadDePasajeros(){
		return 0
	}
	
	method tieneBanios(){
		return false
	}
	
	method pesoMaximo(){
		return 1500 + self.cantidadMaximaDeCarga()
	}
	
	method esPopular(){
		return self.cantidadDePasajeros() >= 50
	}
	
	method esCarguero(){
		return self.cantidadMaximaDeCarga() >= 1000
	}
	
	method hacerMantenimiento(){
	 	cantidadDeMaderasSueltas = 0.max(cantidadDeMaderasSueltas - 2)
	}
}

class Dormitorio{
	const property cantidadDeCompartimientos
	var property cantidadDeCamas
	
	method cantidadDePasajeros(){
		return cantidadDeCompartimientos * cantidadDeCamas
	}
	
	method tieneBanios(){
		return true
	}
	
	method cantidadMaximaDeCarga(){
		return 1200
	}
	
	method pesoMaximo(){
		return 4000 + (80 * self.cantidadDePasajeros()) + self.cantidadMaximaDeCarga()
	}
	
	method esPopular(){
		return self.cantidadDePasajeros() >= 50
	}
	
	method esCarguero(){
		return self.cantidadMaximaDeCarga() >= 1000
	}
	
	method hacerMantenimiento(){
		
	}
}