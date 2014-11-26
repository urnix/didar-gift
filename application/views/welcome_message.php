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

        header.navbar {
            margin-bottom: 0;
        }

        header.navbar a {
            color: #333;
        }

        .info-header {
            background: limegreen;
            color: #d8ffbe;
            padding: 20px 0 40px;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .info-header h1 {
            color: #ffffff;
            font-size: 60px;
        }

        .footer {
            height: 40px;
            width: 100%;
            margin-top: 30px;
            padding: 10px 0;
            background: limegreen;
            text-align: right;
            color: #d8ffbe;
        }

        .items-row h3 {
            text-align: center;
            margin: 20px 0;
        }

        .item {
            padding: 0 5px;
            color: #333;
        }

        .item a {
            text-decoration: none;
            color: #333;
        }

        .item-image-container {
            height: 100px;
            overflow-x: hidden;
            text-align: center;
            /*background: red;*/
            /*border: 1px dashed;*/
        }

        .item-image {
            height: 100%;
            /*max-width: 100%;*/
        }

        .name {
            text-align: center;
            font-weight: bold;
            white-space: nowrap;
        }

        .description {
            height: 51px;
            font-size: 12px;
        }

        .tag {
            float: left;
            background: limegreen;
            border-radius: 5px;
            margin: 0 5px 5px 0;
            padding: 0 5px;
            color: #d8ffbe;
        }

        .tag a {
            text-decoration: none;
            color: #d8ffbe;
            cursor: pointer;
        }

        .gs-btn {
            background: limegreen;
            color: #d8ffbe;
        }

        .gs-btn:hover {
            background: inherit;
            color: #333;
        }

        .alert-info {
            background: limegreen;
            color: #ffffff;
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
            <ul class="nav navbar-nav" ng-show="loaded && curStateName()!='login'">
                <li>
                <a ui-sref="faq">
                        <span class="glyphicon glyphicon-paperclip"></span>
                        <span translate="faq"></span>
                    </a>
                </li>
            </ul>
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

<div class="container" ui-view="content" ng-show="loaded"></div>
<!--</div>-->

<div class="footer" ng-show="loaded && curStateName()!='login'">
    <div class="container" translate="all rights reserved"></div>
</div>

</body>
</html>

<!--<span>For debug:</span>-->
<!--<a ui-sref="login">login</a>-->
<!--<a ui-sref="products">products</a>-->