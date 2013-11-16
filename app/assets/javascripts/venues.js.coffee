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
    x = document.getElementById("map")
    getLocation = ->
      if navigator.geolocation
        navigator.geolocation.getCurrentPosition showPosition
      else
        x.innerHTML = "Geolocation is not supported by this browser."
    showPosition = (position) ->
      # Set global varibales latitude and longitud for current user
      window.user_latitude = position.coords.latitude
      window.user_longitude = position.coords.longitude

      map.setCenter(window.user_latitude, window.user_longitude)

      map.addMarker(
       lat: window.user_latitude
       lng: window.user_longitude
       icon: "http://maps.google.com/intl/en_us/mapfiles/ms/micons/blue.png"
      )

    getLocation()
    $.ajax(
      url: "/get_venues.json"
      type: "GET"
      dataType: "json"
      success: (data)->
        venues = data["venues"]
        $.each(venues, (index, value)->
          name = venues[index]["name"]
          address = venues[index]["address"]
          description = venues[index]["description"]
          owner = venues[index]["owner"]
          map.addMarker(
            lat: venues[index]["latitude"]
            lng: venues[index]["longitude"]
            infoWindow:
              content: '<p>'+ name + '</p>'
            click: (e)->
              console.log e.position["ob"]
          )
        )
      error: (data, status, errorThrown) ->
        console.log data
        console.log status
        console.log errorThrown
    )

