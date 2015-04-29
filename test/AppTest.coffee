define [
  'app/App'
], (App) ->

  describe 'App', ->

    subject = null

    beforeEach ->
      subject = new App
      module 'ScupFaleMais'

    it 'deve ter um nome padrão', ->
      expect(subject.name).toBe 'ScupFaleMais'

    it 'deve utilizar o nome passado', ->
      subject = new App name: 'minha-app'
      expect(subject.name).toBe 'minha-app'

    it 'deve redirecionar rota não encontrada url de 404 amigavel', inject ($route) ->
      expect($route.routes[null].redirectTo).toEqual '/404'

    it 'deve iniciar no html5 mode por padrão', inject ($location) ->
      expect($location.$$html5).toBeTruthy()

    it 'deve setar html5 mode como false caso configurado para tal', ->
      new App html5Mode: false
      module 'ScupFaleMais'
      inject ($location) -> expect($location.$$html5).toBeFalsy()

    it 'deve iniciar aplicação na raiz do DOM por padrão', ->
      spyOn angular, 'bootstrap'
      subject.start()
      expect(angular.bootstrap).toHaveBeenCalledWith document, [ 'ScupFaleMais' ]

    it 'deve iniciar aplicação no node de DOM passado', ->
      spyOn angular, 'bootstrap'
      subject.start meuDOM = $ 'div'
      expect(angular.bootstrap).toHaveBeenCalledWith meuDOM, [ 'ScupFaleMais' ]
