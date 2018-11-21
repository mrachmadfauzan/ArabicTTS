<%-- 
    Document   : statistic
    Created on : Aug 21, 2017, 8:18:33 AM
    Author     : mr-fao
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%
    double count = 0;
    String table = "";
    DecimalFormat df = new DecimalFormat("#.##");
    try {
        String Host = "jdbc:mysql://localhost:3306/arabictts_rate";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(Host, "root", "");
        statement = connection.createStatement();
        String Data = "select count(*) as jml from pengujian where ans0 = 'Ya'";
        rs = statement.executeQuery(Data);
        while (rs.next()) {
            count = Double.parseDouble(rs.getString("jml"));
        }
        rs.close();
        

%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Arabic TTS</title>
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="">
        <meta name="author" content="">    
        <link rel="shortcut icon" href="../assets/images/arabictts_small.ico">  

        <!-- Global CSS -->
        <link rel="stylesheet" href="../assets/plugins/bootstrap/css/bootstrap.min.css">
        <!-- Plugins CSS -->    
        <link rel="stylesheet" href="../assets/plugins/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="../assets/plugins/prism/prism.css">
        <!-- Theme CSS -->  
        <link id="theme-style" rel="stylesheet" href="../assets/css/styles.css">
        <style type="text/css">
            body{
                background-color: #17baef;
            }
            section.promo{
                padding: 80px 0;
            }
        </style>
        <script type="text/javascript" src="../assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../assets/js/jquery-1.11.3.js"></script>
    </head>
    <body>
        <header id="header" class="header">  
            <div class="container">
                <h1 class="logo pull-left">
                    <a href="./">
                        <img class="img-responsive" src="assets/images/ArabicTTS-small.png" alt="" width="50%" height="50%" />
                    </a>

                </h1><!--//logo-->         
            </div>
        </header><!--//header-->

        <!-- ******PROMO****** -->
        <section id="promo" class="promo section offset-header" style="padding-top: 60px">
            <div class="container text-center">

                <p class="title" style="font-size: 25px;">Data Hasil Penilaian Pengguna</p>

            </div><!--//container-->
            <div class="container">
                <p>Jumlah responden: <label><%=(int) count%></label></p>
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Menguasai Tajwid</th>
                            <th>Ans 1</th>
                            <th>Ans 2</th>
                            <th>Ans 3</th>
                            <th>Ans 4</th>
                            <th>Ans 5</th>
                            <th>Ans 6</th>
                            <th>Ans 7</th>
                            <th>Ans 8</th>
                            <th>Ans 9</th>
                            <th>Ans 10</th>
                            <th>Ans 11</th>
                            <th>Ans 12</th>
                            <th>Ans 13</th>
                        </tr>
                    </thead>
                    <tbody>
<%
    Data = "select * from pengujian";
        rs = statement.executeQuery(Data);
        int no = 1;
        while (rs.next()) {
            out.println(""
                    + "<tr>"
                    + "<td>" + no + "</td>"
                    + "<td>" + rs.getString("nama") + "</td>"
                    + "<td>" + rs.getString("ans0") + "</td>"
                    + "<td>" + rs.getString("ans1") + "</td>"
                    + "<td>" + rs.getString("ans2") + "</td>"
                    + "<td>" + rs.getString("ans3") + "</td>"
                    + "<td>" + rs.getString("ans4") + "</td>"
                    + "<td>" + rs.getString("ans5") + "</td>"
                    + "<td>" + rs.getString("ans6") + "</td>"
                    + "<td>" + rs.getString("ans7") + "</td>"
                    + "<td>" + rs.getString("ans8") + "</td>"
                    + "<td>" + rs.getString("ans9") + "</td>"
                    + "<td>" + rs.getString("ans10") + "</td>"
                    + "<td>" + rs.getString("ans11") + "</td>"
                    + "<td>" + rs.getString("ans12") + "</td>"
                    + "<td>" + rs.getString("ans13") + "</td>"
                    + "</tr>");
            no+=1;
        }
        rs.close();
        statement.close();
        connection.close();
    } catch (Exception ex) {
        out.println("Can't connect to database.");
    }
%>
                    </tbody>
                </table>
            </div><!--//container-->
        </section><!--//promo-->

    </body>
</html>
