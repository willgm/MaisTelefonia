define [], ->

  angular.module 'models.Planos', ['restangular']

  .service 'Planos', (Restangular) ->
    Produtos = Restangular.all 'plans'
