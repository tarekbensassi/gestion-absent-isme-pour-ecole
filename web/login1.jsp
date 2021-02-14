<!DOCTYPE html>
<html>
    <head>
       <title>Gestion d'abssence</title>

        <!-- BEGIN META -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="keywords" content="your,keywords">
        <meta name="description" content="Short explanation about this website">
        <!-- END META -->

        <!-- BEGIN STYLESHEETS -->
        <link href='http://fonts.googleapis.com/css?family=Roboto:300italic,400italic,300,400,500,700,900' rel='stylesheet' type='text/css'/>
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/bootstrap.css?1422792965" />
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/materialadmin.css?1425466319" />
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/font-awesome.min.css?1422529194" />
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/material-design-iconic-font.min.css?1421434286" />
        <!-- END STYLESHEETS -->
    </head>
    <body>

        <div class="container login-bg">
            <form action="Connecter" class="login-form-signin">
                <div class="login-logo"><img src="Admin/simg.jpg"></div>
                <h2 class="login-form-signin-heading">Authentification</h2>
                <div class="login-wrap">
                    <div class="form-group">
                        <select name="type" class="form-control-inline  parsley-validated col-lg-12" id="source">
                            <option value="Enseignant">Enseignant</option>
                            <option value="Administrateur">Administrateur</option>
                        </select>
                    </div>
                    <br>
                    <br>
                    <input type="text" autofocus name="user" placeholder="Nom d'utilisateur" class="form-control">
                    <input type="password" name="pwd" placeholder="Mot de passe" class="form-control">
                    <button type="submit" class="btn btn-lg btn-success btn-block">Connecter</button>
                   
                </div>
            </form>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
        <script src="js/jquery-1.10.2.js"></script> 
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="bs3/js/bootstrap.min.js"></script>
    </body>
</html>
