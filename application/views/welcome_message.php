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

    <style>

        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
        }

        body {
            min-height: 100%;
            height: auto !important;
            height: 100%;
            position: relative;
        }

        /*.page-wrapper {*/
        /*position: absolute;*/
        /*width: 100%;*/
        /*top: 71px;*/
        /*bottom: 70px;*/
        /*}*/

        .info-header {
            background: limegreen;
            color: #d8ffbe;
            padding: 30px 0 40px;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .info-header h1 {
            color: #ffffff;
            font-size: 60px;
        }

        .footer {
            /*position: absolute;*/
            height: 40px;
            width: 100%;
            /*bottom: 0;*/
            margin-top: 30px;
            padding: 10px 0;
            background: limegreen;
            text-align: right;
            color: #d8ffbe;
        }
    </style>
</head>
<body>

<header class="navbar navbar-static-top">
    <div class="container">
        <div class="navbar-header">
            <a class="navbar-brand" href="#/" translate="brand caption"></a>
        </div>
        <nav class="collapse navbar-collapse">
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a ng-click="changeLang()" href>
                        <span class="glyphicon glyphicon-globe"></span>
                        <span translate="to other language"></span>
                    </a>
                </li>
                <li>
                    <a ng-click="logout()" href ng-hide="curStateName()=='login'">
                        <span class="glyphicon glyphicon-off"></span>
                        <span translate="logout"></span>
                    </a>
                </li>
            </ul>
        </nav>
    </div>
</header>

<!--<div class="page-wrapper">-->

<div class="info-header" ng-show="loaded && curStateName()!='login'">
    <div class="container">
        <h1 translate="hi pepole"></h1>

        <p translate="we are the best"></p>
    </div>
</div>

<div class="container" ui-view="content"></div>
<!--</div>-->

<div class="footer" ng-show="loaded && curStateName()!='login'">
    <div class="container" translate="all rights reserved"></div>
</div>

</body>
</html>

<!--<span>For debug:</span>-->
<!--<a ui-sref="login">login</a>-->
<!--<a ui-sref="products">products</a>-->