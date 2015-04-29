require.config

  paths :
    jquery: '/libs/jquery/dist/jquery'
    angular: '/libs/angular/angular'
    ngRoute: '/libs/angular-route/angular-route'
    bootstrap: '/libs/bootstrap/dist/js/bootstrap'
    restangular: '/libs/restangular/dist/restangular'
    underscore: '/libs/underscore/underscore'

  shim:
    jquery:
      exports: 'jQuery'
    angular:
      deps : ['jquery']
      exports: 'angular'
    bootstrap:
      deps : ['jquery']
    ngRoute:
      deps : ['angular']
    restangular:
      deps : ['angular', 'underscore']
