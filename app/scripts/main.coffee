require.config
  paths:
    jquery: "../components/jquery/jquery"
    bootstrap: "./vendor/bootstrap"
    sketch: "../components/sketch.js/js/sketch.min"
    underscore: "../components/underscore/underscore-min"

  shim:
    bootstrap:
      deps: ["jquery"]
      exports: "jquery"
    sketch:
      exports: "Sketch"
    underscore:
      exports: "_"

require ["app", "jquery", "bootstrap", "sketch"], (app, $, boots, asketch) ->
  "use strict"
  window.mySketch = asketch
  # use app here
  app()