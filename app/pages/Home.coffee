define [], ->

  angular.module 'pages.Home', [
    'ngRoute'
  ]

  .config ($routeProvider) ->
    $routeProvider.when '/',
      templateUrl: '/templates/pages/home.html'
