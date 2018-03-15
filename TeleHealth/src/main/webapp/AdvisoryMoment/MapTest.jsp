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
      function initMap() {
        map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: 25.0329282, lng: 121.54358400000001},
          zoom: 16
        });


     // Create a <script> tag and set the USGS URL as the source.
        var script = document.createElement('script');
        // This example uses a local copy of the GeoJSON stored at
        // http://earthquake.usgs.gov/earthquakes/feed/v1.0/summary/2.5_week.geojsonp
        script.src = 'https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=25.0329282,121.54358400000001&rankby=distance&keyword=醫院&key=AIzaSyCmeQef569mlPIAOgcfxPzWbtr9KdtjHOI&callback=initMap';
        document.getElementsByTagName('head')[0].appendChild(script);
      }

      // Loop through the results array and place a marker for each
      // set of coordinates.
      window.eqfeed_callback = function(results) {
        for (var i = 0; i < results.length; i++) {
          var coords = results.[i].geometry.coordinates;
          var latLng = new google.maps.LatLng(coords[1],coords[0]);
          var marker = new google.maps.Marker({
            position: latLng,
            map: map
          });
        }





        
      }
    </script>
    <script src="https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=25.0329282,121.54358400000001&rankby=distance&keyword=醫院&key=AIzaSyCmeQef569mlPIAOgcfxPzWbtr9KdtjHOI&callback=initMap" async defer></script>
</html>