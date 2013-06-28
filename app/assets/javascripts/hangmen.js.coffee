# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", ->
  $('#hangman_solution').on 'keyup', ->
    if($('#copy_changes_to_puzzle').is(':checked')) 
      $('#hangman_puzzle').val($(@).val())

  $('#remove_characters_from_puzzle').on 'click', (e) ->
    e.preventDefault()

    character_to_remove = $('#character_to_remove').val()[0]

    $('#hangman_puzzle')
      .val($('#hangman_puzzle').val()
      .replace(new RegExp(character_to_remove, 'g'), ''))
