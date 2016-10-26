<%-- 
    Document   : register
    Created on : 25 Οκτ 2016, 11:26:33 μμ
    Author     : 'Ολγα
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Σελίδα Εγγραφής</title>
        <link rel="stylesheet" type="text/css" href="./style.css"> 
    </head>
    <body>
        <h1>Σελίδα Εγγραφής!</h1>
         <form class="modal-content animate" action="login.php">
            <div class="imgcontainer">
            <span onclick="document.getElementById('id01').style.display='none'" class="close" title="Close Modal">&times;</span>
            </div>

            <div class="container">
            <label><b>Username</b></label>
            <input type="text" placeholder="Username" name="uname" required>

            <label><b>Password</b></label>
            <input type="password" placeholder="Password" name="psw" required>
            
             <div class="container">
            <label><b>E-mail</b></label>
            <input type="text" placeholder="email" name="email" required>
            
            <label><b>Date of birth</b></label>
            <input type="text" placeholder="Date of birth" name="Date of birth" required>
            
            <label><b>Gender</b></label>
            <input type="text" placeholder="Gender" name="Gender" required>
            
            <label><b>Country</b></label>
            <input type="text" placeholder="Country" name="Country" required>
            
            
        
            <button type="submit">Έξοδος</button>            
            </div>

            <div class="container" style="background-color:#f1f1f1">
            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Άκυρο</button>
            
            </div>
        </form>
    </body>
</html>
