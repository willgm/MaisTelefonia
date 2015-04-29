define [
  "pages/Home"
  "pages/Planos"
  "pages/NotFound"
], ->

  class App

    name: 'ScupFaleMais'
    html5Mode: true
    apiBaseUrl: 'http://private-fe2a-scuptel.apiary-mock.com'

    constructor: (options) ->
      @[key] = value for own key, value of options

      angular.module @name, [
        'pages.Home'
        'pages.Planos'
        'pages.NotFound'
        'restangular'
      ]

      .config ($routeProvider, $locationProvider, RestangularProvider) =>
        RestangularProvider.setBaseUrl @apiBaseUrl
        $routeProvider.otherwise redirectTo: '/404'
        $locationProvider.html5Mode
          enabled: @html5Mode
          requireBase: false

    start: (at = document) ->
      angular.bootstrap at, [@name]
