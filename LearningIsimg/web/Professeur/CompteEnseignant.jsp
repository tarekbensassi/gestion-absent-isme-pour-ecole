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
    <link rel="shortcut icon" href="../images/favicon.png">

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
    <link rel="stylesheet" href="../js/bootstrap-fileupload/bootstrap-fileupload.css">


</head>

<body class="texture">

    <div id="cl-wrapper" class="login-container">

        <div class="middle-login">
            <div class="block-flat">
                <div class="header">							
                    <h3 class="text-center"><img class="logo-img" src="../images/footer_logo.png" height="32" width="32" alt="logo"/>Isimg</h3>
                </div>
                <div>
                    <form style="margin-bottom: 0px !important;" enctype="multipart/form-data" method="POST"  class="form-horizontal" action="../AjouterEnseignant">
                        <div class="content">
                            <h4 class="title">Authentification</h4>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" required  placeholder="Nom" name="nom" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" required  placeholder="Prenom" name="prenom" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                        <input type="text" placeholder="Télèphone 1" name="tel1" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-phone"></i></span>
                                        <input type="text" placeholder="Télèphone 2" name="tel2" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-envelope"></i></span>
                                        <input type="text" placeholder="Email" name="email" required class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                        <textarea  name="adresse" class="form-control" data-parsley-id="2616"></textarea>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-home"></i></span>
                                        <input type="text" placeholder="Code postale" name="post" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">

                                <div class="controls col-md-9">
                                    <div class="fileupload fileupload-new" data-provides="fileupload"><input type="hidden">
                                        <span class="btn btn-white btn-file">
                                            <span class="fileupload-new"><i class="fa fa-upload"></i> Choisir une Image</span>
                                            <span class="fileupload-exists"><i class="fa fa-upload"></i> Changer</span>
                                            <input type="file" name="file" class="default">
                                        </span>
                                        <span class="fileupload-preview" style="margin-left:5px;"></span>
                                        <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-user"></i></span>
                                        <input type="text" required  placeholder="Nom d'utilisateur" name="login" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="password" placeholder="Mot de passe" id="password" name="pwd" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <div class="form-group">
                                <div class="col-sm-12">
                                    <div class="input-group">
                                        <span class="input-group-addon"><i class="fa fa-lock"></i></span>
                                        <input type="password" placeholder="Confirmer mot de passe" name="pwd1" id="password" class="form-control">
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="foot">
                            <button class="btn btn-default" data-dismiss="modal" type="button">Annuler</button>
                            <button class="btn btn-primary" data-dismiss="modal" type="submit">Enregistrer</button>
                        </div>

                    </form>

                </div>
            </div>
            <div class="text-center out-links"><a href="#">&copy; 2014 Pfe ISIMG</a></div>
        </div> 

    </div>

    <script src="../js/jquery.js"></script>
    <script type="text/javascript" src="../js/bootstrap-fileupload/bootstrap-fileupload.js"></script>

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

