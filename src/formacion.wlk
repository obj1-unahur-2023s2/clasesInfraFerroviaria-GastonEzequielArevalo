import vagones.*

class Formaciones{
	const formacion = []
	
	method agregarVagon(unVagon){
		formacion.add(unVagon)
	}
	
	method quitarVagon(unVagon){
		formacion.remove(unVagon)
	}
	
	method cantidadDePasajerosQuePuedeLlevar(){
		return formacion.sum({vagon => vagon.cantidadDePasajeros()})
	}
	
	method cantidadDeVagonesPopulares(){
		return formacion.count({vagon => vagon.esPopular()})
	}
	
	method esUnaFormacionCarguera(){
		return formacion.all({vagon => vagon.esCarguero()})
	}
	
	method vagonMasPesado(){
		return formacion.max({vagon => vagon.pesoMaximo()})
	}
	
	method vagonMasLiviano(){
		return formacion.min({vagon => vagon.pesoMaximo()})
	}
	
	method dispercionDePeso(){
		return self.vagonMasPesado().pesoMaximo() - self.vagonMasLiviano().pesoMaximo()
	}
	
	method cantidadDeBanios(){
		return formacion.count({vagon => vagon.tieneBanios()})
	}
	
	method hacerMantenimiento(){
		formacion.forEach({vagon => vagon.hacerMantenimiento()})
	}
	
	method vagonesConPasajeros(){
		return formacion.filter({vagon => vagon.cantidadDePasajeros() > 0})
	}
	
	method vagonConMasPasajeros(){
		return self.vagonesConPasajeros().max({vagones => vagones.cantidadDePasajeros()})
	}
	
	method vagonConMenosPasajeros(){
		return self.vagonesConPasajeros().min({vagones => vagones.cantidadDePasajeros()})
	}
	
	method estaEquilibradaEnPasajeros(){
		return (self.vagonConMasPasajeros().cantidadDePasajeros() - self.vagonConMenosPasajeros().cantidadDePasajeros()) <= 20
	}
}
