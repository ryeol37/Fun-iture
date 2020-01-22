<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- grow -->
	<div class="grow">
		<div class="container">
			<h2>Contact</h2>
		</div>
	</div>
	<!-- grow -->
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?key=AIzaSyCCsl8fmExx2P_kig6eLuHkZIJzqmsObK4"></script>
<script> 
  function initialize() { 
  var myLatlng = new google.maps.LatLng(37.499274, 127.032898); // y, x좌표값
  var mapOptions = { 
        zoom: 15, 
        center: myLatlng, 
        mapTypeId: google.maps.MapTypeId.ROADMAP 
  } 
 
  var map = new google.maps.Map(document.getElementById('map_canvas'), mapOptions);
  var marker = new google.maps.Marker({ 
            position: myLatlng, 
            map: map, 
            title: "Fun-iture" 
  }); 
  var infowindow = new google.maps.InfoWindow( 
          { 
            content: "Fun-iture", 
            maxWidth: 300 
          } 
  ); 

  google.maps.event.addListener(marker, 'click', function() { 
  infowindow.open(map, marker); 
  }); 
  } 
 </script> 
<!--content-->
<body onload="initialize()"> 

<div id="map_canvas" style="width:100%; height:300px;"></div> 

</body> 

<div class="contact">
			
			<div class="container">
			<div class="contact-form">
				<h1></h1>
				<div class="col-md-12 contact-in">

						<div class="address-more">
						<h4>Address</h4>
							<p>Fun-iture</p>
							<p>서울 강남구 테헤란로14길 6</p>
							<p>남도빌딩 2층, 3층, 4층</p>
						</div>
				</div>
	</div>
	</div>
	</div>
<!--//content-->
