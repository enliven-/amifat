# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

datetime_picker = ->
	$("#datetime-picker").datetimepicker()
	return

$(document).ready(datetime_picker)
$(document).on('page:load', datetime_picker)