# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
	$('.thubnail.btn.btn-info.teams').click ->
		$('#team_head').text(this.text)
		id = this.id
		$.ajax
			type:'GET'
			url: "/teams/#{id}/teams_content"
			success: (data) ->
				$("#team_employees").html( data.view )
			error: (xhr) ->
				errors = $.parseJSON( xhr.responseText ).errors
	$('.thubnail.btn.btn-primary.projects').click ->
		$('#project_head').text(this.text)
		id = this.id
		$.ajax
			type:'GET'
			url: "/projects/#{id}/projects_content"
			success: (data) ->
				$("#project_content").html( data.view )
			error: (xhr) ->
				errors = $.parseJSON( xhr.responseText ).errors