define [
  'app/App'
], (App) ->

  describe 'App', ->

    subject = null

    beforeEach ->
      subject = new App
      module 'MaisTelefonia'

    it 'deve ter um nome padrão', ->
      expect(subject.name).toBe 'MaisTelefonia'

    it 'deve utilizar o nome passado', ->
      subject = new App name: 'minha-app'
      expect(subject.name).toBe 'minha-app'

    it 'deve redirecionar rota não encontrada url de 404 amigavel', inject ($route) ->
      expect($route.routes[null].redirectTo).toEqual '/404'

    it 'deve iniciar no html5 mode por padrão', inject ($location) ->
      expect($location.$$html5).toBeTruthy()

    it 'deve setar html5 mode como false caso configurado para tal', ->
      new App html5Mode: false
      module 'MaisTelefonia'
      inject ($location) -> expect($location.$$html5).toBeFalsy()

    it 'deve iniciar aplicação na raiz do DOM por padrão', ->
      spyOn angular, 'bootstrap'
      subject.start()
      expect(angular.bootstrap).toHaveBeenCalledWith document, [ 'MaisTelefonia' ]

    it 'deve iniciar aplicação no node de DOM passado', ->
      spyOn angular, 'bootstrap'
      subject.start meuDOM = $ 'div'
      expect(angular.bootstrap).toHaveBeenCalledWith meuDOM, [ 'MaisTelefonia' ]

    it 'deve iniciar url da api com valor default', inject (Restangular) ->
      subject.start()
      expect(Restangular.configuration.baseUrl).toBe 'https://private-fe2a-scuptel.apiary-mock.com'

    it 'deve setar url da api com valor configurado', ->
      new App apiBaseUrl: '/api'
      module 'MaisTelefonia'
      inject (Restangular) -> expect(Restangular.configuration.baseUrl).toBe '/api'
