<%@page import="Pojo.Enseignant"%>
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
            while (it.hasNext()) {
                Etudiant tg = (Etudiant) it.next();
                i++;
                img = tg.getImage();
                nom = tg.getNom();
                prenom = tg.getPrenom();
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
                <h2>Liste des enseignants</h2>
            </div>		
            <div class="cl-mcont">
                <div class="row">
                    <div class="col-md-12">
                        <div class="block-flat">
                            <div class="header">							
                                <h3>Liste des enseignants</h3>
                            </div>
                            <div class="content">
                                <div class="table-responsive">
                                    <table class="table table-bordered" id="datatable" >
                                        <thead>
                                            <tr>
                                                <th>Nom</th>
                                                <th>Prenom</th>
                                                <th>Email</th>
                                                <th>Image</th>
                                                <th>Contacter</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <%
                                                Editer ld = new Editer();
                                                Iterator it1 = ld.liste_Enseignant(1);
                                                int j = 0;
                                                String Nom = "";
                                                String Prenom = "";
                                                String Email = "";
                                                String Image = "";

                                                while (it1.hasNext()) {
                                                    Enseignant of = (Enseignant) it1.next();
                                                    Nom = of.getNom();
                                                    Prenom = of.getPrenom();
                                                    Email = of.getEmail();
                                                    Image = of.getImage();

                                            %>
                                            <tr class="gradeA">
                                                <td><%=Nom%></td>
                                                <td><%=Prenom%></td>
                                                <td><%=Email%></td>
                                                <td><img alt="Avatar" height="30" width="30" src="Users/<%=Image%>" /></td>
                                                <td><button href="#myModal_message<%=i%>" data-toggle="modal" class="btn btn-danger btn-xs"><i class="fa  fa-envelope"></i></button></td>
                                        <form action="EnvoyerMessage"  method="POST">
                                            <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="myModal_message<%=i%>" class="modal fade">
                                                <div class="modal-dialog">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                            <h4 class="modal-title">Envoyer message</h4>
                                                        </div>
                                                        <input type="hidden" name="id_user" value="<%=of.getIdEnseignant()%>"/>      
                                                        <input type="hidden" name="ty_destin" value="1"/>      
                                                        <input type="hidden" name="ty_exp" value="2"/>      

                                                        <div class="modal-body">
                                                            <p>Titre</p>
                                                            <input class=" form-control" id="titre" name="titre" type="text" />
                                                            <p></p>
                                                            <p>Message</p>
                                                            <textarea class="form-control" maxlength="250" cols="60" rows="4" name="message" ></textarea>
                                                            <div class="modal-footer">
                                                                <button data-dismiss="modal" class="btn btn-default" type="button">Annuller</button>
                                                                <input name="Envoyer1" type="submit" value="Envoyer" class="btn btn-success">
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </form>
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
        <script type="text/javascript" src="js/behaviour/general.js"></script>
        <script src="js/jquery.ui/jquery-ui.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.nestable/jquery.nestable.js"></script>
        <script type="text/javascript" src="js/bootstrap.switch/bootstrap-switch.min.js"></script>
        <script type="text/javascript" src="js/bootstrap.datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
        <script src="js/jquery.select2/select2.min.js" type="text/javascript"></script>
        <script src="js/bootstrap.slider/js/bootstrap-slider.js" type="text/javascript"></script>
        <script type="text/javascript" src="js/jquery.gritter/js/jquery.gritter.min.js"></script>

        <script type="text/javascript">
            $(document).ready(function() {
                //initialize the javascript
                App.init();
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
