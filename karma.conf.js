
module.exports = function(config) {
  config.set({

    basePath: '',

    frameworks: ['jasmine', 'requirejs'],

    files: [
      'build/libs/jquery/dist/jquery.js',
      'build/libs/angular/angular.js',
      'build/libs/angular-route/angular-route.js',
      'build/libs/angular-mocks/angular-mocks.js',
      'build/libs/bootstrap/dist/js/bootstrap.js',
      'build/libs/restangular/dist/restangular.js',
      'build/libs/underscore/underscore.js',
      'build/libs/select2/select2.js',
      'build/libs/angular-ui-select2/src/select2.js',
      'build/libs/angular-mask/dist/ngMask.js',
      {pattern: 'build/scripts/**/*.js', included: false},
      {pattern: 'tests/**/*.coffee', included: false},
      'tests/unidade/main.js'
    ],

    exclude: [
    ],

    preprocessors: {
      '**/*.coffee': ['coffee']
    },

    // test results reporter to use
    // possible values: 'dots', 'progress'
    // available reporters: https://npmjs.org/browse/keyword/karma-reporter
    reporters: ['progress'],

    // web server port
    port: 9876,

    // enable / disable colors in the output (reporters and logs)
    colors: true,

    // level of logging
    // possible values: config.LOG_DISABLE || config.LOG_ERROR || config.LOG_WARN || config.LOG_INFO || config.LOG_DEBUG
    logLevel: config.LOG_INFO,

    // enable / disable watching file and executing tests whenever any file changes
    autoWatch: true,

    // start these browsers
    // available browser launchers: https://npmjs.org/browse/keyword/karma-launcher
    browsers: ['Chrome'],

    // Continuous Integration mode
    // if true, Karma captures browsers, runs the tests and exits
    singleRun: false
  });
};
