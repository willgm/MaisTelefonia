define [
  'models/DddDetails'
  'models/Planos'
], ->

  angular.module 'pages.Planos', [
    'models.DddDetails'
    'models.Planos'
    'ngRoute'
  ]

  .config ($routeProvider) ->
    $routeProvider.when '/planos',
      templateUrl: '/templates/pages/planos.html'
      controllerAs: 'ctrl'
      controller: 'Planos'

  .controller 'Planos', (DddDetails, Planos) ->

    @ddd = DddDetails.get('').$object
    @planos = Planos.get('').$object

    @
