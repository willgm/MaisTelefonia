os = require 'os'

exports.config = ->
  global.protractor = protractor
  global.browser = browser
  global.webdriver = browser.driver
  global.$ = browser.$
  global.$$ = browser.$$
  global.Key = protractor.Key
  global.isOSX = os.platform() is 'darwin'
  Key.COMMAND_CONTROL = if isOSX then Key.COMMAND else Key.CONTROL
  global.TEXTCLEAR = Key.chord(Key.COMMAND_CONTROL, 'a')

  global.select2Change = (select2Id, index=0) ->
    element(By.css "#s2id_#{select2Id} a").click().then ->
      element.all(By.css '.select2-results-dept-0').get(index).click()

  browser.hasAngularJS = (has) ->
    browser.ignoreSynchronization = !has
    return

  webdriver.manage().window().maximize()
  browser.get '/'
