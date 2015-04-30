define [], ->

  angular.module 'models.Precos', ['restangular']

  .service 'Precos', (Restangular) ->
    Produtos = Restangular.all 'ddd/pricing'
