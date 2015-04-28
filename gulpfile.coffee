gulp = require "gulp"
watch = require "gulp-watch"
connect = require "gulp-connect"
less = require "gulp-less"
coffee = require "gulp-coffee"
plumber = require "gulp-plumber"
bodyParser = require "body-parser"

server = (livereload=false) ->
  connect.server
    root: process.env.FILEPATH || "./build"
    livereload: livereload
    port: process.env.PORT || 5000
    middleware: -> [
      bodyParser(),
      (req, res, next) ->
        #direcionando todas as requisições que nâo sejam de arquivos para o angular em modo html5
        fileName = req.url.split("/").pop()
        req.url = '/index.html' if fileName?.indexOf(".") is -1
        next()
    ]

gulp.task "liveload", ["compile"], ->
  server true
  gulp.start "watch"

gulp.task "connect", ["compile"], ->
  server()

gulp.task "less", ->
  gulp.src "./less/**/*.less"
    .pipe plumber
      errorHandler: (err) ->
        console.log 'Less Error:', err.message
        @emit 'end'
    .pipe less()
    .pipe connect.reload()
    .pipe gulp.dest "./build/styles"

gulp.task "coffee", ->
  gulp.src "./app/**/*.coffee"
    .pipe plumber()
    .pipe coffee()
    .pipe connect.reload()
    .pipe gulp.dest "./build/scripts"

gulp.task "templates", ->
  gulp.src "*.html"
    .pipe connect.reload()
    .pipe gulp.dest "./build"

  gulp.src "./templates/**/*.html"
    .pipe connect.reload()
    .pipe gulp.dest "./build/templates"

gulp.task "compile", ["less", "coffee", "templates"]

gulp.task "watch", ->
  watch "*.html", -> gulp.start "templates"
  watch "./less/**/*.less", -> gulp.start "less"
  watch "./app/**/*.coffee", -> gulp.start "coffee"
  watch "./templates/**/*.html", -> gulp.start "templates"

gulp.task "default", ["liveload"]
