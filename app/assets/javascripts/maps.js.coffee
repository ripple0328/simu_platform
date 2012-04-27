$(document).ready ->
  
  browserSupportFlag  = new Boolean()
  shanghai  =  new google.maps.LatLng(31.2390,121.4972)

  myOptions = 
    zoom: 15
    disableDefaultUI: true
    Center: shanghai
    mapTypeId: google.maps.MapTypeId.SATELLITE 
	
  map = new google.maps.Map(document.getElementById("maps"), myOptions)


