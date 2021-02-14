<!DOCTYPE html>
<html>
    <head>
        <title>Atom-Admin</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Bootstrap -->
        <link href="bs3/css/bootstrap.min.css" rel="stylesheet">
        <link href="css/style-responsive.css" rel="stylesheet">
        <link href="css/atom-style.css" rel="stylesheet">
        <link href="css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="plugins/jquery-multi-select/css/multi-select.css" />

        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300' rel='stylesheet' type='text/css'>

        <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
        <!--[if lt IE 9]>
              <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
              <script src="https://oss.maxcdn.com/libs/respond.js/1.3.0/respond.min.js"></script>
            <![endif]-->
    </head>
    <body>

        <div class="container login-bg">
            <form action="Connecter" class="login-form-signin">
                <div class="login-logo"><img src="images/logo.png"></div>
                <h2 class="login-form-signin-heading">Authentification</h2>
                <div class="alert alert-danger fade in">
                    <strong>Nom d'utilisateur ou mot de passe incorrecte.</strong>
                </div>
                <div class="login-wrap">
                    <div class="form-group">
                        <select name="type" class="form-control-inline  parsley-validated col-lg-12" id="source">
                            <option value="Entrepreneur">Entrepreneur</option>
                            <option value="Client">Client</option>
                        </select>
                    </div>
                    <br>
                    <br>
                    <input type="text" autofocus name="user" placeholder="Nom d'utilisateur" class="form-control">
                    <input type="password" name="pwd" placeholder="Mot de passe" class="form-control">
                    <button type="submit" class="btn btn-lg btn-success btn-block">Connecter</button>
                    <a href="Entrepreneur/inscription.jsp" type="submit" class="btn btn-lg btn-primary btn-block">Inscription</a>
                </div>
            </form>
        </div>
        <!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
        <script src="js/jquery-1.10.2.js"></script> 
        <!-- Include all compiled plugins (below), or include individual files as needed --> 
        <script src="bs3/js/bootstrap.min.js"></script>
    </body>
</html>
