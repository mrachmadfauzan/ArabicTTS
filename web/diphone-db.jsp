<%-- 
    Document   : diphone-db
    Created on : Apr 14, 2017, 10:48:07 AM
    Author     : mr-fao
--%>

<%@page import="java.nio.file.attribute.BasicFileAttributes"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.net.URI"%>
<%@page import="java.nio.file.Path"%>
<%@page import="java.io.*" %> 
<%@page import="java.util.*" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Arabic TTS</title>
        <!-- Meta -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">    
        <link rel="shortcut icon" href="assets/images/arabictts_small.ico">  

        <!-- Global CSS -->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <!-- Plugins CSS -->    
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="assets/plugins/prism/prism.css">
        <!-- Theme CSS -->  
        <link id="theme-style" rel="stylesheet" href="assets/css/styles.css">

        <!-- Javascript -->          
        <script type="text/javascript" src="assets/plugins/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="assets/plugins/jquery-migrate-1.2.1.min.js"></script>    
        <script type="text/javascript" src="assets/plugins/jquery.easing.1.3.js"></script>   
        <script type="text/javascript" src="assets/plugins/bootstrap/js/bootstrap.min.js"></script>     
        <script type="text/javascript" src="assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script> 
        <script type="text/javascript" src="assets/plugins/prism/prism.js"></script>    
        <script type="text/javascript" src="assets/js/main.js"></script>       
    </head>
    <body>
        <h1>Daftar File Suara</h1>
        <%!        public void GetDirectory(String a_Path, Vector a_files, Vector a_folders) {
                File l_Directory = new File(a_Path);
                File[] l_files = l_Directory.listFiles();

                for (int c = 0; c < l_files.length; c++) {
                    if (l_files[c].isDirectory()) {
                        a_folders.add(l_files[c].getName());
                    } else {
                        a_files.add(l_files[c].getName());
                    }
                }

            }
        %> 

        <%
            Vector l_Files = new Vector(), l_Folders = new Vector();
            GetDirectory("D:/audiodata", l_Files, l_Folders);

            //folders should be left out... 
            //for( int a = 0 ; a<l_Folders.size() ; a++ ) 
            //out.println( "[<b>"+l_Folders.elementAt(a).toString() + "</b>]<br>") ; 
            out.println("<table class='table table-striped' border='1'><thead><tr><th>No</th><th>Nama File</th></tr></thead><tbody>");

            for (int a = 0; a < l_Files.size(); a++) {

                out.println("<tr><td>" + (a + 1) + "</td><td>" + l_Files.elementAt(a).toString() + "</td></tr>");
            }

            out.println("</tbody></table>");
        %> 
    </body>
</html>
