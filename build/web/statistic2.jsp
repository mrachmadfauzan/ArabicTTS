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
    double count = 0, q1 = 0, q2 = 0, q3 = 0, q4 = 0, q5 = 0;
    DecimalFormat df = new DecimalFormat("#.##");
    try {
        String Host = "jdbc:mysql://localhost:3306/arabictts_rate";
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(Host, "root", "");
        statement = connection.createStatement();
        String Data = "select count(*) as jml from rate";
        rs = statement.executeQuery(Data);
        while (rs.next()) {
            count = Double.parseDouble(rs.getString("jml"));
        }
        rs.close();
        Data = "select * from rate";
        rs = statement.executeQuery(Data);
        while (rs.next()) {
            q1 += Double.parseDouble(rs.getString("q1"));
            q2 += Double.parseDouble(rs.getString("q2"));
            q3 += Double.parseDouble(rs.getString("q3"));
            q4 += Double.parseDouble(rs.getString("q4"));
            q5 += Double.parseDouble(rs.getString("q5"));
        }
        rs.close();
        statement.close();
        connection.close();
        q1 = (double) (q1 / count);
        q2 = (double) (q2 / count);
        q3 = (double) (q3 / count);
        q4 = (double) (q4 / count);
        q5 = (double) (q5 / count);
    } catch (Exception ex) {
        out.println("Can't connect to database.");
    }

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
        <link rel="shortcut icon" href="assets/images/arabictts_small.ico">  

        <!-- Global CSS -->
        <link rel="stylesheet" href="assets/plugins/bootstrap/css/bootstrap.min.css">
        <!-- Plugins CSS -->    
        <link rel="stylesheet" href="assets/plugins/font-awesome/css/font-awesome.css">
        <link rel="stylesheet" href="assets/plugins/prism/prism.css">
        <!-- Theme CSS -->  
        <link id="theme-style" rel="stylesheet" href="assets/css/styles.css">

        <script type="text/javascript" src="assets/js/jquery.min.js"></script>
        <script type="text/javascript" src="assets/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="assets/js/jquery-1.11.3.js"></script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery-1.11.1.min.js"></script>
        <script type="text/javascript" src="https://canvasjs.com/assets/script/jquery.canvasjs.min.js"></script>
        <script type="text/javascript">
            window.onload = function () {

                //Better to construct options first and then pass it as a parameter
                var options = {
                    title: {
                        text: "Data Hasil Penilaian Pengguna"
                    },
                    animationEnabled: true,
                    data: [
                        {
                            type: "column", //change it to line, area, bar, pie, etc
                            dataPoints: [
                                
                                {x: 1, y: <%=q2%>},
                                {x: 2, y: <%=q3%>},
                                {x: 3, y: <%=q4%>}
                            ]
                        }
                    ]
                };

                $("#chartContainer").CanvasJSChart(options);

            }
        </script>


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
                <div class="row">
                    <div class="col-sm-6">
                        <p>Jumlah responden: <label><%=(int) count%></label></p>
                        <p>Keterangan nilai:</p>
                        <ul>
                            <li>Nilai 1: Amat Tidak Baik</li>
                            <li>Nilai 2: Tidak Baik</li>
                            <li>Nilai 3: Sedang</li>
                            <li>Nilai 4: Baik</li>
                            <li>Nilai 5: Amat Baik</li>
                        </ul>
                        <p>Penilaian: </p>
                        <ol>
                            
                            <li>Apakah suara mudah didapatkan?(Q2 = <label><%=df.format(q2)%></label>)</li>
                            <li>Apakah suara yang dihasilkan dapat didengar jelas?(Q3 = <label><%=df.format(q3)%></label>)</li>
                            <li>Apakah suara terdengar seperti suara manusia pada umumnya?(Q4 = <label><%=df.format(q4)%></label>)</li>
                            
                        </ol><!--//meta-->
                    </div>
                    <div class="col-sm-6">
                        <div id="chartContainer" style="height: 300px; width: 100%;"></div>
                    </div>
                </div>
            </div><!--//container-->
            <div class="social-media">
                <div class="social-media-inner container text-center">
                    <ul class="list-inline">
                        <li class="twitter-follow">
                        </li><!--//twitter-follow-->
                        <li class="twitter-tweet">
                        </li><!--//twitter-tweet-->
                        <li class="facebook-like">
                        </li><!--//facebook-like-->
                        <!--// Generate github buttons: https://github.com/mdo/github-buttons -->
                        <!--//
                        <li class="github-follow"><iframe src="http://ghbtns.com/github-btn.html?user=mdo&type=follow&count=true"
      allowtransparency="true" frameborder="0" scrolling="0" width="165" height="20"></iframe></li>
                        -->
                    </ul>
                </div>
            </div>
        </section><!--//promo-->

    </body>
</html>
