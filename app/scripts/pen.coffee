define [
	'sketch'
], (Sketch)->
	'use strict'

	class Pen
		constructor: (@color='#ff0000', @width=20)->

		draw: (ctx, touch)->
			ctx.lineCap = 'round'
			ctx.lineJoin = 'round'
			ctx.fillStyle = ctx.strokeStyle = @color
			ctx.lineWidth = @width

			ctx.beginPath()
			ctx.moveTo touch.ox, touch.oy
			ctx.lineTo touch.x, touch.y
			ctx.stroke()
	
