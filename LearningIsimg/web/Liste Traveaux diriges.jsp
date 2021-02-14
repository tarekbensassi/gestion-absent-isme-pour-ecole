<%@page import="Pojo.DocumentTd"%>
<%@page import="Pojo.DocumentCours"%>
<%@page import="Pojo.Etudiant"%>
<%@page import="controller.LoginServlet"%>
<%@page import="java.util.Iterator"%>
<%@page import="controller.Editer"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="shortcut icon" href="images/footer_logo.png">
        <title>Cours Isimg</title>
        <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,400italic,700,800' rel='stylesheet' type='text/css'>
        <link href='http://fonts.googleapis.com/css?family=Raleway:300,200,100' rel='stylesheet' type='text/css'>

        <!-- Bootstrap core CSS -->
        <link href="js/bootstrap/dist/css/bootstrap.css" rel="stylesheet">
        <link rel="stylesheet" type="text/css" href="js/jquery.gritter/css/jquery.gritter.css" />

        <link rel="stylesheet" href="fonts/font-awesome-4/css/font-awesome.min.css">

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
          <script src="../../assets/js/html5shiv.js"></script>
          <script src="../../assets/js/respond.min.js"></script>
        <![endif]-->
        <link rel="stylesheet" type="text/css" href="js/jquery.nanoscroller/nanoscroller.css" />
        <link rel="stylesheet" type="text/css" href="js/jquery.easypiechart/jquery.easy-pie-chart.css" />
        <link rel="stylesheet" type="text/css" href="js/bootstrap.switch/bootstrap-switch.css" />
        <link rel="stylesheet" type="text/css" href="js/bootstrap.datetimepicker/css/bootstrap-datetimepicker.min.css" />
        <link rel="stylesheet" type="text/css" href="js/jquery.select2/select2.css" />
        <link rel="stylesheet" type="text/css" href="js/bootstrap.slider/css/slider.css" />
        <!-- Custom styles for this template -->
        <link href="css/style.css" rel="stylesheet" />	

    </head>


    <body>

        <!-- Fixed navbar -->
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
            Iterator it = edite.Etudiant_connecte(Integer.valueOf(LoginServlet.identifiantEtudiant));
            int i = 0;
            String img = null;
            String nom = null;
            String prenom = null;
            String niveau = null;
            String filiere = null;
            while (it.hasNext()) {
                Etudiant tg = (Etudiant) it.next();
                i++;
                img = tg.getImage();
                nom = tg.getNom();
                prenom = tg.getPrenom();
                niveau = tg.getIdNiveau();
                filiere = tg.getIdFilliere();

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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar" height="31" width="31" src="Users/<%=img%>" /><%=nom%> <%=prenom%> <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="Profile.jsp">Profile</a></li>
                                <li><a href="MessagesRecus.jsp">Messages</a></li>
                                <li class="divider"></li>
                                <li><form action="Logout" method="post"><input type="submit" class="btn btn-primary" value="Deconnecter"></form></li>
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
                        <li><a href="indexEtudiant.jsp"><i class="fa fa-home"></i>Accueil</a></li>
                        <li><a href="ListeEnseignant.jsp"><i class="fa fa-users"></i>Liste des enseignants</a></li>
                        <li><a href="Liste Cours.jsp"><i class="fa fa-book"></i>Liste des cours</a></li>
                        <li><a href="Liste Traveaux Pratique.jsp"><i class="fa fa-bookmark"></i>Liste des Traveaux Pratique</a></li>
                        <li><a href="Liste Traveaux diriges.jsp"><i class="fa fa-bookmark-o"></i>Liste des Traveaux Dirigés</a></li>
                        <li><a href="#"><i class="fa fa-envelope"></i>Messages</a>
                            <ul class="sub-menu">
                                <li><a href="MessagesRecus.jsp">Messages reçus</a></li>
                                <li><a href="MessagesEnvoyer.jsp">Messages Envoyer</a></li>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="container-fluid" id="pcont">
            <div class="page-head">
                <h2>Liste Traveaux Dirigés</h2>

            </div>		
            <div class="cl-mcont">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block-flat">
                            <div class="header">							
                                <h3></h3>
                            </div>
                            <div class="content">
                                <div class="table-responsive">

                                    <table class="table table-bordered" id="datatable" >
                                        <thead>
                                            <tr>
                                                <th>Titre</th>
                                                <th>Description</th>
                                                <th>Matiére</th>
                                                <th>Date d'ajout</th>
                                                <th>Telecharger</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Editer ld = new Editer();
                                                Iterator it1 = ld.liste_td_niveau_filliere(Integer.valueOf(niveau), filiere);
                                                int j = 0;
                                                String titre = "";
                                                String Description = "";
                                                String Dateaj = "";
                                                String matiere = "";

                                                String Telecharger = "";

                                                while (it1.hasNext()) {
                                                    DocumentTd of = (DocumentTd) it1.next();
                                                    titre = of.getNom();
                                                    Description = of.getDescription();
                                                    matiere = of.getMatiere();
                                                    Dateaj = of.getDateAjout();
                                                    Telecharger = of.getFichierJointe();
                                            %>
                                            <tr class="gradeA">
                                                <td><%=titre%></td>
                                                <td><%=Description%></td>
                                                <td><%=matiere%></td>
                                                <td><%=Dateaj%></td>
                                                <td> <a href="DownloadCours?test=<%=Telecharger%>"><%=Telecharger%></a></td>
                                            </tr>
                                            <%}%>

                                        </tbody>
                                    </table>							
                                </div>
                            </div>
                        </div>				
                    </div>
                </div>
            </div>
        </div> 



        <script src="js/jquery.js"></script>
        <script type="text/javascript" src="js/jquery.nanoscroller/jquery.nanoscroller.js"></script>
        <script type="text/javascript" src="js/jquery.sparkline/jquery.sparkline.min.js"></script>
        <script type="text/javascript" src="js/jquery.easypiechart/jquery.easy-pie-chart.js"></script>
        <script src="https://maps.googleapis.com/maps/api/js?v=3.exp&amp;sensor=false"></script>
        <script type="text/javascript" src="js/behaviour/general.js"></script>
        <script src="js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
        <script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.min.js"></script>
        <script type="text/javascript" src="js/jquery.datatables/jquery.datatables.min.js"></script>
        <script type="text/javascript" src="js/jquery.datatables/bootstrap-adapter/js/datatables.js"></script>


        <script type="text/javascript">
            $(document).ready(function() {
                //initialize the javascript
                App.init();
                App.dataTables();
            });
        </script>
        <!-- Bootstrap core JavaScript
        ================================================== -->
        <!-- Placed at the end of the document so the pages load faster -->
        <script src="js/bootstrap/dist/js/bootstrap.min.js"></script>
        <script type="text/javascript" src="js/jquery.flot/jquery.flot.js"></script>
        <script type="text/javascript" src="js/jquery.flot/jquery.flot.pie.js"></script>
        <script type="text/javascript" src="js/jquery.flot/jquery.flot.resize.js"></script>
        <script type="text/javascript" src="js/jquery.flot/jquery.flot.labels.js"></script>
    </body>
</html>
