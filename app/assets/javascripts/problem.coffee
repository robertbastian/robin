# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$ -> 
	# For main page
	$('.rating-slider').slider()
	# For new page
	$('#reload').click -> 
		reload()
		false
	# This is really cool, but GitHub's API is limited to 60 req/h :(
	$('#text').on 'keypress', (e) ->
		# If newline
		if e.which == 13
			reload()
		true

reload = ->	$.ajax {
			    type: "POST",
			    dataType: "html",
			    processData: false,
			    url: "https://api.github.com/markdown/raw",
			    username: 'robertbastian',
			    data: $('#text').val(),
			    contentType: "text/plain",
			    success: (data) -> $('.well').html(data), 
			    error: (jqXHR, textStatus, error) -> console.log(jqXHR, textStatus, error)
			}
