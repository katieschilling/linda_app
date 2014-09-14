# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $('li img').click ->
    src = $(this).attr('src')
    img = "<img src='#{src}' class='img-responsive'/>"

    $('#myModal').modal()
    $('#myModal .modal-body').html(img)

    $('#myModal').on 'hidden.bs.modal', ->
			$('#myModal .modal-body').html ''
