# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  #########################
  # Get user location
  #########################
  x = document.getElementById("map")
  getLocation = ->
    if navigator.geolocation
      navigator.geolocation.getCurrentPosition showPosition
    else
      x.innerHTML = "Geolocation is not supported by this browser."
  showPosition = (position) ->
    map.addMarker(
     lat: position.coords.latitude
     lng: position.coords.longitude
     icon: "http://maps.google.com/intl/en_us/mapfiles/ms/micons/blue.png"
    )


  #########################
  # Creating the map
  #########################
  window.map = new GMaps(
    div: '#map'
    lat: 10.9952901
    lng: -74.79057705
  )

  if google.maps
    getLocation()
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


