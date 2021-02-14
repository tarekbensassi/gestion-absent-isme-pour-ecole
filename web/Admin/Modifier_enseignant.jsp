<%-- 
    Document   : Accueil
    Created on : Mar 14, 2016, 12:11:47 PM
    Author     : Akram
--%>

<%@page import="Model.Authentification"%>
<%@page import="Model.Utilisateur"%>
<%@page import="Model.Enseignant"%>
<%@page import="java.util.Iterator"%>
<%@page import="Controller.Gestion"%>
<%@page import="org.hibernate.HibernateException"%>
<%@page import="java.util.List"%>
<%@page import="Model.Matiere"%>
<%@page import="Model.Matiere"%>
<%@page import="org.hibernate.Session"%>
<%@page import="Model.HibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
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

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="../../assets/js/libs/utils/html5shiv.js?1403934957"></script>
        <script type="text/javascript" src="../../assets/js/libs/utils/respond.min.js?1403934956"></script>
        <![endif]-->
    </head>
    <body class="menubar-hoverable header-fixed menubar-pin ">
 <% String id_ens = request.getParameter("id_ens");
    String id_us = request.getParameter("id_ut");

            String nom = "";
            String prenom = "";
            String adresse = "";
            String mail = "";
            String mat = "";
            String us = "";
            String pwd = "";
            int tel = 0;
            int id=0;
           
            
            
            Gestion g = new Gestion();
            Iterator it_et = g.listeEnseignant1(Integer.valueOf(id_ens));
            
            while (it_et.hasNext()) {
                Enseignant et = (Enseignant) it_et.next();
               
                mat = et.getMatricule();
                
            }
            Iterator it_et1 = g.Authentification1(Integer.valueOf(id_us));
             while (it_et1.hasNext()) {
                Authentification et = (Authentification) it_et1.next();
                id=et.getIdAuth();
                us = et.getLogin();
                pwd =et.getPwd();
            }
            Iterator it_ut = g.listuser(Integer.valueOf(id_us));
            while (it_ut.hasNext()) {
               Utilisateur et1 = (Utilisateur) it_ut.next();
                
                nom = et1.getNom();
                prenom = et1.getPrenom();
                adresse = et1.getAdresse();
                tel = et1.getTel();
                mail = et1.getEmail();
            }
            
        %>
        <!-- BEGIN HEADER-->
        <header id="header" >
            <div class="headerbar">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="headerbar-left">
                    <ul class="header-nav header-nav-options">
                        <li class="header-nav-brand" >
                            <div class="brand-holder">
                                <a href="Accueil.jsp">
                                    <span class="text-lg text-bold text-primary">GESTION DES ABSENCES</span>
                                </a>
                            </div>
                        </li>
                        <li>
                            <a class="btn btn-icon-toggle menubar-toggle" data-toggle="menubar" href="javascript:void(0);">
                                <i class="fa fa-bars"></i>
                            </a>
                        </li>
                    </ul>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="headerbar-right">

                    <ul class="header-nav header-nav-profile">
                        <li class="dropdown">
                            <a href="javascript:void(0);" class="dropdown-toggle ink-reaction" data-toggle="dropdown">
                                <img src="../assets/img/avataradmin.png" alt="" />
                                <span class="profile-info">
                                    ADMINSTRATEUR
                                    <small>ISIMG</small>
                                </span>
                            </a>
                            <ul class="dropdown-menu animation-dock">

                              
                                <li><a href="../login.jsp"><i class="fa fa-fw fa-power-off text-danger"></i> Deconnecter</a></li>
                            </ul><!--end .dropdown-menu -->
                        </li><!--end .dropdown -->
                    </ul><!--end .header-nav-profile -->

                </div><!--end #header-navbar-collapse -->
            </div>
        </header>
        <!-- END HEADER-->

        <!-- BEGIN BASE-->
        <div id="base">

            <!-- BEGIN OFFCANVAS LEFT -->
            <div class="offcanvas">
            </div><!--end .offcanvas-->
            <!-- END OFFCANVAS LEFT -->

            <!-- BEGIN CONTENT-->
            <div id="content">

                <!-- BEGIN BLANK SECTION -->
                <section>

                    <div class="section-body">
                        <div class="row">


                            <div class="col-lg-12">
                               <form class="form-horizontal" action="../ModifierEnseignant" >
                                    <input type="hidden" value="<%=id_ens%>" name="id_ens">
                                    <input type="hidden" value="<%=id_us%>" name="id_ut">
                                     <input type="hidden" value="<%=id%>" name="id_auth">

                        <div class="section-body">
                            <div class="row">


                                <div class="col-lg-12">

                                    <div class="card">
                                        <div class="card-head style-primary">
                                            <header>Modifier enseingant</header>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="Firstname5" class="col-sm-4 control-label">Nom</label>
                                                        <div class="col-sm-8">
                                                            <input name="nom" value="<%=nom%>" type="text" class="form-control" id="Firstname5">
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="Lastname5" class="col-sm-4 control-label">Prenom</label>
                                                        <div class="col-sm-8">
                                                            <input name="prenom"  value="<%=prenom%>" type="text" class="form-control" id="Lastname5">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                             <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">Adresse</label>
                                                <div class="col-sm-10">
                                                    <input type="text"  value="<%=adresse%>" class="form-control" id="adresse" name="adresse">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">Téléphone</label>
                                                <div class="col-sm-10">
                                                    <input name="tel"  value="<%=tel%>" type="text" class="form-control" id="Username5">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">E-mail</label>
                                                <div class="col-sm-10">
                                                    <input type="email" value="<%=mail%>" name="email" class="form-control" id="Username5">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">Matricule</label>
                                                <div class="col-sm-10">
                                                    <input type="mat" value="<%=mat%>" name="matricule" class="form-control" id="Username5">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">Nom d'utilisateur</label>
                                                <div class="col-sm-10">
                                                    <input type="text" value="<%=us%>" name="login" class="form-control" id="Username5">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Password5" class="col-sm-2 control-label">Mot de passe</label>
                                                <div class="col-sm-10">
                                                    <input type="password" value="<%=pwd%>" name="pwd" class="form-control" id="Password5">
                                                </div>
                                            </div>
                                        </div><!--end .card-body -->
                                        <div class="card-actionbar">
                                            <div class="card-actionbar-row">
                                                <button type="submit" name="bt" class="btn btn-flat btn-primary ink-reaction" value="Enregistrer">Enregistrer</button>
                                                <button type="reset" name="bt" class="btn btn-flat btn-danger ink-reaction" value="Annuler">Annuler</button>
                                            </div>
                                        </div>
                                    </div><!--end .card -->
                                </div><!--end .col -->
                            </div><!--end .row -->
                        </div><!--end .section-body -->
                    </form>
                            </div><!--end .col -->
                        </div><!--end .row -->

                    </div><!--end .section-body -->
                </section>

                <!-- BEGIN BLANK SECTION -->
            </div><!--end #content-->
            <!-- END CONTENT -->

            <!-- BEGIN MENUBAR-->
            <div id="menubar" class="menubar-inverse ">
                <div class="menubar-fixed-panel">
                    <div>
                        <a class="btn btn-icon-toggle btn-default menubar-toggle" data-toggle="menubar" href="javascript:void(0);">
                            <i class="fa fa-bars"></i>
                        </a>
                    </div>
                    <div class="expanded">
                        <a href="../Admin/Accueil.jsp">
                            <span class="text-lg text-bold text-primary ">MATERIAL&nbsp;ADMIN</span>
                        </a>
                    </div>
                </div>
                <div class="menubar-scroll-panel">

                    <!-- BEGIN MAIN MENU -->
                   <ul id="main-menu" class="gui-controls">

                        <!-- BEGIN DASHBOARD -->
                        <li>
                            <a href="Accueil.jsp" >
                                <div class="gui-icon"><i class="md md-home"></i></div>
                                <span class="title">Accueil</span>
                            </a>
                        </li><!--end /menu-li -->
                        <!-- END DASHBOARD -->

                        <!-- BEGIN EMAIL -->
                        <li class="gui-folder">
                            <a>
                                <div class="gui-icon"><i class="md md-email"></i></div>
                                <span class="title">Gestion des enseignants</span>
                            </a>
                            <!--start submenu -->
                            <ul>
                                <li><a href="Ajouter_enseignant.jsp" ><span class="title">Ajouter enseignant</span></a></li>
                                <li><a href="Liste_enseignants.jsp" ><span class="title">Liste enseignant</span></a></li>
                                <li><a href="absence_Enseignant.jsp" ><span class="title">Marquer l'absence D'enseignants</span></a></li>
                                <li><a href="ListeAbsenceEnseignant.jsp" ><span class="title">liste  d'absence Des enseignants</span></a></li>
                                

                            </ul><!--end /submenu -->
                        </li><!--end /menu-li -->
                        <!-- END EMAIL -->

                        <!-- BEGIN DASHBOARD -->


                        <!-- BEGIN UI -->
                        <li class="gui-folder">
                            <a>
                                <div class="gui-icon"><i class="fa fa-puzzle-piece fa-fw"></i></div>
                                <span class="title">Gestion des classes</span>
                            </a>
                            <!--start submenu -->
                            <ul>
                                <li><a href="Ajouter_classe.jsp" ><span class="title">Ajouter classe</span></a></li>
                                <li><a href="Liste_classe.jsp" ><span class="title">Liste des classes</span></a></li>


                            </ul><!--end /submenu -->
                        </li><!--end /menu-li -->
                        <li class="gui-folder">
                            <a>
                                <div class="gui-icon"><i class="fa fa-puzzle-piece fa-fw"></i></div>
                                <span class="title">Gestion des semestres</span>
                            </a>
                            <!--start submenu -->
                            <ul>
                                <li><a href="Ajouter_semestre.jsp" ><span class="title">Ajouter semestre</span></a></li>
                                <li><a href="Liste_semestre.jsp" ><span class="title">Liste des semestres</span></a></li>


                            </ul><!--end /submenu -->
                        </li><!--end /menu-li -->
                        <!-- END UI -->

                        <!-- BEGIN TABLES -->
                        <li class="gui-folder">
                            <a>
                                <div class="gui-icon"><i class="fa fa-table"></i></div>
                                <span class="title">Gestion des modules</span>
                            </a>
                            <!--start submenu -->
                            <ul>
                                <li><a href="Ajouter_module.jsp" ><span class="title">Ajouter module</span></a></li>
                                <li><a href="Liste_module.jsp" ><span class="title">Liste des modules</span></a></li>
                            </ul><!--end /submenu -->
                        </li><!--end /menu-li -->
                        <!-- END TABLES -->

                        <!-- BEGIN FORMS -->
                        <li class="gui-folder">
                            <a>
                                <div class="gui-icon"><span class="glyphicon glyphicon-list-alt"></span></div>
                                <span class="title">Gestion des matieres</span>
                            </a>
                            <!--start submenu -->
                            <ul>
                                <li><a href="Ajouter_matiere.jsp" ><span class="title">Ajouter matiere</span></a></li>
                                <li><a href="Liste_matiere.jsp" ><span class="title">Liste des matieres</span></a></li>
                            </ul><!--end /submenu -->
                        </li><!--end /menu-li -->
                        <!-- END FORMS -->

                        <!-- BEGIN PAGES -->
                        <li class="gui-folder">
                            <a>
                                <div class="gui-icon"><i class="md md-computer"></i></div>
                                <span class="title">Gestion des etudiants</span>
                            </a>
                            <!--start submenu -->
                            <ul>


                                <li><a href="Ajouter_etudiant.jsp" ><span class="title">Ajouter etudiants</span></a></li>
                                <li><a href="Liste_etudiants.jsp" ><span class="title">Liste des etudiants</span></a></li>
                                 <li><a href="Listeetudiants1.jsp" ><span class="title">Historique de Absence</span></a></li>
                                  <li><a href="GenereElimine1.jsp" ><span class="title">Genere liste Elimine</span></a></li>

                            </ul><!--end /submenu -->
                        </li><!--end /menu-li -->

                    </ul><!--end .main-menu -->
                    <!-- END MAIN MENU -->

                    <div class="menubar-foot-panel">
                        <small class="no-linebreak hidden-folded">
                            <span class="opacity-75">Copyright &copy; 2016</span> <strong>ISIMG</strong>
                        </small>
                    </div>
                </div><!--end .menubar-scroll-panel-->
            </div><!--end #menubar-->
      
        </div><!--end #base-->
        <!-- END BASE -->

        <!-- BEGIN JAVASCRIPT -->
        <script src="../assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
        <script src="../assets/js/libs/jquery/jquery-migrate-1.2.1.min.js"></script>
        <script src="../assets/js/libs/bootstrap/bootstrap.min.js"></script>
        <script src="../assets/js/libs/spin.js/spin.min.js"></script>
        <script src="../assets/js/libs/autosize/jquery.autosize.min.js"></script>
        <script src="../assets/js/libs/nanoscroller/jquery.nanoscroller.min.js"></script>
        <script src="../assets/js/core/source/App.js"></script>
        <script src="../assets/js/core/source/AppNavigation.js"></script>
        <script src="../assets/js/core/source/AppOffcanvas.js"></script>
        <script src="../assets/js/core/source/AppCard.js"></script>
        <script src="../assets/js/core/source/AppForm.js"></script>
        <script src="../assets/js/core/source/AppNavSearch.js"></script>
        <script src="../assets/js/core/source/AppVendor.js"></script>
        <script src="../assets/js/core/demo/Demo.js"></script>
        <!-- END JAVASCRIPT -->

    </body>
</html>
