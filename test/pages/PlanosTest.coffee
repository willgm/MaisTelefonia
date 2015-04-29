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
      spyOn(DddDetails, 'get').and.returnValue $object: dddList = {a:1,b:2}
      expect(newSubject().ddd).toBe dddList
