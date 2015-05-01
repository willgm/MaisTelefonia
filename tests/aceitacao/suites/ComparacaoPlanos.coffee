Planos = require '../pages/Planos'

describe 'Calculo de Planos', ->

  page = null

  beforeEach ->
    page = new Planos

  it 'deve mostrar corretamente os valores de cada plano', ->
    page
    .setOrigem()
    .setDestino(1)
    .setTempo 111
    expect(page.getValorPlano(30)).toBe '169.29'
    expect(page.getValorPlano(60)).toBe '106.59'
    expect(page.getValorPlano(120)).toBe '0.00'
    expect(page.getValorNormal()).toBe '210.90'
