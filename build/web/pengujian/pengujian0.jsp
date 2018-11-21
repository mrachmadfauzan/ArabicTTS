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
            var filenameAudio;

            function playAudio() {
                var audio = new Audio(filenameAudio);
                audio.play();
            }
            function myFunction() {

                $.get("http://ipinfo.io", function (response) {
                    document.getElementById("ip").value = response.ip;
                    document.getElementById("ipinfo").innerHTML = response.ip;
                }, "jsonp");
                document.getElementById("text").value = document.getElementById("DBMate").textContent;

                var txt = [], str = document.getElementById("ArabicText").textContent;
                var len = str.length, txtUnicode = '';
                filenameAudio = 'assets/audio/' + document.getElementById("srcAudio").textContent;
                $('#hitung').text(len);

                for (i = 0; i < len; i++) {
                    txt[i] = [];
                    txt[i][0] = str.charAt(i);
                    txt[i][1] = '&amp#' + str.charCodeAt(i);

                    txtUnicode += ' &amp#' + str.charCodeAt(i);
                }
                var txt2 = '<table class="table table-striped" border="1">\n\
                                    <thead>\n\
                                        <tr><th>No</th>\n\
                                        <th>Karakter</th>\n\
                                        <th>Karakter dalam Unicode</th></tr>\n\
                                    </thead><tbody>';
                for (i = 0; i < len; i++) {
                    txt2 += '<tr><td>' + (i + 1) + '</td><td><p>' + txt[i][0] + '</p></td><td>' + txt[i][1] + '</td></tr>';
                }
                txt2 += '</tbody></table>';

                document.getElementById("char").innerHTML = txt2;
                document.getElementById("ascii").innerHTML = txtUnicode;




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
                        <label>KUISIONER PENILAIAN<br>
                            SISTEM TEXT TO SPEECH UNTUK BAHASA ARAB</label></div>
                    <p></p>
                    <p>Sistem text to speech untuk bahasa Arab adalah sebuah 
                        aplikasi komputer yang mampu mengubah tulisan dalam bahasa
                        Arab yang dilengkapi harakat menjadi suara pengucapan
                        yang dapat didengar. Kuisioner ini bertujuan sebagai sarana
                        untuk memberikan penilaian terhadap kualitas serta
                        ketepatan/kesesuaian pengucapan suara yang dihasilkan.</p>
                    <p>Isi identitas diri Anda.</p>
                    <form action="save0.jsp" method="POST" class="form-horizontal">
                        <ol>
                            <li><p>ip anda: <label id="ipinfo"></label> </p></li>
                            <input type="hidden" id="ip" name="ip">
                            <input type="hidden" id="text" name="text" class="form-control">

                            <li>
                                <p>Nama:<br>
                                    <input type="text" id="nama" name="nama" class="form-control" required>
                                </p>
                            </li>
                            <li>
                                <p>
                                    Apakah Anda dapat membaca dan mengerti hukum bacaan (tajwid)
                                    pada tulisan bahasa Arab?<br>
                                    <input type="radio" name="ans0" value="Ya" required>Ya<br>
                                    <input type="radio" name="ans0" value="Tidak" required>Tidak<br>
                                    <input type="radio" name="ans0" value="Ragu-ragu" required>Ragu-ragu<br>
                                </p>
                            </li>
                        </ol>
                        <button type="submit" class="btn btn-primary">Mulai pertanyaan 1</button>
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

