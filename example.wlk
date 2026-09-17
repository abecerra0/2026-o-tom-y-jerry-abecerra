object casa {
  var nivelSuciedad
  var cuidador
  var quilomberos
  
  method cuidador() = cuidador
  
  method quilomberos() = quilomberos
  
  method nivelSuciedad() = nivelSuciedad
  
  method setNivelSuciedad(nuevoNivel) {
    nivelSuciedad = nuevoNivel
  }

  method aumentarNivelSuciedad(sumarNivel) {
    nivelSuciedad += sumarNivel
  }

  method disminuirNivelSuciedad(restarNivel) {
    nivelSuciedad -= restarNivel
  }
  
  method pasaDia() {
    cuidador.limpiar(self)
    if (quilomberos.length() > 3) {
      cuidador.interrumpirSueño()
    }
    quilomberos.forEach({ quilombero => cuidador.sacarQuilombero(quilombero) })
  }
  
  method sacarQuilombero(quilombero) {
    cuidador.puedeAtrapar(quilombero)
  }
  
  method pasaNoche() {
    if (quilomberos.length() != 0) quilomberos.forEach(
        { quilombero => quilomberos.hacerQuilombo(self) }
      )
  }
}

object tom {
  var energia = 0
  
  method velocidad() = 5 + (self.energia() / 10)
  
  method energia() = energia
  
  method limpiar(casa) {
    casa.disminuirNivelSuciedad(100)
    energia -= 40
  }
  
  method puedeAtrapar(quilombero) {
    quilombero.velocidad() < self.velocidad()
  }
  
  method dormir() {
    energia += 50
  }
  
  method interrumpirSueño() {
    self.energia() - 20
  }
}

object jerry {
  var peso = 0
  
  method velocidad() = 10 - self.peso()
  
  method peso() = peso
  
  method hacerQuilombo(casa) {
    casa.setNivelSuciedad(110)
  }
  
  method robarComida() {
    self.peso() + 1
  }
}

object tuffy {
  var velocidad = 10
  
  method hacerQuilombo(casa) {
    casa.cuidador().interrumpirSueño()
  }
}

object robocat {
  method limpiar(casa) {
    casa.setNivelSuciedad(0)
  }
  
  method puedeAtrapar(quilombero) = true
  
  method dormir() {
    
  }
  
  method interrumpirSueño() {

  }
}

object pandilla {
  var quilomberos = []
  
  method agregarQuilombero(quilombero) {
    quilomberos.push(quilombero)
  }
  
  method quilomberos() = quilomberos
}