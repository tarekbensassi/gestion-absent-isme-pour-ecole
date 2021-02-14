<%@page import="Pojo.Enseignant"%>
<%@page import="Pojo.Etudiant"%>
<%@page import="controller.LoginServlet"%>
<%@page import="java.util.Iterator"%>
<%@page import="controller.Editer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="../images/footer_logo.png">
        <title>Cours Isimg</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,400italic,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:300,200,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap core CSS -->
        <link href="../js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="../js/jquery.gritter/css/jquery.gritter.css" />

        <link rel="stylesheet" href="../fonts/font-awesome-4/css/font-awesome.min.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="../js/jquery.nanoscroller/nanoscroller.css" />
        <link rel="stylesheet" type="text/css" href="../js/jquery.easypiechart/jquery.easy-pie-chart.css" />
        <link rel="stylesheet" type="text/css" href="../js/bootstrap.switch/bootstrap-switch.css" />
        <link rel="stylesheet" type="text/css" href="../js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
        <link rel="stylesheet" type="text/css" href="../js/jquery.select2/select2.css" />
        <link rel="stylesheet" type="text/css" href="../js/bootstrap.slider/css/slider.css" />
        <!-- Custom styles for this template -->
        <link href="../css/style.css" rel="stylesheet" />	

    </head>

    <body>
        <%

            String userName = null;
            Cookie[] cookies = request.getCookies();
            if (cookies != null) {
                for (Cookie cookie : cookies) {
                    if (cookie.getName().equals("user")) {
                        userName = cookie.getValue();
                    }
                }
            }
            if (userName == null) {
                response.sendRedirect("../Authentification.jsp");
            }
            Editer edite = new Editer();
            Iterator it = edite.Enseignant_connecte(Integer.valueOf(LoginServlet.identifiantEnseignant));
            int i = 0;
            String img = null;
            String nom = null;
            String prenom = null;
            String mail = null;
            String tel1 = null;
            String tel2 = null;
            String adresse = null;
            String login = null;
            String pwd = null;

            int postale = 0;
            while (it.hasNext()) {
                Enseignant tg = (Enseignant) it.next();
                i++;
                img = tg.getImage();
                nom = tg.getNom();
                prenom = tg.getPrenom();
                mail = tg.getEmail();
                tel1 = tg.getTel1();
                tel2 = tg.getTel2();
                adresse = tg.getAdresse();
                postale = tg.getCodePostale();
                login = tg.getLogin();
                pwd = tg.getPassword();

            }
        %>
        <div id="head-nav" class="navbar navbar-default navbar-fixed-top">
            <div class="container-fluid">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                        <span class="fa fa-gear"></span>
                    </button>
                    <a class="navbar-brand" href="#"><span>Isimg</span></a>
                </div>
                <div class="navbar-collapse collapse">

                    <ul class="nav navbar-nav navbar-right user-nav">
                        <li class="dropdown profile_menu">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" height="31" width="31" src="../Users/<%=img%>" /><%=nom%> <%=prenom%><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="../Professeur/Profile.jsp">Profile</a></li>
                                <li><a href="../Professeur/MessagesRecus.jsp">Messages</a></li>
                                <li class="divider"></li>
                                <li><form action="../Logout" method="post"><input type="submit" class="btn btn-primary" value="Deconnecter"></form></li>
                            </ul>
                        </li>
                    </ul>			
                </div>
            </div>
        </div>
        <div id="cl-wrapper">
            <div class="cl-sidebar">
                <div class="cl-toggle"><i class="fa fa-bars"></i></div>
                <div class="cl-navblock">
                    <ul class="cl-vnavigation">
                        <li><a href="../Professeur/indexProf.jsp"><i class="fa fa-home"></i>Accueil</a></li>
                        <li><a href="#"><i class="fa fa-book"></i>Cours</a>
                            <ul class="sub-menu">
                                <li><a href="../Professeur/Liste Cours.jsp">Liste des cours</a></li>
                                <li><a href="../Professeur/Liste Traveaux Pratique.jsp">Liste des Traveaux Pratique</a></li>
                                <li><a href="../Professeur/Liste Traveaux diriges.jsp">Liste des Traveaux Dirigés</a></li>
                                <li><a href="../Professeur/AjouterCours.jsp">Ajouter un document</a></li>
                            </ul>
                        </li>
                        <li><a href="#"><i class="fa fa-envelope"></i>Messages</a>
                            <ul class="sub-menu">
                                <li><a href="../Professeur/MessagesRecus.jsp">Messages reçus</a></li>
                                <li><a href="../Professeur/MessagesEnvoyer.jsp">Messages Envoyer</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid" id="pcont">
            <div class="page-head">
                <h2>Profile</h2>
            </div>		
            <div class="cl-mcont">
                <div class="row">
                    <div class="col-sm-12">
                        <div class="block-flat profile-info">
                            <div class="row">
                                <div class="col-sm-2">
                                    <div class="avatar">
                                        <img src="../Users/<%=img%>" width="130" height="130" class="profile-avatar">
                                    </div>
                                </div>
                                <div class="col-sm-7">
                                    <div class="personal">
                                        <h1 class="name"><%=nom%> <%=prenom%></h1>
                                    </div>
                                    <div class="personal">
                                        <h3><%=mail%></h3>
                                    </div>

                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="tab-container">
                        <ul class="nav nav-tabs">
                            <li class="active"><a data-toggle="tab" href="#home">Information Personnel</a></li>
                            <li class=""><a data-toggle="tab" href="#settings">Editer</a></li>
                        </ul>
                        <div class="tab-content">
                            <div id="home" class="tab-pane cont active">
                                <table class="no-border no-strip information">
                                    <tbody class="no-border-x no-border-y">
                                        <tr>
                                            <td style="width:20%;" class="category"><strong>CONTACT</strong></td>
                                            <td>
                                                <table class="no-border no-strip skills">
                                                    <tbody class="no-border-x no-border-y">
                                                        <tr><td style="width:20%;"><b>E-mail</b></td><td><%=mail%></td></tr>
                                                        <tr><td style="width:20%;"><b>Télèphone</b></td><td><%=tel1%></td></tr>
                                                        <tr><td style="width:20%;"><b>Télèphone</b></td><td><%=tel2%></td></tr>
                                                        <tr><td style="width:20%;"><b>Adresse</b></td><td><%=adresse%></td></tr>
                                                        <tr><td style="width:20%;"><b>Code postale</b></td><td><%=postale%></td></tr>
                                                    </tbody>
                                                </table>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div id="settings" class="tab-pane">
                                <form role="form" class="form-horizontal" action="../ModifierEnseignant" method="POST">

                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="nick">Nom</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="nom" value="<%=nom%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="name">Prenom</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="prenom" value="<%=prenom%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="inputEmail3">Email</label>
                                        <div class="col-sm-9">
                                            <input type="email" name="mail" value="<%=mail%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="inputEmail3">Adresse</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="adresse" value="<%=adresse%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="inputEmail3">Code postale</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="postale" value="<%=postale%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="inputEmail3">Télèphone</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="tel1" value="<%=tel1%>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="inputEmail3">Télèphone</label>
                                        <div class="col-sm-9">
                                            <input type="text" name="tel2" value="<%=tel2%>" class="form-control">
                                        </div>
                                    </div>

                                    <div class="form-group spacer2">
                                        <div class="col-sm-3"></div>
                                        <label class="col-sm-9"  for="inputPassword3">Modifier Mot de passe</label>

                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="inputPassword3">Mot de passe</label>
                                        <div class="col-sm-9">
                                            <input type="password" name="pwd1" placeholder="Mot de passe" id="inputPassword3" class="form-control">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label" for="inputPassword4">Confirmer mot de passe</label>
                                        <div class="col-sm-9">
                                            <input type="password" name="pwd2" placeholder="Mot de passe" id="inputPassword4" class="form-control">
                                        </div>
                                    </div>


                                    <div id="crop-image" class="md-modal colored-header md-effect-1">
                                        <div class="md-content">

                                            <div class="modal-footer">
                                                <input class="btn btn-default btn-flat md-close" data-dismiss="modal" type="submit" value="Enregistrer" name="Enregistrer"/>

                                            </div>
                                        </div>
                                    </div></form>
                                <div class="md-overlay"></div>
                            </div>
                        </div>
                    </div>            
                </div> 

            </div>

            <script src="../js/jquery.js"></script>
            <script type="text/javascript" src="../js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
            <script type="text/javascript" src="../js/jquery.sparkline/jquery.sparkline.min.js"></script>
            <script type="text/javascript" src="../js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
            <script type="text/javascript" src="../js/behaviour/general.js"></script>
            <script src="../js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
            <script type="text/javascript" src="../js/jquery.nestable/jquery.nestable.js"></script>
            <script type="text/javascript" src="../js/bootstrap.switch/bootstrap-switch.min.js"></script>
            <script type="text/javascript" src="../js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
            <script src="../js/jquery.select2/select2.min.js" type="text/javascript"></script>
            <script src="../js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
            <script type="text/javascript" src="../js/jquery.gritter/js/jquery.gritter.min.js"></script>

            <script type="text/javascript">
                $(document).ready(function() {
                    //initialize the javascript
                    App.init();
                });
            </script>

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
