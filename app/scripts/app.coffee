define [
	'jquery'
	'underscore'
	'sketch'
	'./particle'
	'./pen'
], ($, _, Sketch, Particle, Pen)->
	'use strict';

	MAX_PARTICLES = 280

	sketchDemo = ->
		demo = Sketch.create
			container: $('#container').get(0)
			autoclear: false
			retina: true

		particles = []
		garbage = []
		damp = 0.2


		cleanGarbage = ->
			particles = _.filter particles, (particle)->
				particle.alive is true

		demo.setup = ->
			console.log "Sketch ready"
			# demo.globalCompositeOperation  = 'lighter';
			@pen = new Pen()


		demo.update = ->
			# console.log "Updating"
			for particle, index in particles
				particle.move() if particle.alive

			cleanGarbage()

		demo.spawn = (x, y, dx, dy)->
			dx *= damp
			dy *= damp
			newParticle = new Particle x, y, 20, dx, dy
			newParticle.draw demo
			particles.push newParticle

		demo.fade = (ctx)->
			ctx.fillStyle = "rgba(0,0,0, 0.05)"
			ctx.fillRect 0, 0, ctx.canvas.width, ctx.canvas.height


		demo.draw = ->
			demo.globalCompositeOperation  = 'darker';
			demo.fade(demo)
			demo.globalCompositeOperation  = 'lighter';
			particle.draw demo for particle in particles
			

		demo.mousemove = ->
			# $('#deets').text "(#{demo.touches[0].x}, #{demo.touches[0].y})"
			for touch in demo.touches
				@pen.draw demo, touch
				dx = touch.x - touch.ox
				dy = touch.y - touch.oy
				demo.spawn touch.x, touch.y, dx, dy

		demo.start()
				

	sketchDemo