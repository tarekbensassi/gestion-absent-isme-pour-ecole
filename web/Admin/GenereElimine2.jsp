<%-- 
    Document   : Accueil
    Created on : Mar 14, 2016, 12:11:47 PM
    Author     : ingwa
--%>

<%@page import="Model.Semester"%>
<%@page import="Model.Module"%>
<%@page import="Model.Classe"%>
<%@page import="java.util.Iterator"%>
<%@page import="Controller.Gestion"%>
<%@page import="java.util.Date"%>
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
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/libs/wizard/wizard.css?1425466601" />
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/libs/DataTables/jquery.dataTables.css?1423553989" />
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/libs/DataTables/extensions/dataTables.colVis.css?1423553990" />
        <link type="text/css" rel="stylesheet" href="../assets/css/theme-default/libs/DataTables/extensions/dataTables.tableTools.css?1423553990" />

        <!-- END STYLESHEETS -->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="../assets/js/libs/utils/html5shiv.js?1403934957"></script>
        <script type="text/javascript" src="../assets/js/libs/utils/respond.min.js?1403934956"></script>
        <![endif]-->
    </head>
    <body class="menubar-hoverable header-fixed menubar-pin ">
        <!-- BEGIN HEADER-->
        <header id="header" >
            <% String Classe = request.getParameter("id_class");%>
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
                                <img src="../assets/img/avatar1.jpg?1403934956" alt="" />
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
                <section class="style-default-bright">
                    <div class="section-header">
                        <h2 class="text-primary">Genere Liste Eliminée</h2>
                    </div>
                    <div class="section-body">
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body ">
                                        <form action="../GenereElimine">
                                            <div class="row">
                                                <div class="form-group">
                                                    <label for="select1" class="col-sm-2 control-label">Module</label>
                                                    <div class="col-sm-10">
                                                        <select id="select1" name="IdModule" class="form-control">
                                                            <%
                                                                      Gestion gestion = new Gestion();
                                                                String ch="";
                                                                 java.util.Date dat_seance = new Date();
                                                                int id_semestre = 0;
                                                              
                                                                Iterator it_sem = gestion.listeSem();
                                                                    while (it_sem.hasNext()) {
                                                                    Semester sem = (Semester) it_sem.next();
                                                                    if ((dat_seance.before(sem.getDatefinSemester()) && (dat_seance.after(sem.getDatedebutSemester())))) {
                                                                        id_semestre = sem.getIdSemester();
                                                                    }
                                                                }
                                                                
                                                                        
                                                                Iterator it_mod = gestion.listeModuleClasseSemes1(Integer.valueOf(id_semestre));
                                                                while (it_mod.hasNext()) {
                                                                    Module module = (Module) it_mod.next();
                                                                    if(module.getAmphi().startsWith(Classe)){


                                                            %>
                                                            <option value="<%=module.getIdModule()%>;<%=module.getIdSemester()%>"><%=module.getLibelle() %></option>
                                                            <% } }%>
                                                        </select>
                                                        <input required type="hidden" value="<%=Classe%>" id="IdClasse" name="SelectClasse">
                                                    </div>
                                                </div>
                                                <br>
                                                
                                                <div class="card-actionbar">
                                                    <div class="card-actionbar-row">
                                                        <button type="submit" name="bt" value="2" class="btn btn-flat btn-primary ink-reaction">Suivant</button>
                                                    </div>
                                                </div>
                                            </div>


                                        </form>
                                    </div><!--end #rootwizard -->
                                </div><!--end .card-body -->
                            </div><!--end .card -->
                        </div><!--end .col -->
                </section>
            </div>

        </div><!--end .section-body -->

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
                        <a href="../html/dashboards/dashboard.html">
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

    <script>
        function classe() {
            var SelectClasse = document.getElementById("SelectClasse").value;
            if (SelectClasse == 'nnn') {
                document.getElementById("IdClasse").value = '';
            } else {
                var elem = SelectClasse.split(";");

                var adr = elem[0];

                document.getElementById("IdClasse").value = adr;
            }
        }

        function recup_idclasse()
        {
            var inputs = document.getElementsByTagName("IdClasse");

            return inputs.value;

        }

    </script>
</div><!--end #base-->
<!-- END BASE -->
<script src="../assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
<script src="../assets/js/libs/jquery/jquery-migrate-1.2.1.min.js"></script>
<script src="../assets/js/libs/bootstrap/bootstrap.min.js"></script>
<script src="../assets/js/libs/spin.js/spin.min.js"></script>
<script src="../assets/js/libs/autosize/jquery.autosize.min.js"></script>
<script src="../assets/js/libs/nanoscroller/jquery.nanoscroller.min.js"></script>
<script src="../assets/js/libs/jquery-validation/dist/jquery.validate.min.js"></script>
<script src="../assets/js/libs/jquery-validation/dist/additional-methods.min.js"></script>
<script src="../assets/js/libs/wizard/jquery.bootstrap.wizard.min.js"></script>
<script src="../assets/js/core/source/App.js"></script>
<script src="../assets/js/core/source/AppNavigation.js"></script>
<script src="../assets/js/core/source/AppOffcanvas.js"></script>
<script src="../assets/js/core/source/AppCard.js"></script>
<script src="../assets/js/core/source/AppForm.js"></script>
<script src="../assets/js/core/source/AppNavSearch.js"></script>
<script src="../assets/js/core/source/AppVendor.js"></script>
<script src="../assets/js/core/demo/Demo.js"></script>
<script src="../assets/js/core/demo/DemoFormWizard.js"></script>
<script src="../assets/js/core/demo/DemoTableDynamic.js"></script>
<script src="../assets/js/libs/DataTables/jquery.dataTables.min.js"></script>
<script src="../assets/js/libs/DataTables/extensions/ColVis/js/dataTables.colVis.min.js"></script>
<script src="../assets/js/libs/DataTables/extensions/TableTools/js/dataTables.tableTools.min.js"></script>

<!-- END JAVASCRIPT -->

</body>
</html>
