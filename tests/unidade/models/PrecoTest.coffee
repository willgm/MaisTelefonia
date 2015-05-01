define [
  'models/Preco'
], (Preco) ->

  describe 'Preco Model', ->

    subject = null

    beforeEach ->
      subject = new Preco
      subject.price = 1.9

    it 'deve realizar calculo simples quando não for passado um plano', ->
      expect(subject.calcular 10).toBe 19

    it 'deve calcular valor zerado caso tempo esteja abaixo do tempo do plano', ->
      expect(subject.calcular 10, time:30).toBe 0

    it 'deve calcular valor zerado caso tempo seja igual ao tempo do plano', ->
      expect(subject.calcular 30, time:30).toBe 0

    it 'deve calcular valor extra acima do tempo do plano quando exeder', ->
      expect(subject.calcular 130, time:30).toBe 209

    it 'deve calcular calcular corretamente mesmo recebendo parametros como string', ->
      expect(subject.calcular "9", time:"30").toBe 0
