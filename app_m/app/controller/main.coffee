class MainCtrl extends Monocle.Controller

	events: 
		"tap a[data-action=locate]" : "onLocate"
		"tap a[data-action=food]"   : "onfood"

	initialize: ->
		do Lungo.Notification.show
		latlng = new google.maps.LatLng(10.99461, -74.790997)
		Lungo.Router.section "main"

		mapOptions = {
          center: latlng,
          zoom: 15,
          mapTypeId: google.maps.MapTypeId.SATELLITE,
        }
        map = new google.maps.Map(document.getElementById("map"), mapOptions)
        marker = new google.maps.Marker({
          position: latlng,
          map: map
          icon: "http://maps.google.com/intl/en_us/mapfiles/ms/micons/blue.png"
    	})
		do Lungo.Notification.hide

	onLocate: ->
		###do Lungo.Notification.show
		getLocation = ->
			if navigator.geolocation
				navigator.geolocation.getCurrentPosition bien
			else
				Lungo.Notification.error "Error al tratar de ubicarte", 3	

		bien = (position) -> 
			x = document.getElementById("map")
			console.log position
			coordenadas = new google.maps.LatLng(position.coords.latitude, position.coords.longitude)
			mapOptions =
			    zoom: 15
			    center: coordenadas
			    mapTypeControl: true
			    navigationControlOptions:
			        style: google.maps.NavigationControlStyle.SMALL
			    mapTypeId: google.maps.MapTypeId.SATELLITE

			map = new google.maps.Map(x, mapOptions)
			marker = new google.maps.Marker
		     position: coordenadas
	         icon: "http://maps.google.com/intl/en_us/mapfiles/ms/micons/blue.png"
	         map: map
		Lungo.Router.section "main"
		do Lungo.Notification.hide###
	onfood: ->
		$.ajax(
	      url: "http://www.pideloya.co/get_venues.json"
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

__Controller.Main = new MainCtrl "section#main"