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
		id = this.id
		$('#project_head').text(this.text)
		$.ajax
			type:'GET'
			url: "/projects/#{id}/projects_content"
			success: (data) ->
				$("#project_content").html( data.view )
			error: (xhr) ->
				errors = $.parseJSON( xhr.responseText ).errors


	$(document).on "click","#team_employees .btn.btn-success", ->
		id = this.id
		team_id= "null"
		object = this
		$.ajax
			type:'GET'
			url: "/add_remove_team?id=#{id}&team_id=#{team_id}"
			success: ->
				$(object).attr("class","btn btn-warning")
				$('.employees-unassigned').append($(object))
			error: (xhr) ->
				errors = $.parseJSON( xhr.responseText ).errors

	$(document).on "click",".employees-unassigned .btn.btn-warning", ->
		id = this.id
		team_id= $('.team_id').attr('id')
		object = this
		$.ajax
			type:'GET'
			url: "/add_remove_team?id=#{id}&team_id=#{team_id}"
			success: ->
				$(object).attr("class","btn btn-success")
				$('.collabolators').append($(object))
			error: (xhr) ->
				errors = $.parseJSON( xhr.responseText ).errors