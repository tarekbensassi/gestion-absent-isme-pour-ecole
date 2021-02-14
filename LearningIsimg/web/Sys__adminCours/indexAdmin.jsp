<%-- 
    Document   : index
    Created on : 2 avr. 2014, 20:56:49
    Author     : BENAHMED
--%>

<%@page import="Pojo.Admin"%>
<%@page import="controller.LoginAdmin"%>
<%@page import="controller.Editer"%>
<%@page import="controller.LoginServlet"%>
<%@page import="java.util.Iterator"%>
<%@page import="Pojo.Enseignant"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
                response.sendRedirect("Authentification.jsp");
            }
            Editer edite = new Editer();
            Iterator it = edite.Admin_connecte(Integer.valueOf(LoginAdmin.identifiantAdmin));
            int i = 0;
            String img = null;
            String nom = null;
            String prenom = null;
            while (it.hasNext()) {
                Admin tg = (Admin) it.next();
                i++;
                img = tg.getImage();
                nom = tg.getNom();
                prenom = tg.getPrenom();
            }
        %>
        <!-- Fixed navbar -->
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar"  height="30" width="30" src="../Users/administrator-icon.png" /><%=nom%> <%=prenom%><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="../Sys__adminCours/MessagesRecus.jsp">Messages</a></li>
                                <li class="divider"></li>
                                <li><form action="../Logout" method="post"><input type="submit" class="btn btn-link" value="Deconnecter"></form></li>
                            </ul>
                        </li>
                    </ul>			
                </div><!--/.nav-collapse -->
            </div>
        </div>
        <div id="cl-wrapper">
            <div class="cl-sidebar">
                <div class="cl-toggle"><i class="fa fa-bars"></i></div>
                <div class="cl-navblock">
                    <ul class="cl-vnavigation">
                        <li><a href="../Sys__adminCours/indexAdmin.jsp"><i class="fa fa-home"></i>Accueil</a></li>

                        <li><a href="#"><i class="fa fa-check"></i>Demande d'inscription</a>
                            <ul class="sub-menu">
                                <li><a href="../Sys__adminCours/Demande enseignant.jsp">Demandes des enseignant</a></li>
                                <li><a href="../Sys__adminCours/Demande etudiant.jsp">Demande des etudiant</a></li>
                            </ul>
                        <li><a href="#"><i class="fa fa-book"></i>Cours</a>
                            <ul class="sub-menu">
                                <li><a href="../Sys__adminCours/Liste Cours.jsp">Liste des cours</a></li>
                                <li><a href="../Sys__adminCours/Liste Traveaux Pratique.jsp">Liste des Traveaux Pratique</a></li>
                                <li><a href="../Sys__adminCours/Liste Traveaux diriges.jsp">Liste des Traveaux Dirigés</a></li>
                                <li><a href="../Sys__adminCours/AjouterCours.jsp">Ajouter un document</a></li>
                            </ul>
                        </li>
                        <li><a href="../Sys__adminCours/ListeEnseignant.jsp"><i class="fa  fa-folder-open"></i>Liste des enseignants</a>
                        <li><a href="../Sys__adminCours/ListeEtudiant.jsp"><i class="fa  fa-folder-open"></i>Liste des etudiants</a>
                        <li><a href="#"><i class="fa fa-envelope"></i>Messages</a>
                            <ul class="sub-menu">
                                <li><a href="../Sys__adminCours/MessagesRecus.jsp">Messages reçus</a></li>
                                <li><a href="../Sys__adminCours/MessagesEnvoyer.jsp">Messages Envoyer</a></li>

                            </ul>
                        </li>
                    </ul>
                </div>
            </div>

            <div class="container-fluid" id="pcont">
                <div class="page-head">
                    <h2>Accueil</h2>

                </div>		
                <div class="cl-mcont">
                    <h3 class="text-center">Content goes here!</h3>
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
