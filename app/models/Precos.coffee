define [
  'models/Preco'
], (Preco) ->

  angular.module 'models.Precos', ['restangular']

  .service 'Precos', (Restangular) ->
    Restangular
      .extendModel 'ddd/pricing', (m) -> _.extend m, Preco::
      .all 'ddd/pricing'
