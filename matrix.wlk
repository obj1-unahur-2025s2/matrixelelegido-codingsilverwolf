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
  method esElElegido = false
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
  
  method chocar(){
    pasajeros.forEach({p=> p.saltar()})
    pasajeros.clear()
  }
  
  // método auxiliar
  method pasajerosQueNoSonElegidos () = pasajeros.filter({p = not p.estaElElegido()})
  
  method acelerar (){
    self.pasajerosQueNoSonElegidos().forEach({p => p.saltar()})
  }
}