define [], ->

  angular.module 'models.DddDetails', ['restangular']

  .service 'DddDetails', (Restangular) ->
    Restangular.all 'ddd/details'
