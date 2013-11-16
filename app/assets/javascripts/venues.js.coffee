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

  if google.maps
    $.ajax(
      url: "/get_venues.json"
      type: "GET"
      dataType: "json"
      success: (data)->
        console.log data["venues"][0]["name"]
        venues = data["venues"]
        $.each(venues, (index, value)->
          map.addMarker(
            lat: venues[index]["latitude"]
            lng: venues[index]["longitude"]
          )
        )
      error: (data, status, errorThrown) ->
        console.log data
        console.log status
        console.log errorThrown
    )
