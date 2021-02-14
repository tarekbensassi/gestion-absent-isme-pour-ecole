<%-- 
    Document   : Accueil
    Created on : Mar 14, 2016, 12:11:47 PM
    Author     : ingwa
--%>

<%@page import="Controller.Gestion"%>
<%@page import="Model.Classe"%>
<%@page import="java.util.Iterator"%>
<% Class.forName("com.mysql.jdbc.Driver"); %>
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
        <script type="">
            function validateForm(){
                if( document.f.nom.value=="" ){
                      document.f.nom.style.border = "#ff0000";
                      return false;
                } 
                if ((mail.indexOf("@")>=0)&&(mail.indexOf(".")>=0)) {
                    alert("Veuillez entrer votre mail svp");
                      return false;
                  }
                  return false;
            } 
        </script>
    </head>
    <body class="menubar-hoverable header-fixed menubar-pin ">
        <% Gestion gestion = new Gestion();%>
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
                <section>

                    <div class="section-body">
                        <div class="row">


                            <div class="col-lg-12">
                                <form  name="f"  onsubmit="return validateForm()" class="form-horizontal" action="../AjouterEtudiant">
                                    <div class="card">
                                        <div class="card-head style-primary">
                                            <header>Ajouter etudiant</header>
                                        </div>
                                        <div class="card-body">
                                            <div class="row">
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="Firstname5" class="col-sm-4 control-label">Nom</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="nom"   class="form-control" id="Firstname5">
                                                            
                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="col-sm-6">
                                                    <div class="form-group">
                                                        <label for="Lastname5" class="col-sm-4 control-label">Prenom</label>
                                                        <div class="col-sm-8">
                                                            <input type="text" name="prenom"  class="form-control" id="Lastname5">
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">Adresse</label>
                                                <div class="col-sm-10">
                                                    <textarea type="text" name="adresse"  class="form-control" id="adr"></textarea>
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">Téléphone</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="tel"  class="form-control" id="tel">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">E-mail</label>
                                                <div class="col-sm-10">
                                                    <input type="email" name="mail"  class="form-control" id="mail">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="Username5" class="col-sm-2 control-label">Carte etudiant</label>
                                                <div class="col-sm-10">
                                                    <input type="text" name="carte"  name="etudiant" class="form-control" id="carte">
                                                </div>
                                            </div>
                                            <div class="form-group">
                                                <label for="select1" class="col-sm-2 control-label">Classe</label>
                                                <div class="col-sm-10">

                                                    <select id="select1" name="classe" class="form-control">
                                                        <%

                                                            Iterator it_mod = gestion.listeClasse();
                                                            while (it_mod.hasNext()) {
                                                                Classe classe = (Classe) it_mod.next();

                                                        %>
                                                        <option value="<%=classe.getIdClasse()%>"><%=classe.getLibelle()%></option>
                                                         
                                                        <%}%>


                                                    </select>
                                                </div>
                                            </div>

                                        </div><!--end .card-body -->
                                        <div class="card-actionbar">
                                            <div class="card-actionbar-row">
                                                <button type="submit" name="bt" onClick="validateForm(this.form)"  id="Enregistrer" value="Enregistrer" class="btn btn-flat btn-primary ink-reaction">Enregistrer</button>
                                                <button type="reset" name="bt1" value="Annuler" class="btn btn-flat btn-danger ink-reaction">Annuler</button>
                                            </div>
                                        </div>
                                    </div><!--end .card -->

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
            </div>

        </div><!--end #base-->
        <!-- END BASE -->

        <!-- BEGIN JAVASCRIPT 
        <script src="../assets/js/libs/jquery-validation/dist/jquery.validate.js"  ></script>
        <script src="../assets/js/libs/jquery-validation/dist/jquery.validate.min.js"  ></script>
        
         
         <script src="../assets/js/libs/jquery-validation/lib/jquery.form.js"  ></script>-->
        <script src="../assets/js/libs/jquery/jquery-1.11.2.min.js"></script>
        <script src="../assets/js/libs/jquery/jquery-migrate-1.2.1.min.js"></script>
        <script src="../assets/js/libs/jquery/jquery-1.11.2.js"></script>
        
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
         <script src="http://ajax.aspnetcdn.com/ajax/jQuery/jquery-2.1.3.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/jquery.validate.min.js"></script>
  <script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.0/additional-methods.min.js"></script>
 
   
    <script src="../assets/js/libs/jquery-validation/lib/jquery.js"></script>
  
      
      <!--  <script src="../assets/validation.js">
             
        </script>-->
       <script type="text/javascript">

    $(function (){
        $("#Enregistrer").click(function(){
            valid = true ;
            if($("#Firstname5").val() == "" ){
               
                
              $("#Firstname5").css("border-color","red");
             
              valid = false;
              
            }
            
             if($("#Lastname5").val() == "" ){
                
                
              $("#Lastname5").css("border-color","red");
             
              valid = false;
              
            }
              if($("#mail").val() == "" ){
                
                
              $("#mail").css("border-color","red");
             
              valid = false;
              
            }
              if($("#carte").val() == "" ){
                
                
              $("#carte").css("border-color","red");
             
              valid = false;
              
            }
             if($("#tel").val() == "" ){
                
                
              $("#tel").css("border-color","red");
             
              valid = false;
              
            }
            
             if($("#adr").val() == "" ){
                
                
              $("#adr").css("border-color","red");
             
              valid = false;
              
            }
              return valid;
        });
    });

</script>
        <!-- END JAVASCRd IPT -->

    </body>
</html>
