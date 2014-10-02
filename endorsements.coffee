# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
#


$(document).ready ->
  $('.endorsements_link').on('click', (event)->
    event.preventDefault()
    console.log(endorsementCount)
    endorsementCount = $(@).siblings '.endorsements'
    console.log(@)
    $.post(@.href, (response)->
      console.log(response)
      console.log(response.new_endorsement_count)
      console.log(endorsementCount)
      $(endorsementCount).text response.new_endorsement_count
    )
  )



