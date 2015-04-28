define [], ->

  angular.module 'pages.NotFound', [
    'ngRoute'
  ]

  .config ($routeProvider) ->
    $routeProvider.when '/404',
      templateUrl: '/templates/pages/404.html'
