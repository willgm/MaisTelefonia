define [
  'models/Preco'
  'models/Precos'
], (Preco) ->

  describe 'Precos Collection', ->

    subject = null

    beforeEach ->
      module 'models.Precos'
      inject (Precos) -> subject = Precos

    it 'deve utilizar o modelo de Preco para cada um dos modelos de sua lista', inject ($httpBackend) ->
      $httpBackend.expectGET("/#{subject.route}/1").respond {}
      m = subject.get(1).$object
      $httpBackend.flush()
      expect(m.calcular).toBe Preco::calcular
