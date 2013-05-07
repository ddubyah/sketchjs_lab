require.config
  paths:
    jquery: "../components/jquery/jquery"
    bootstrap: "vendor/bootstrap"
    sketch: "vendor/sketch.min"
    underscore: "../components/underscore/underscore-min"

  shim:
    bootstrap:
      deps: ["jquery"]
      exports: "jquery"
    sketch:
      exports: "Sketch"
    underscore:
      exports: "_"

require ["app", "jquery", "bootstrap", "sketch"], (app, $, boots, sketch) ->
  "use strict"
  
  # use app here
  app()