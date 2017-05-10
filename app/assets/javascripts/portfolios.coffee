# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

prepare = undefined
# Function declaration
prepare = ->
  $('.sortable-items').sortable() # Calling sortable method for the selected element
  return

$(document).ready prepare
