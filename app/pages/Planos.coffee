define [], ->

  angular.module 'pages.Planos', [
    'ngRoute'
  ]

  .config ($routeProvider) ->
    $routeProvider.when '/planos',
      templateUrl: '/templates/pages/planos.html'
