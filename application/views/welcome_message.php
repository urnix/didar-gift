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
    <script src="<?php echo base_url(); ?>js/app.js"></script>
    <!--script src="<?php echo base_url(); ?>js/products.js"></script-->
</head>
<body>

<div ui-view="content"></div>

</body>
</html>