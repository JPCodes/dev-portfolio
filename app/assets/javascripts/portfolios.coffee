# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

prepare = undefined
set_positions = undefined

set_positions = ->
  $('.card').each (i) ->
    # this.attr 'any-attribute-name-you-want', assigned-to-i (value of the card) + increment
    $(this).attr 'data-position', i + 1
    return
  return

prepare = ->
  set_positions() # gives access to each position
  $('.sortable-items').sortable() # Calling sortable method for the selected element
  # e, ui are arguments
  $('.sortable-items').sortable().bind 'sortupdate', (e, ui) -> # sortupdate is part of html sortable
    updated_order = []
    set_positions() # take items that have been sorted and set the data-position
    $('.card').each (i) ->
      updated_order.push # New order
        id: $(this).data('id') # Grab the id from the card, add it into the updated_order array
        position: i + 1 # increments positions, why?
      return
    # communicate to rails
    $.ajax
      type: 'PUT'
      url: '/portfolios/sort' # controller action
      data: order: updated_order # order params hash in controller
    return
  return

$(document).ready prepare

# Summary:
  # 'set_positions' grabs each card and sets it to 'i'; uses data-position as an attribute to store the position
  # 'prepare' will call functions from the html sortable library
    # updated_order will store each item's ID in new order
  # $.ajax communicates with the rails app to perform the database changes
