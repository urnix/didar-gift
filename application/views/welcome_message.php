<!DOCTYPE html>
<html ng-app="giftApp">
<head>
    <meta charset="utf-8">

    <!-- bower:css -->
    <link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css"/>
    <!-- endbower -->
    <link rel="stylesheet" href="<?php echo base_url(); ?>css/main.css"/>

    <!-- bower:js -->
    <script src="bower_components/jquery/dist/jquery.js"></script>
    <script src="bower_components/angular/angular.js"></script>
    <script src="bower_components/angular-ui-router/release/angular-ui-router.js"></script>
    <script src="bower_components/lodash/dist/lodash.compat.js"></script>
    <script src="bower_components/restangular/dist/restangular.js"></script>
    <script src="bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <!-- endbower -->
    <script src="bower_components/angular-translate/angular-translate.js"></script>
    <script src="<?php echo base_url(); ?>js/app.js"></script>
    <!--script src="<?php echo base_url(); ?>js/products.js"></script-->
</head>
<body>

<a ng-click="changeLang()"><span class="glyphicon glyphicon-globe"></span><span
        translate="to other language"></span></a>

<a ng-click="logout()" ng-hide="curStateName()=='login'"><span class="glyphicon glyphicon-off"></span>
    <span translate="logout"></span></a>

<div ui-view="content"></div>

</body>
</html>

<!--<span>For debug:</span>-->
<!--<a ui-sref="login">login</a>-->
<!--<a ui-sref="products">products</a>-->