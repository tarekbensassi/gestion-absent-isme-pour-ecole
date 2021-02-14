<%-- 
    Document   : Accueil
    Created on : Mar 14, 2016, 12:11:47 PM
    Author     : ingwa
--%>

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
        <link type="text/css" rel="stylesheet" href="./assets/css/theme-default/bootstrap.css?1422792965" />
        <link type="text/css" rel="stylesheet" href="./assets/css/theme-default/materialadmin.css?1425466319" />
        <link type="text/css" rel="stylesheet" href="./assets/css/theme-default/font-awesome.min.css?1422529194" />
        <link type="text/css" rel="stylesheet" href="./assets/css/theme-default/material-design-iconic-font.min.css?1421434286" />
        <!-- END STYLESHEETS -->

        <!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
        <!--[if lt IE 9]>
        <script type="text/javascript" src="../../assets/js/libs/utils/html5shiv.js?1403934957"></script>
        <script type="text/javascript" src="../../assets/js/libs/utils/respond.min.js?1403934956"></script>
        <![endif]-->
    </head>
    <body class="menubar-hoverable header-fixed menubar-pin ">

        <!-- BEGIN HEADER-->
        
        <!-- END HEADER-->

        <!-- BEGIN BASE-->
        <div id="base">

            <!-- BEGIN OFFCANVAS LEFT -->
            <div class="offcanvas">
            </div><!--end .offcanvas-->
            <!-- END OFFCANVAS LEFT -->

            <!-- BEGIN CONTENT-->
            <div id="content"  >
                <!-- BEGIN BLANK SECTION -->
                <section>

                    <div class="section-body" >
                        <div class="row" style="width:500px; height:500px;  margin-left: 150px; margin-top:20px;  " >


                            <div class="col-lg-12">
                                <form class="form-horizontal" action="Connecter">
                                    <div class="card">
                                        <div class="card-head style-primary">
                                            <header>
                                                <div class="login-logo"><img src="logo.png" height="100"  width="400"></div>
                                                <center><h2 class="login-form-signin-heading">Authentification</h2></center>
                                            </header>
                                        </div>
                                         <div class="form-group">
                                                
                                                <div class="col-sm-10" style="margin-left: 50px; margin-top: 5px;  " >
                                                    <br>
                                                    <select id="select1" name="type" class="form-control">
                                               
                                                       <option value="Enseignant">Enseignant</option>
                                                       <option value="Administrateur">Administrateur</option>
                                                     
                                                    </select>
                                                    <br>
                                                    <input type="text" autofocus name="user" placeholder="Nom d'utilisateur" class="form-control ">
                                         <input type="password" name="pwd" placeholder="Mot de passe" class="form-control">
                                         <br>
                                             <button type="submit" class="btn btn-lg btn-success btn-group-justified ">Connecter</button><br>
                                             <button type="reset" class="btn btn-lg btn-success btn-group-justified  ">Annuler</button>
                                        
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
