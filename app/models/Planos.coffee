define [], ->

  angular.module 'models.Planos', ['restangular']

  .service 'Planos', (Restangular) ->
    Restangular.all 'plans'
