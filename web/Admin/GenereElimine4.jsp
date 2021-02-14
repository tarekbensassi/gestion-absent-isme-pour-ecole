<%-- 
    Document   : Accueil
    Created on : Mar 14, 2016, 12:11:47 PM
    Author     : ingwa
--%>

<%@page import="tarekbensassilfim3.maillist"%>
<%@page import="tarekbensassilfim3.Mailer"%>
<%@page import="java.lang.Math.*"%>

<%@page import="java.lang.Math.*"%>

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
                Gestion gestion=new Gestion();
                String mat="";
                   Iterator it_mat = gestion.listeMatiere();
                 while (it_mat.hasNext()) {
                 Matiere matiere = (Matiere) it_mat.next();
                 if(matiere.getIdMatiere()==Integer.valueOf(idMatiere)){
                     mat=matiere.getLibelle();
                 }
                 }
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
                        <h2 class="text-primary">Genere Liste Eliminée</h2>
                    </div>
                    <div class="section-body">
                        <div class="row">
                            <form action="../PDF">
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

                                                </tr>
                                            </thead>
                                            <tbody>
                                                <%
                                                    
                                                    Iterator it_user = gestion.listeUtilisateur(3);
                                                    int i = 0;
                                                     String CH="";  
                                                    while (it_user.hasNext()) {
                                                        Utilisateur user = (Utilisateur) it_user.next();
                                                        Iterator it_etudiant = gestion.listeEtudiantClass1(user.getIdUtilisateur());
                                                        
                                                        while (it_etudiant.hasNext()) {
                                                            Etudiant et = (Etudiant) it_etudiant.next();
                                                            
                                                            Iterator it_classe = gestion.listeClasse();
                                                             
                                                            while (it_classe.hasNext()) {
                                                            Classe classe = (Classe) it_classe.next(); 
                                                             String ch= classe.getLibelle().substring(0, 3);
                                                             if(classe.getLibelle().substring(0,3).equals(ch) && et.getIdClasse() == classe.getIdClasse() ){
                                                                     
                                                            
                                                            
                                                            Iterator it_se = gestion.listeSeance(Integer.valueOf(et.getIdEtudiant()), Integer.valueOf(idMatiere), Integer.valueOf(idSem));

                                                            while (it_se.hasNext()) {
                                                                Elimine sea = (Elimine) it_se.next();
                                                                int nbr= gestion.nbr_seance(Integer.valueOf(idMatiere),Integer.valueOf(classe.getIdClasse()));
                                                                int nb = sea.getNdAbscr()+sea.getNdAbstd()+sea.getNdAbstp();
                                                                
                                                                if( nb >  Math.round(nbr*0.2) ){
                                                                    
                                                          maillist.Send(user.getEmail(),"Bonjour Mr/Mme "+ user.getNom() +"   "+  user.getPrenom() +"  Vous été Eliminée a la Matiere   : " +mat);


                                                %>
                                                <tr class="gradeX">
                                                    <td><input name="nom<%=i%>" value="<%=user.getNom()%> " type="hidden" readonly><%=user.getNom()%> <%=user.getPrenom()%></td>
                                                    <td> <input name="mail<%=i%>" value="<%=  user.getEmail() %>" type="hidden" readonly><%=user.getEmail()%></td>
                                                    <td> <%=user.getTel()%></td>
                                                    <td> <%=et.getCarteEtudiant()%></td>
                                                    <td><input name="nb<%=i%>" value="<%=  nb %>" type="hidden" readonly><%=  nb %>--<%= nbr %> --  <%= idClasse%></td>
                                                       <input type="hidden" name="pre<%=i%>"  value="<%=user.getPrenom()%>">
                                                </tr>
                                                
                                                <%}}
                                                       
                                                                } } }  i++;
                                                  
                                                    }
                                               
                                                %>
                                               
                                            <input type="hidden" name="nb_et"  value="<%=i%>">
                                            </tbody> 
                                        </table>
                                           
                                        <input required type="hidden" value="<%=idClasse%>" id="IdClasse" name="IdClasse">
                                        <input required type="hidden" value="<%=idModule%>" id="IdModule" name="IdModule">
                                        <input required type="hidden" value="<%=idMatiere%>" id="IdModule" name="IdMatiere">
                                        <input required type="hidden" value="<%=i%>" id="nbr" name="nb">

                                        <div class="card-actionbar">
                                            <div class="card-actionbar-row">
                                           
                                                <button type="submit" name="bt" value="4" class="btn btn-flat btn-primary ink-reaction">Imprimer </button>
                                                 
                                            </div>
                                        </div>
                                    </div><!--end .table-responsive -->
                                </div><!--end .col -->

                            </form>
                        </div><!--end .col -->
                    </div>

            </div><!--end .section-body -->
        </section>
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
