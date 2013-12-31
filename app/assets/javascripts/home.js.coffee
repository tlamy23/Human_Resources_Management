# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$(document).ready ->
  reload()

$(document).mouseover ->
  reload()

reload= ->
  date=document.getElementById('dateToday').value
  $('#td'+date ).css "background-color", "#FFA500"
  $('.tt').each ->
    strid='#'+this.id.replace 'target','content'
    $(this).popover
      trigger: 'hover',
      html: true,
      content: $(strid).html()