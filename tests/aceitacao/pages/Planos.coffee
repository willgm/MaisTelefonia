Page = require './Page'

module.exports = class Planos extends Page

  url: @url = '/planos'

  setOrigem: (index=0) ->
    select2Change 'origem', index
    @

  setDestino: (index=0) ->
    select2Change 'destino', index
    @

  setTempo: (keys...) ->
    @maskSendKeys element(By.id 'tempo'), keys...
    @

  getValorPlano: (time) ->
    element(By.className "plano-#{time}")
    .getAttribute 'data-price'

  getValorNormal: ->
    element(By.className 'normal-price')
    .getAttribute 'data-price'
