define [
  'pages/Planos'
], ->

  describe 'Planos Controller', ->

    subject = null
    newSubject = ->
      newSub = null
      inject ($controller, $rootScope) ->
        newSub = $controller 'Planos', scope: $rootScope
      newSub

    beforeEach ->
      module 'pages.Planos'
      subject = newSubject()

    it 'deve obter lista com detalhes dos DDD', inject (DddDetails) ->
      spyOn(DddDetails, 'getList').and.returnValue $object: data = {a:1,b:2}
      expect(newSubject().ddd).toBe data

    it 'deve obter lista de planos', inject (Planos) ->
      spyOn(Planos, 'getList').and.returnValue $object: data = {a:1,b:2}
      expect(newSubject().planos).toBe data

    it 'deve obter lista de precos de origem e destino', inject (Precos) ->
      spyOn(Precos, 'getList').and.returnValue $object: data = {a:1,b:2}
      expect(newSubject().precos).toBe data

    describe 'Ao obter preco de origem e destino', ->

      beforeEach inject (Precos) ->
        spyOn(Precos, 'getList').and.returnValue $object: [
          {
            "origin": "011",
            "destiny": "016",
            "price": "1.90"
          },
          {
            "origin": "016",
            "destiny": "011",
            "price": "2.90"
          },
          {
            "origin": "011",
            "destiny": "017",
            "price": "1.70"
          }
        ]
        subject = newSubject()

      it 'deve retornar nulo caso não encontre', inject (Precos) ->
        expect(subject.obterPreco '666', '999').toBeNull()

      it 'deve retornar valor correspondente para cada origem e destino', inject (Precos) ->
        expect(subject.obterPreco '011', '016').toBe 1.9
        expect(subject.obterPreco '016', '011').toBe 2.9
        expect(subject.obterPreco '011', '017').toBe 1.7
