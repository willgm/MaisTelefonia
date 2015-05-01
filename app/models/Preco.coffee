define [], ->

  class Preco

    calcular: (tempo, plano) ->
      tempo = parseFloat tempo
      price = parseFloat @price
      return price * tempo unless plano
      return 0 if plano.time >= tempo
      Number ((tempo - parseFloat(plano.time)) * price * 1.1).toFixed(2)
