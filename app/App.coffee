define [
  "pages/Home"
  "pages/NotFound"
], ->

  class App

    name: 'ScupFaleMais'
    html5Mode: true

    constructor: (options) ->
      @[key] = value for own key, value of options

      angular.module @name, [
        'pages.Home'
        'pages.NotFound'
      ]

      .config ($routeProvider, $locationProvider) =>
        $routeProvider.otherwise redirectTo: '/404'
        $locationProvider.html5Mode
          enabled: @html5Mode
          requireBase: false

    start: (at = document) ->
      angular.bootstrap at, [@name]
