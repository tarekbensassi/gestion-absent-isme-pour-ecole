<%-- 
    Document   : Accueil
    Created on : Mar 14, 2016, 12:11:47 PM
    Author     : ingwa
--%>

<%@page import="Model.Absence"%>
<%@page import="Model.Elimine"%>
<%@page import="Model.Etudiant"%>
<%@page import="Model.Utilisateur"%>
<%@page import="Model.Matiere"%>
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
            <% String idClasse = request.getParameter("id_class");
                String idModule = request.getParameter("id_module");
                String idMatiere = request.getParameter("IdMatiere");
                String idSem = request.getParameter("id_sem");
            %>
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
                        <h2 class="text-primary">Justification d'absence des etudiants</h2>
                    </div>
                    <div class="section-body">
                        <div class="row">
                          
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table id="datatable1" class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Etudiants</th>
                                                    <th>E-mail</th>
                                                    <th>Téléphone</th>
                                                    <th>N° Carte etudiant</th>
                                                    <th>Nombre d'absence</th>
                                                    <th>Date d'absence</th>
                                                    <th>Action</th>

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    Gestion gestion = new Gestion();
                                                    Iterator it_user = gestion.listeUtilisateur(3);
                                                    int i = 0;
                                                    while (it_user.hasNext()) {
                                                        Utilisateur user = (Utilisateur) it_user.next();
                                                        Iterator it_etudiant = gestion.listeEtudiantClass(user.getIdUtilisateur(), Integer.valueOf(idClasse));
                                                        while (it_etudiant.hasNext()) {
                                                            Etudiant et = (Etudiant) it_etudiant.next();
                                                            Iterator it_se = gestion.listeSeance(Integer.valueOf(et.getIdEtudiant()), Integer.valueOf(idMatiere), Integer.valueOf(idSem));

                                                            while (it_se.hasNext()) {
                                                                Elimine sea = (Elimine) it_se.next();
                                                                Iterator it_ab = gestion.listeabsence(Integer.valueOf(et.getIdEtudiant()), Integer.valueOf(idMatiere), Integer.valueOf(idSem));

                                                            while (it_ab.hasNext()) {
                                                                Absence abs = (Absence) it_ab.next();
                                                                if(sea.getIdEtudiant()==abs.getIdetudiant()){
                                                            


                                                %>
                                                <tr class="gradeX">
                                                    <td><input name="nom<%=i%>" value="<%=et.getIdEtudiant()%>" type="hidden" readonly><%=user.getNom()%> <%=user.getPrenom()%></td>
                                                    <td> <%=user.getEmail()%></td>
                                                    <td> <%=user.getTel()%></td>
                                                    <td> <%=et.getCarteEtudiant()%></td>
                                                    <td><%=sea.getNdAbscr()+sea.getNdAbstd()+sea.getNdAbstp()%> </td>
                                                    <td><%= abs.getDatemat() %> </td>
                                                     <td class="text-right"><center>
                                            
                                            <a data-toggle="modal" href="#myModal<%=i%>" >
         <button type="button" class="btn btn-icon-toggle" data-toggle="tooltip" data-placement="top" data-original-title="Supprimer"><i class="fa fa-trash-o"></i></button>
    </a>
    <form action="../suppelimine" method="POST">
                 
      <input required type="hidden" value="<%= sea.getIdElimine() %>" id="enseign" name="idelim">
       <input required type="hidden" value="<%= et.getIdEtudiant() %>" id="enseig" name="idet1">
       <input required type="hidden" value="<%= idMatiere %>"  id="enseigt" name="idmat1">
      <input required type="hidden" value="<%= abs.getIdabs() %>" id="ensei" name="idabs">
      <input required type="hidden" value="<%= sea.getIdSemester() %>" id="ense" name="idsems">
   
        
    <!-- Modal -->
    <div class="modal fade" id="myModal<%=i%>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
      <div class="modal-dialog">
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Supprimer absence </h4>
          </div>
          <div class="modal-body">
           <P><h2>Voulez vous supprimer L'absence <%= abs.getDatemat() %>?</h2></P>
          </div>
          <div class="modal-footer">
            
            <button type="submit" name="bt" value="suppelimine" class="btn btn-primary">Oui</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">Non</button>
          </div>
        </div><!-- /.modal-content -->
      </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->
    </form>
                                        </center></td>
                                                </tr>
                                                <%  i++;}}}
                                                       
                                                    }}
                                                %>
                                         
                                            </tbody>
                                        </table>
                                      

                                      
                                    </div><!--end .table-responsive -->
                                </div><!--end .col -->

                          
                        </div><!--end .col -->
                    </div>
  </section>
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
