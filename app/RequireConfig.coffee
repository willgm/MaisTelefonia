require.config

  paths :
    jquery: '/libs/jquery/dist/jquery'
    angular: '/libs/angular/angular'
    ngRoute: '/libs/angular-route/angular-route'
    bootstrap: '/libs/bootstrap/dist/js/bootstrap'
    restangular: '/libs/restangular/dist/restangular'
    underscore: '/libs/underscore/underscore'
    select2: '/libs/select2/select2'
    uiSelect2: '/libs/angular-ui-select2/src/select2'

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
    select2:
      deps : ['jquery']
    uiSelect2:
      deps : ['angular', 'select2']
