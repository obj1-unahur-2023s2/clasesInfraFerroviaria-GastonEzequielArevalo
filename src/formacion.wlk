import vagones.*
import locomotoras.*

class Formaciones{
	const formacion = []
	const locomotoras = []
	
	method agregarVagon(unVagon){
		formacion.add(unVagon)
	}
	
	method agregarLagon(unaLocomotora){
		locomotoras.add(unaLocomotora)
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
	
	method estaOrganizado(){
		return not(1..formacion.size() - 1).any{
			idx => not formacion.get(idx - 1).esPopular() and formacion.get(idx).esPopular()
		}
	}
	
	method velocidadMaxima(){
		return locomotoras.min{locomotora => locomotora.velocidadMaxima()}.velocidadMaxima()
	}
	
	method esEficiente(){
		return locomotoras.all({locomotora => locomotora.esEficiente()})
	}
	
	method pesoDeLosVagones(){
		return formacion.sum({f => f.pesoMaximo()})
	}
	
	method pesoDeLasLocomotoras(){
		return locomotoras.sum({l => l.peso()})
	}
	
	method pesoMaximoDeLaFormacion(){
		return self.pesoDeLosVagones() + self.pesoDeLasLocomotoras()
	}
	
	method sumaDelArrastre(){
		return locomotoras.sum({l => l.cuantoPesoPuedeArrastrar()})
	}
	
	method puedeMoverse(){
		return self.sumaDelArrastre() >= self.pesoMaximoDeLaFormacion()
	}
	
	method kilosDeEmpujeQueFaltan(){
		return 0.max(self.pesoMaximoDeLaFormacion() - self.sumaDelArrastre())
	}
	
	
}


