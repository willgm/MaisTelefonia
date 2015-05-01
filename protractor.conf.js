"use strict";

require('coffee-script');

var prepare = require('./tests/aceitacao/prepare');

global.defaultTimeout = 120000;

exports.config = {
  allScriptsTimeout: defaultTimeout,

  specs: [
   'tests/aceitacao/suites/*.coffee'
  ],

  suites: {
  },

  capabilities: {
    'browserName': 'chrome'
  },

  baseUrl: 'http://localhost:5000/',

  framework: 'jasmine2',

  jasmineNodeOpts: {
    showColors: true,
    defaultTimeoutInterval: defaultTimeout
  },

  onPrepare: prepare.config

};
