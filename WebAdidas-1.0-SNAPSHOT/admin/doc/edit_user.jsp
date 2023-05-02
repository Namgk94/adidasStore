<%-- 
    Document   : edit_user
    Created on : Apr 25, 2023, 1:48:02 PM
    Author     : NAM
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <form action="/UpdateUserServlet" style="display: flex; flex-direction: column; width: 200px;">
        
        <label for="id-user">ID Khách hàng</label>
        <input name="id-user" id="id-user" type="text" value="1312">
        
        <label for="firstname">Firstname</label>
        <input name="firstname" id="firstname" required type="text" value="">
        
        <label for="lastname">Lastname</label>
        <input name="lastname" id="lastname" required type="text" value="">
        
        <label for="password">Password</label>
        <input name="password" id="password" type="password" value="">
        
        <button type="submit">UPDATE</button>
    </form>
</body>
</html>
