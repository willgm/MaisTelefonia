Planos = require '../pages/Planos'

describe 'Calculo de Planos', ->

  page = null

  beforeEach ->
    page = new Planos

  it 'deve mostrar corretamente os valores de um plano', ->
    page
    .setOrigem()
    .setDestino(1)
    .setTempo 111
    expect(page.getValorPlano(30)).toBe '169.29'
    expect(page.getValorPlano(60)).toBe '106.59'
    expect(page.getValorPlano(120)).toBe '0.00'
    expect(page.getValorNormal()).toBe '210.90'

  it 'deve mostrar quando plano escolhido não existir', ->
    page
    .setOrigem(1)
    .setDestino(2)
    .setTempo 111
    expect(page.planoSemValor(30)).toBeTruthy()
    expect(page.planoSemValor(60)).toBeTruthy()
    expect(page.planoSemValor(120)).toBeTruthy()
    expect(page.precoNormalSemValor()).toBeTruthy()
