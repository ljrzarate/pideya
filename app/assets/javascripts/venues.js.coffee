# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  #########################
  # Creating the map
  #########################
  window.map = new GMaps(
    div: '#map'
    lat: 10.9952901
    lng: -74.79057705
  )
