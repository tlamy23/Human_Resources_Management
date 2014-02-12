# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
ready= ->
  if($('#dateToday').length)
    date=document.getElementById('dateToday').value
    $('#li-'+date ).css "background-color", "#FFA500"
    $('.tt').each ->
      strid='#'+this.id.replace 'target','content'
      $(this).popover
        trigger: 'hover',
        html: true,
        content: $(strid).html()
        container: 'body'
$(document).ready(ready)
$(document).on('page:load', ready)


