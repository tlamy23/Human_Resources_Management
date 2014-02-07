# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  $('.lnk-team-edit.btn.btn-xs').hide()
  $('.lnk-team-remove.btn.btn-xs').hide()
  $.ajax
    type:'GET'
    url: "/teams_new"
    success: (data) ->
      $(".team_new").html( data.view )

  $.ajax
    type:'GET'
    url: "/employees_new"
    success: (data) ->
      $(".employee_new").html( data.view )

  $('.thubnail.btn.btn-info.teams').click ->
    id = this.id
    $('#team_head').text(this.text)
    $('.lnk-team-edit.btn.btn-xs').hide()
    $('.lnk-team-remove.btn.btn-xs').hide()
    $("##{id}.lnk-team-edit.btn.btn-xs").show()
    $("##{id}.lnk-team-remove.btn.btn-xs").show()
    $.ajax
      type:'GET'
      url: "/manage_team/#{id}/teams_content"
      success: (data) ->
        $(".team_employees").html( data.view )
    $.ajax
      type:'GET'
      url: "/teams_edit/#{id}"
      success: (data) ->
        $(".team_edit").html( data.view )

  $('.thubnail.btn.btn-primary.projects').click ->
    id = this.id
    $('#project_head').text(this.text)
    $.ajax
      type:'GET'
      url: "/projects/#{id}/projects_content"
      success: (data) ->
        $("#project_content").html( data.view )

  $(document).on "click",".team_employees .btn.btn-success.collabolator", ->
    id = this.id
    team_id= "null"
    object = this
    $.ajax
      type:'GET'
      url: "/add_remove_team?id=#{id}&team_id=#{team_id}"
      success: ->
        $(object).attr("class","btn btn-warning")
        $('.employees-unassigned').append($(object))

  $(document).on "click",".employees-unassigned .btn.btn-warning", ->
    id = this.id
    team_id= $('.team_id').attr('id')
    object = this
    $.ajax
      type:'GET'
      url: "/add_remove_team?id=#{id}&team_id=#{team_id}"
      success: ->
        $(object).attr("class","btn btn-success collabolator")
        $('.collabolators').append($(object))