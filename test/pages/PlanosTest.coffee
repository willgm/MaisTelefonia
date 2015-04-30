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
