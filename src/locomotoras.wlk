class Locomotoras {
	const property peso
	const property cuantoPesoPuedeArrastrar
	const property velocidadMaxima
	
	method esEficiente(){
		return 5* peso <= cuantoPesoPuedeArrastrar
	}
}
