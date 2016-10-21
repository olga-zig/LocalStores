<%-- 
    Document   : index
    Created on : 21 Οκτ 2016, 1:13:03 μμ
    Author     : Nikos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Local Stores</title>
        <meta name="viewport" content="initial-scale=1.0, user-scalable=no">
        <meta charset="utf-8">
        <style>
            html, body {
                height: 80%;
                margin: 0;
                padding: 0;
            }
            #map {
                height: 80%;
                margin: 2% ;
            }
            </style> 
    
    <script>
      
      function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
          center: {lat: -34.397, lng: 150.644},
          zoom: 15
        });
       
        // add a different marker for stores in Serres
        var image = 'https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png';
        var beachMarker = new google.maps.Marker({
            position: {lat:41.082285, lng: 23.543299},
            map: map,
            icon: image
            });
     


        // Try HTML5 geolocation.        
       
        if (navigator.geolocation) {
          navigator.geolocation.getCurrentPosition(function(position) {
            var pos = {
              lat: position.coords.latitude,
              lng: position.coords.longitude
              
            };           
            
                                //
            var contentString = '<div id="content">'+
            '<div id="siteNotice">'+
            '</div>'+
            '<h1 id="firstHeading" class="firstHeading">Τοποθεσία</h1>'+
            '<div id="bodyContent">'+
            '<p><b>Η τοποθεσία σας κατα προσέγγιση είνια εδώ. </b></p>'+
            '</div>';

            
            var infowindow = new google.maps.InfoWindow({
          content: contentString 
        });
        
        var marker = new google.maps.Marker({
          position: pos,
          map: map,
          title: 'Βρίσκεστε εδώ'
        });
        marker.addListener('click', function() {
          infowindow.open(map, marker);
        });
        
       
            map.setCenter(pos);
          }, function() {
            handleLocationError(true, infoWindow, map.getCenter());
          });
        } else {
          // Browser doesn't support Geolocation
          handleLocationError(false, infoWindow, map.getCenter());
        }
      }

      function handleLocationError(browserHasGeolocation, infoWindow, pos) {
        infoWindow.setPosition(pos);
        infoWindow.setContent(browserHasGeolocation ?
                              'Error: The Geolocation service failed.' :
                              'Error: Your browser doesn\'t support geolocation.');
      }
           
      
    </script>
    
    
    
    
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAW675Yall3W2kXEhOVkdZICJdI8KrQAes&callback=initMap">
    </script>
        </head>
    <body style="background-color:powderblue;">
        <h1>Καλωσήρθατε στην εφαρμογή Local Stores !</h1>
        
        <%
            Date date = new Date();
            out.print( "<h2 align=\"center\">" +date.toString()+"</h2>");
        %>
        
        <div id="map"></div>
        <div> 
            <p>Για να προβάλετε τις συντεταγμένες σας πατήστε στο παρακάτω κουμπί</p>

            <button onclick="getLocation().style.display='block'" style="width:auto;">Συντεταγμένες της τοποθεσίας μου</button>

            <p id="demo"> </p>    
        
        </div>
        <script>
            var x = document.getElementById("demo");

            function getLocation() {
                if (navigator.geolocation) {
                        navigator.geolocation.watchPosition(showPosition);
                } else {
                        x.innerHTML = "Geolocation is not supported by this browser.";}
            }
    
            function showPosition(position) {
                x.innerHTML="Γεωγραφικό Πλάτος: " + position.coords.latitude +
                "<br>Γεωγραφικό Μήκος: " + position.coords.longitude;
            }
            
            
           
            
            
        </script>
    </body>
</html>
