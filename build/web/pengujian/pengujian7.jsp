<!DOCTYPE html>
<!--[if IE 8]> <html lang="en" class="ie8"> <![endif]-->  
<!--[if IE 9]> <html lang="en" class="ie9"> <![endif]-->  
<!--[if !IE]><!--> <html lang="en"> <!--<![endif]-->  
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
        <script type="text/javascript">
            var filenameAudio = '../assets/pengujian_audio/7-rasuulunamiinun.wav';

            function playAudio() {
                var audio = new Audio(filenameAudio);
                audio.play();
            }
            function myFunction() {

                $.get("http://ipinfo.io", function (response) {
                    document.getElementById("ip").value = response.ip;
                    document.getElementById("ipinfo").innerHTML = response.ip;
                }, "jsonp");
            }
            window.onload = myFunction;
        </script>
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

                <div text-center>
                    <div class="text-center">
                        <label>PERTANYAAN 7: IDZHAAR</label>
                        <p>Anda akan mendengar suara pengucapan dari tulisan</p>
                        <p class="title">&#1585&#1614&#1587&#1615&#1608&#1618&zwj;<span style='color : #EEBF3D;'>&zwj;&#1604&#1612&#32&#1571&#1614&zwj;</span>&zwj;&#1605&#1616&#1610&#1618&#1606&#1612</p>
                        <p>(rasuu&zwj;<span style='color : #EEBF3D;'>&zwj;lun a&zwj;</span>&zwj;miinun)</p>
                        <button type="button" class="btn btn-primary" onclick="playAudio()">
                            <span class="glyphicon glyphicon-play"></span> Play
                        </button>
                    </div>
                    <p></p>
                    <p>Pada bagian yang berwarna merah bacaan di atas terdapat 
                        hukum bacaan idzhar, yaitu adanya tanwin yang bertemu 
                        huruf alif sehingga harus dibaca dengan terang dan jelas.</p>
                        <% String id = request.getParameter("id");%>
                    <form action="save7.jsp?id=<%out.println(id);%>" method="POST" class="form-horizontal">
                        <p>
                            Pertanyaan: Apakah Anda dapat mendengar bacaan pada 
                            bagian yang berwarna merah dengan terang dan jelas?<br>
                            <input type="radio" name="ans7" value="Ya" required>Ya<br>
                            <input type="radio" name="ans7" value="Tidak" required>Tidak<br>
                            <input type="radio" name="ans7" value="Ragu-ragu" required>Ragu-ragu<br>
                        </p>

                        <button type="submit" class="btn btn-primary">Lanjut pertanyaan 8</button>
                    </form>

                </div>
                <hr>
                <ul class="meta list-inline">
                    <li><a href="#" target="_blank"></a></li>
                    <li><a href="#" target="_blank"></a></li>
                    <li></li>
                </ul><!--//meta-->
            </div><!--//container-->

        </section><!--//promo-->

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

