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
  method vitalidad()
}