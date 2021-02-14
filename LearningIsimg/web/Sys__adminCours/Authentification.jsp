<%-- 
    Document   : Authentification
    Created on : 8 avr. 2014, 10:27:06
    Author     : BENAHMED
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<!DOCTYPE html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="../images/footer_logo.png">

    <title>Cours Isimg</title>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,400italic,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Raleway:300,200,100' rel='stylesheet' type='text/css'>

    <!-- Bootstrap core CSS -->
    <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">

    <link rel="stylesheet" href="../fonts/font-awesome-4/css/font-awesome.min.css">

    <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!--[if lt IE 9]>
      <script src="../../assets/js/html5shiv.js"></script>
      <script src="../../assets/js/respond.min.js"></script>
    <![endif]-->

    <!-- Custom styles for this template -->
    <link href="../css/style.css" rel="stylesheet" />	

</head>

<body class="texture">

    <div id="cl-wrapper" class="login-container">

        <div class="middle-login">
            <div class="block-flat">
                <div class="header">							
                    <h3 class="text-center"><img class="logo-img" src="../images/footer_logo.png" height="32" width="32" alt="logo"/>Isimg</h3>
                </div>
                <div>

                    <form style="margin-bottom: 0px !important;" class="form-horizontal" action="../LoginAdmin">
                        <div class="content">
                            <h4 class="title">Authentification</h4>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" name="login" placeholder="Nom d'utilisateur" id="username" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="password" name="pwd" placeholder="Mot de passe" id="password" class="form-control">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="foot">
                            <button class="btn btn-default" data-dismiss="modal" type="button" onclick="Redirect()">Créer un compte</button>
                            <input class="btn btn-primary" data-dismiss="modal" type="submit" value="Connecter" name="Connecter"/>
                        </div>

                    </form>

                </div>
            </div>
            <div class="text-center out-links"><a href="#">&copy; 2014 Pfe ISIMG</a></div>
        </div> 

    </div>
    <script>
        function Redirect()
        {
            var selectElmt = document.getElementById("TypeUser");
            var textselectionne = selectElmt.options[selectElmt.selectedIndex].text;
            if (textselectionne === "Etudiant") {
                window.location = "CompteEtudiant.jsp";
            } else {
                window.location = "Professeur/CompteEnseignant.jsp";
            }
        }

    </script>
    <script src="js/jquery.js"></script>

    <!-- Bootstrap core JavaScript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="../js/bootstrap/dist/js/bootstrap.min.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.pie.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.resize.js"></script>
    <script type="text/javascript" src="../js/jquery.flot/jquery.flot.labels.js"></script>
</body>
</html>

