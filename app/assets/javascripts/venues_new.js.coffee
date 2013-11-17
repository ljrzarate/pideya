# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

jQuery ->
  #########################
  # Creating the map
  #########################
  window.map = new GMaps(
    div: '#map_new_venue'
    lat: 10.9952901
    lng: -74.79057705
    click: (e)->
      $("#venue_latitude").val(e.latLng.lat())
      $("#venue_longitude").val(e.latLng.lng())
      map.addMarker(
        icon: 'http://google.com/mapfiles/ms/micons/lightblue.png'
        lat: e.latLng.lat()
        lng: e.latLng.lng()
        draggable: true
        drag: (e)->
          $("#sensor_latitude").val(e.latLng.lat())
          $("#sensor_longitude").val(e.latLng.lng())
      )
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
       icon: "http://i.imgur.com/6eTaWvP.png"
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
          phone = venues[index]["phone"]
          map.addMarker(
            lat: venues[index]["latitude"]
            lng: venues[index]["longitude"]
            icon: "http://i.imgur.com/FMIyHFD.png"
          )
        )
      error: (data, status, errorThrown) ->
        console.log data
        console.log status
        console.log errorThrown
    )
