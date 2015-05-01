define [
  'models/DddDetails'
  'models/Planos'
  'models/Precos'
], ->

  angular.module 'pages.Planos', [
    'models.DddDetails'
    'models.Planos'
    'models.Precos'
    'ui.select2'
    'ngRoute'
  ]

  .config ($routeProvider) ->
    $routeProvider.when '/planos',
      templateUrl: '/templates/pages/planos.html'
      controllerAs: 'ctrl'
      controller: 'Planos'

  .filter 'parseInt', -> (v) -> parseInt v

  .controller 'Planos', (DddDetails, Planos, Precos) ->

    @ddd = DddDetails.getList().$object
    @planos = Planos.getList().$object
    @precos = Precos.getList().$object

    @obterPreco = (origem, destino) ->
      @precos
        .filter (p) -> p.origin is origem and p.destiny is destino
        .pop()

    @
