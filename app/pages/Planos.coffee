define [
  'models/DddDetails'
], ->

  angular.module 'pages.Planos', [
    'models.DddDetails'
    'ngRoute'
  ]

  .config ($routeProvider) ->
    $routeProvider.when '/planos',
      templateUrl: '/templates/pages/planos.html'
      controllerAs: 'ctrl'
      controller: 'Planos'

  .controller 'Planos', (DddDetails) ->

    @ddd = DddDetails.get('').$object

    @
