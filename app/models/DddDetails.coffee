define [], ->

  angular.module 'models.DddDetails', ['restangular']

  .service 'DddDetails', (Restangular) ->
    Produtos = Restangular.all 'ddd/details'
