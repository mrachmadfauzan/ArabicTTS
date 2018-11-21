<%-- 
    Document   : cbbean
    Created on : Jun 11, 2016, 10:17:22 AM
    Author     : Papah
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:useBean id="textbean" class="beans.textbean">
            <jsp:setProperty name="textbean" property="nama" value="Fauzan" />
        </jsp:useBean>
        <h1>Hello <jsp:getProperty name="textbean" property="nama" /></h1>
    </body>
</html>
