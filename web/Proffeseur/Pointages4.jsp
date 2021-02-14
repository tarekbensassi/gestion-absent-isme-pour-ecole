<%-- 
    Document   : Accueil
    Created on : Mar 14, 2016, 12:11:47 PM
    Author     : ingwa
--%>


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
             <%  String nom = request.getParameter("nom");
                String prenom = request.getParameter("prenom");
               
            %>
            <% String idClasse = request.getParameter("id_class");
                String idModule = request.getParameter("id_module");
                String idMatiere = request.getParameter("IdMatiere");
                String Type_seance = request.getParameter("Type_seance");
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
                                      <%=nom %> <%=prenom %>
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
                        <h2 class="text-primary">Register d'appel</h2>
                    </div>
                    <div class="section-body">
                        <div class="row">
                            <form action="../goP2">
                                <div class="col-lg-12">
                                    <div class="table-responsive">
                                        <table id="datatable1" class="table table-striped table-hover">
                                            <thead>
                                                <tr>
                                                    <th>Etudiants</th>
                                                     <th>Presence</th>
                                      
                                                  

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
                                                            


                                                %>
                                                <tr class="gradeX">
                                                    <td><input name="nom<%=i%>" value="<%=et.getIdEtudiant()%>" type="hidden" readonly>
                                                        <%=user.getNom()%> </td>
                                                    <td><%=user.getPrenom()%> </td>
                                                    
                                                    
                                                    <td>

                                                        <div class="checkbox checkbox-styled checkbox-danger">
                                                            <label>
                                                                <input type="checkbox" name="et<%=i%>" value="1">
                                                                <span>Absent</span>
                                                            </label>
                                                        </div>
                                                    </td>
                                                   

                                                </tr>
                                                <%
                                                        i++;
                                                     } 
                                                      
                                                    }
                                                %>
                                            
                                            </tbody>
                                        </table>
                                         <input type="hidden" name="nb_et"  value="<%=i%>">
                                        <input required type="hidden" value="<%=idClasse%>" id="IdClasse" name="IdClasse">
                                        <input required type="hidden" value="<%=idModule%>" id="IdModule" name="IdModule">
                                        <input required type="hidden" value="<%=idMatiere%>" id="IdModule" name="IdMatiere">
                                        <input required type="hidden" value="<%=Type_seance%>" id="IdModule" name="Type_seance">
                                         <input required type="hidden" value="<%=nom%>" id="IdClasse" name="nom">
                                         <input required type="hidden" value="<%=prenom%>" id="IdClasse" name="prenom">
                                        <div class="card-actionbar">
                                            <div class="card-actionbar-row">
                                                <button type="submit" name="bt" value="4" class="btn btn-flat btn-primary ink-reaction">Enregistrer</button>
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
                    <a href="Accueil.jsp?nom=<%=nom %>&&prenom=<%=prenom %>" >
                        <div class="gui-icon"><i class="md md-home"></i></div>
                        <span class="title">Accueil</span>
                    </a>
                </li><!--end /menu-li -->
                <!-- END DASHBOARD -->

                <li >
                    <a href="Pointages1.jsp?nom=<%=nom %>&&prenom=<%=prenom %>">
                        <div class="gui-icon"><i class="md md-computer"></i></div>
                        <span class="title">register d'appel</span>
                    </a>
                    <!--start submenu -->

                </li><!--end /menu-li -->
                <li class="gui-folder">
                    <a>
                        <div class="gui-icon"><i class="md md-computer"></i></div>
                        <span class="title">Gestion des etudiants</span>
                    </a>
                    <!--start submenu -->
                    <ul>


                        <li><a href="Listeetudiants1.jsp?nom=<%=nom %>&&prenom=<%=prenom %>" ><span class="title">Liste des etudiants</span></a></li>

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
