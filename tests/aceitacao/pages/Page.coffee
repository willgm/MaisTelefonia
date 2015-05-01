Q = require 'q'

module.exports = class Page

  url: null
  hasAngularJS: true

  constructor: (go = true)->
    browser.hasAngularJS @hasAngularJS
    @get() if go

  get: -> browser.get @url

  tituloAtual: -> webdriver.getTitle()

  urlAtual: -> webdriver.getCurrentUrl()

  homeLink: ->
    element(By.className 'navbar-brand')
      .click()
    Home = require './Home'
    new Home false

  planosLink: ->
    element(By.className 'planos-link')
      .click()
    Planos = require './Planos'
    new Planos false

  maskSendKeys: (el, keys...) ->
    el.click().then ->
      el.sendKeys keys...

  resetSendKeys: (el, keys...) ->
    el.clear().then ->
      el.sendKeys keys...

  wait: (condicao) ->
    return webdriver.wait condicao if condicao instanceof Function
    @clockPromise condicao

  defer: -> Q.defer()

  clockPromise: (seconds=0.5, result) ->
    d = @defer()
    setTimeout(
      -> d.resolve result
      seconds * 1000
    )
    d.promise

  posicionarMouse: (element) ->
    webdriver
      .actions()
      .mouseMove element
      .perform()
