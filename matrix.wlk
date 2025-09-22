object neo {
  var energia = 100
  method esElElegido () = true
  method saltar (){
    energia /= 2
  }
  method vitalidad()= energia * 0.1
}

object morfeo {
  var vitalidad = 8
  var cansado = false

  // polimorfismo
  method esElElegido () = false
  method saltar (){
    vitalidad += 1
    cansado = not cansado
  }
  // elegimos poner un getter por un tema de polimorfismo
  method vitalidad (){
    return vitalidad
  }
  
  // quisimos interpretar que podíamos consultarlo
  method estaCansado () = cansado
  
}

object trinity {
  method vitalidad() = 0
  method saltar (){
    
  }
  method esElElegido () = false
}

object nave {
  const pasajeros= #{neo, morfeo, trinity }
  method cantidadDePasajeros() = pasajeros.size()
  method pasajeroConMayorVitalidad () = pasajeros.max({p => p.vitalidad()})
  
  method estaElElegido() = pasajeros.any({p=> p.esElElegido()})

  method pasajeroConMenorVitalidad () = pasajeros.min({p => p.vitalidad()})

  method pasajeroConVitalidadIntermedia() = pasajeros.filter({p => (p != self.pasajeroConMayorVitalidad()) and (p != self.pasajeroConMenorVitalidad()) }).anyOne()

  method estaEquilibradaEnVitalidad(){
    // Dada la vitalidad y de un pasajero en la nave, debe suceder que y <= 2x, donde x es la vitalidad de otro pasajero. Ordenemos las vitalidades de menor a mayor: m < x < M. Si la nave está equilibrada, en particular M <= 2m. Pero entonces M<= 2m <= 2x. Además trivialmente m <= que el doble de la vitalidad de los demás (porque ya es menor sin el doble). ¿Y x?  Trivialmente x <= 2M, ¿pero es x <= 2m? Ejemplo: 1< 3 < 6. Esta nave está desequilibrada y si hubiésemos comparado sólo las vitalidades mínima y máxima hubiesemos pensado que estaba equilibrada. Luego

    // sólo una ondición necesaria: M <= 2m
    // Condición suficiente M <= 2m y x <= 2m

    return (self.pasajeroConMayorVitalidad().vitalidad() <= 2*self.pasajeroConMenorVitalidad().vitalidad() and self.pasajeroConVitalidadIntermedia() <= 2*self.pasajeroConMenorVitalidad().vitalidad() )

  }
  
  method chocar(){
    pasajeros.forEach({p=> p.saltar()})
    pasajeros.clear()
  }
  
  // método auxiliar
  method pasajerosQueNoSonElegidos () = pasajeros.filter({p => not p.estaElElegido()})
  
  // ¿cuàl hubiese sido la diferencia con un map?
  method acelerar (){
    self.pasajerosQueNoSonElegidos().forEach({p => p.saltar()})
  }
}