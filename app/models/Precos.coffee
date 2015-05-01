define [], ->

  angular.module 'models.Precos', ['restangular']

  .service 'Precos', (Restangular) ->
    Restangular
      .all 'ddd/pricing'
