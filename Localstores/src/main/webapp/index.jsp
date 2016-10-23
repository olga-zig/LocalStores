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
            /* Full-width input fields */
            input[type=text], input[type=password] {
                width: 90%;
                padding: 12px 20px;
                margin: 8px 0;
                display: inline-block;
                border: 1px solid #ccc;
                box-sizing: border-box;
            }

            /* Set a style for all buttons */
            button {
                background-color: #3399ff;
                color: white;
                padding: 14px 20px;
                margin: 8px 0;
                border: none;
                cursor: pointer;
                width: 100%;
            }

            /* Extra styles for the cancel button */
            .cancelbtn {
                width: auto;
                padding: 10px 18px;
                background-color: #f44336;
            }

            /* Center the position if the close button */            
            .container {
                padding: 16px;
            }

            span.psw {
                float: right;
                padding-top: 16px;
            }

            /* The Modal (background) */
            .modal {
                display: none; /* Hidden by default */
                position: fixed; /* Stay in place */
                z-index: 1; /* Sit on top */
                left: 0;
                top: 0;
                width: 100%; /* Full width */
                height: 100%; /* Full height */
                overflow: auto; /* Enable scroll if needed */
                background-color: rgb(0,0,0); /* Fallback color */
                background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
                padding-top: 60px;
            }

            /* Modal Content/Box */
            .modal-content {
                background-color: #fefefe;
                margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
                border: 1px solid #888;
                width: 40% ; /* Could be more or less, depending on screen size */
            }

            /* The Close Button (x) */
            .close {
                position: absolute;
                right: 25px;
                top: 0;
                color: #000;
                font-size: 35px;
                font-weight: bold;
            }

            .close:hover,
            .close:focus {
                color: red;
                cursor: pointer;
            }

            /* Change styles for span and cancel button on extra small screens */
            @media screen and (max-width: 300px) {
                span.psw {
                display: block;
                float: none;
                }
            .cancelbtn {
                width: 100%;
                }
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
            '<p><b>Η τοποθεσία σας κατα προσέγγιση είναι εδώ. </b></p>'+
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
        <button onclick="document.getElementById('id01').style.display='block'" style="width:auto;">Είσοδος</button>

        <div id="id01" class="modal">
  
        <form class="modal-content animate" action="action_page.php">
            <div class="imgcontainer">
            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>

            <div class="container">
            <label><b>Username</b></label>
            <input type="text" placeholder="Username" name="uname" required>

            <label><b>Password</b></label>
            <input type="password" placeholder="Password" name="psw" required>
        
            <button type="submit">Είσοδος</button>            
            </div>

            <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Άκυρο</button>
            
            </div>
        </form>
        </div>

        <script>
            // Get the modal
            var modal = document.getElementById('id01');

                // When the user clicks anywhere outside of the modal, close it
            window.onclick = function(event) {
                if (event.target == modal) {
                modal.style.display = "none";
                }
            }
        </script>
    </body>
</html>
