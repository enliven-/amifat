# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'click', '.filter-button', (event) ->
	$.ajax
		url: '/meals/filters'
		type: 'GET'
		data:
			'filter[time][from]': $('#filter-time-from').val()
			'filter[time][to]':   $('#filter-time-to').val()
			'filter[date][from]': $('#filter-date-from').val()
			'filter[date][to]':   $('#filter-date-to').val()
		success: (data, status, xhr) ->
			$('#meals-table').html(data.meals_table)
		error: (status, error) ->
			alert("We experienced an error trying to filter the records. Sorry.")
			
$(document).on 'click', '.clear-filters', (event) ->
	$('.filters').val('')
	$.ajax
		url: '/meals/filters'
		type: 'GET'
		data:
			'filter[time][from]': $('#filter-time-from').val()
			'filter[time][to]':   $('#filter-time-to').val()
			'filter[date][from]': $('#filter-date-from').val()
			'filter[date][to]':   $('#filter-date-to').val()
		success: (data, status, xhr) ->
			$('#meals-table').html(data.meals_table)
		error: (status, error) ->
			alert("We experienced an error trying to filter the records. Sorry.")