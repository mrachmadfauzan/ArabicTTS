<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
    <%@page import="java.text.DecimalFormat"%>
    <%@page import="java.sql.DriverManager"%>
    <%@page import="java.sql.ResultSet"%>
    <%@page import="java.sql.Statement"%>
    <%@page import="java.sql.Connection"%>
    <%
        String id = request.getParameter("id");
        String nama = "";
        int count = 0;
        DecimalFormat df = new DecimalFormat("#.##");
        try {

            String Host = "jdbc:mysql://localhost:3306/arabictts_rate";
            Connection connection = null;
            Statement statement = null;
            ResultSet rs = null;
            Class.forName("com.mysql.jdbc.Driver");
            connection = DriverManager.getConnection(Host, "root", "");
            statement = connection.createStatement();
            //========GET RECORD NAME========
            String Data = "select nama from pengujian where id='" + id + "'";
            rs = statement.executeQuery(Data);
            while (rs.next()) {
                nama = rs.getString("nama");
            }
            rs.close();
            //========GET COUNT OF ALL RECORD========
            Data = "select count(*) as jml from pengujian";
            rs = statement.executeQuery(Data);
            while (rs.next()) {
                count = Integer.parseInt(rs.getString("jml"));
            }
            rs.close();

        } catch (Exception ex) {
            out.println("Can't connect to database.");
        }

    %>
    <head>
        <title>Arabic TTS</title>
        <!-- Meta -->
        <meta charset="utf-8">
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
        <link rel="stylesheet" type="text/css" href="../assets/css/rating.css">

        <script type="text/javascript" src="../assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="../assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="../assets/js/jquery-1.11.3.js"></script>
        <style type="text/css">
            body{
                background-color: #17baef;
            }
            section.promo{
                padding: 80px 0;
            }
            p.title{
                font-family: adobe arabic;

            }

        </style>
    </head> 

    <body data-spy="scroll">
        <!-- ******HEADER****** --> 
        <header id="header" class="header">  
            <div class="container">
                <h1 class="logo pull-left">
                    <a href="./">
                        <img class="img-responsive" src="../assets/images/ArabicTTS-small.png" alt="" width="50%" height="50%" />
                    </a>
                </h1><!--//logo-->              

            </div>
        </header><!--//header-->

        <!-- ******PROMO****** -->
        <section class="promo">
            <div class="container">


                <div class="text-center">
                    <label>Terimakasih <%out.println(nama);%><br>
                        Atas partisipasinya dalam penilaian penelitian ini.</label>
                    <hr>
                    <<<a href="../index.jsp"> <button type="button" class="btn btn-link"> Kembali ke halaman utama aplikasi </button> </a>>>
                </div>



            </div><!--//container-->
        </section><!--//promo-->
        <section class="promo">
            <div class="container">
                <p></p>
                <p>Jumlah responden saat ini: <%out.println(count);%></p>

            </div>
        </section>

        <!-- Javascript -->          
        <script type="text/javascript" src="../assets/plugins/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="../assets/plugins/jquery-migrate-1.2.1.min.js"></script>    
        <script type="text/javascript" src="../assets/plugins/jquery.easing.1.3.js"></script>   
        <script type="text/javascript" src="../assets/plugins/bootstrap/js/bootstrap.min.js"></script>     
        <script type="text/javascript" src="../assets/plugins/jquery-scrollTo/jquery.scrollTo.min.js"></script> 
        <script type="text/javascript" src="../assets/plugins/prism/prism.js"></script>    
        <script type="text/javascript" src="../assets/js/main.js"></script>       
    </body>
</html> 

