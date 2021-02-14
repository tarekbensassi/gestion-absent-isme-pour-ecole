<%@page import="Pojo.DocumentTd"%>
<%@page import="Pojo.DocumentTp"%>
<%@page import="Pojo.DocumentCours"%>
<%@page import="Pojo.Admin"%>
<%@page import="controller.LoginAdmin"%>
<%@page import="Pojo.Filiere"%>
<%@page import="Pojo.Enseignant"%>
<%@page import="controller.LoginServlet"%>
<%@page import="controller.Editer"%>
<%@page import="Pojo.Matiers"%>
<%@page import="java.util.Iterator"%>
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
        <link rel="stylesheet" href="../js/bootstrap-fileupload/bootstrap-fileupload.css">



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
            String num_cour = request.getParameter("id_cours");
            String num_fen = request.getParameter("types");
            Editer edite = new Editer();

            Iterator it = edite.Enseignant_connecte(Integer.valueOf(LoginServlet.identifiantEnseignant));
            int i = 0;
            String img = null;
            String nom = null;
            String prenom = null;
            while (it.hasNext()) {
                Enseignant tg = (Enseignant) it.next();
                i++;
                img = tg.getImage();
                nom = tg.getNom();
                prenom = tg.getPrenom();
            }
            Iterator it1;
            int ident = 0;
            String nom_cours = null;
            String fichier = null;
            String desc_cours = null;
            String mati = null;
            int niv = 0;
            String fillie = null;
            if (num_fen.equals("1")) {
                it1 = edite.cours_mod(Integer.valueOf(num_cour));
                int j = 0;

                while (it1.hasNext()) {
                    DocumentCours dc = (DocumentCours) it1.next();
                    j++;
                    ident = dc.getIdDocCours();
                    nom_cours = dc.getNom();
                    fichier = dc.getFichierJointe();
                    desc_cours = dc.getDescription();
                    mati = dc.getIdMatiers();
                    niv = dc.getNiveau();
                    fillie = dc.getFilliere();

                }
            } else if (num_fen.equals("2")) {
                it1 = edite.td_mod(Integer.valueOf(num_cour));
                int j = 0;

                while (it1.hasNext()) {
                    DocumentTd dc = (DocumentTd) it1.next();
                    j++;
                    ident = dc.getIdDocumentTd();
                    nom_cours = dc.getNom();
                    fichier = dc.getFichierJointe();
                    desc_cours = dc.getDescription();
                    mati = dc.getMatiere();
                    niv = dc.getNiveau();
                    fillie = dc.getFilliere();

                }
            } else {
                it1 = edite.tp_mod(Integer.valueOf(num_cour));
                int j = 0;
                while (it1.hasNext()) {
                    DocumentTp dc = (DocumentTp) it1.next();
                    j++;
                    ident = dc.getIdDocumentTp();
                    nom_cours = dc.getNom();
                    fichier = dc.getFichierJointe();
                    desc_cours = dc.getDescription();
                    mati = dc.getMatiere();
                    niv = dc.getNiveau();
                    fillie = dc.getFilliere();

                }
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
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown"><img alt="Avatar"  height="30" width="30" src="../Users/<%=img%>" /><%=nom%> <%=prenom%><b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li><a href="../Professeur/Profile.jsp">Profile</a></li>
                                <li><a href="../Professeur/MessagesRecus.jsp">Messages</a></li>
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
            <div class="container-fluid" id="pcont">
                <div class="page-head">
                    <h2>Modifier</h2>
                </div>		
                <div class="cl-mcont">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="block-flat">
                                <form accept-charset="UTF-8" class="form-horizontal group-border-dashed" id="signupForm" method="POST" action="../Modifier" enctype="multipart/form-data">
                                    <input type="hidden" name="type_user" value="prof">
                                    <input type="hidden" name="typeC" value="<%=num_fen%>">
                                    <input type="hidden" name="numero" value="<%=ident%>">
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Type</label>
                                        <% if (num_fen.equals("1")) {%>
                                        <div class="col-sm-6">
                                            <select name="type" class="form-control">
                                                <option>Cours</option>
                                                <option>Traveaux Pratique</option>
                                                <option>Traveaux diriges</option>
                                            </select>									
                                        </div>
                                        <%} else if (num_fen.equals("2")) {%>
                                        <div class="col-sm-6">
                                            <select name="type" class="form-control">
                                                <option>Traveaux diriges</option>
                                                <option>Cours</option>
                                                <option>Traveaux Pratique</option>


                                            </select>									
                                        </div>
                                        <%} else {%>
                                        <div class="col-sm-6">
                                            <select name="type" class="form-control">
                                                <option>Traveaux Pratique</option>
                                                <option>Cours</option>
                                                <option>Traveaux diriges</option>
                                            </select>									
                                        </div>
                                        <%}%>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Titre</label>
                                        <div class="col-sm-6">
                                            <input type="text" name="nom" class="form-control" value="<%=nom_cours%>" required placeholder="Titre cours" />
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Description</label>
                                        <div class="col-sm-6">
                                            <textarea name="description" class="form-control" ><%=desc_cours%></textarea>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Matière</label>
                                        <div class="col-sm-6">
                                            <select required class="form-control" name="matiere">
                                                <option><%= mati%></option>
                                                <%
                                                    Iterator it_matiere = edite.liste_Matiere_mod_cou(mati);
                                                    int f = 0;
                                                    while (it_matiere.hasNext()) {
                                                        Matiers matier = (Matiers) it_matiere.next();
                                                        f++;
                                                %>
                                                <option><%=matier.getNom()%></option>
                                                <%}%>
                                            </select>								
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Filliere</label>
                                        <div class="col-sm-6">
                                            <select required class="form-control" name="filiere">
                                                <option><%=fillie%></option>
                                                <%
                                                    Iterator it_filliere = edite.liste_Filiere_mod_cou(fillie);
                                                    int x = 0;
                                                    while (it_filliere.hasNext()) {
                                                        Filiere filiere = (Filiere) it_filliere.next();
                                                        x++;
                                                %>
                                                <option><%=filiere.getLibelle()%></option>
                                                <%}%>
                                            </select>								
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="col-sm-3 control-label">Niveau d'etude</label>
                                        <div class="col-sm-6">
                                            <% if (niv == 1) {%>
                                            <select name="niveau" class="form-control">
                                                <option>1</option>
                                                <option>2</option>
                                                <option>3</option>
                                            </select>	
                                            <%} else if (niv == 2) { %>
                                            <select name="niveau" class="form-control">
                                                <option>2</option>
                                                <option>1</option>
                                                <option>3</option>
                                            </select>	
                                            <%} else if (niv == 3) { %>
                                            <select name="niveau" class="form-control">
                                                <option>3</option>
                                                <option>1</option>
                                                <option>2</option>
                                            </select>	
                                            <%}%>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label class="control-label col-md-3">Fichier jointe</label>
                                        <div class="controls col-md-9">
                                            <div class="fileupload fileupload-exists" data-provides="fileupload"><input type="hidden" value="" name=""><input type="hidden">
                                                <span class="btn btn-white btn-file">
                                                    <span class="fileupload-new"><i class="fa fa-upload"></i> Choisir fichier</span>
                                                    <span class="fileupload-exists"><i class="fa fa-upload"></i> Changer fichier</span>
                                                    <input type="file" name="file" class="default" value="../COurs/<%=fichier%>">
                                                </span>
                                                <span class="fileupload-preview" style="margin-left:5px;"><%=fichier%></span>
                                                <a href="#" class="close fileupload-exists" data-dismiss="fileupload" style="float: none; margin-left:5px;"></a>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <div class="col-sm-offset-2 col-sm-10">
                                            <input   class="btn btn-primary" type="submit" value="Enregistrer" name="Enregistrer">
                                            <button class="btn btn-default">Annuler</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
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
        <script type="text/javascript" src="../js/bootstrap-fileupload/bootstrap-fileupload.js"></script>

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
