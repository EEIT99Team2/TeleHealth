<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="initial-scale=1.0">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
      	width:800px;
        height: 800px;
        margin:0px auto;
      }
    
</style>
<body>
<jsp:include page="/fragment/nav2.jsp" />
<div id="map"></div>
<!-- Footer -->
	<jsp:include page="/fragment/footer.jsp" />
</body>

<script>
		var map;
		var infowindow;
		function initMap() {
		  var pyrmont = new google.maps.LatLng(25.0329282,121.54358400000001);

		  map = new google.maps.Map(document.getElementById('map'), {
		      center: pyrmont,
		      zoom: 16
		    });

		  
		  infowindow = new google.maps.InfoWindow();
		  var service = new google.maps.places.PlacesService(map);
	        service.nearbySearch({
	          location: pyrmont,
	          radius: 600,
	          type: 'hospital'
	        }, callback);
	      }

		function callback(results, status) {
		  if (status == google.maps.places.PlacesServiceStatus.OK) {
		    for (var i = 0; i < results.length; i++) {
		      var place = results[i];		      
		      createMarker(results[i]);
		    }
		  }
		}

		function createMarker(place) {
			 var photos = place.photos;
			  if (!photos) {
			    return;
			  }
	        var placeLoc = place.geometry.location;
	        var marker = new google.maps.Marker({
	          map: map,
	          position: place.geometry.location,
	          title:place.name
	        })

	        google.maps.event.addListener(marker, 'click', function() {
	          infowindow.setContent("<div class='container'><span>" + place.name +"</span><br/>"+"<span>"+place.vicinity+"</span><br/><img src='"+photos[0].getUrl({'maxWidth': 150, 'maxHeight': 150}) +"'/></div>");
	          infowindow.open(map, this);
	        });
	      }
        
      
    </script>
    <script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCmeQef569mlPIAOgcfxPzWbtr9KdtjHOI&libraries=places&callback=initMap"></script>    
<!--     <script src="https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=25.0329282,121.54358400000001&rankby=distance&keyword=醫院&key=AIzaSyCmeQef569mlPIAOgcfxPzWbtr9KdtjHOI" async defer></script> -->
</html>