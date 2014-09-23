<!DOCTYPE html>
<html ng-app="giftApp">
<head>
	<meta charset="utf-8">

	<script src="bower_components/angular/angular.js"></script>
	<script src="bower_components/lodash/dist/lodash.js"></script>
	<script src="bower_components/restangular/dist/restangular.js"></script>
	<script src="<?php echo base_url(); ?>js/products.js"></script>

	<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css"/>
	<link rel="stylesheet" href="<?php echo base_url(); ?>css/main.css"/>
</head>
<body>

<div class="um-container" ng-controller="ProductsCtrl">
	<table class="table text-center">
		<thead>
		<tr>
			<th>Products</th>
		</tr>
		</thead>
		<tbody>
		<tr ng-repeat="product in products">
			<td class="col-md-6">{{product.name}}</td>
			<td class="col-md-6">{{product.amount}}</td>
		</tr>
		</tbody>
	</table>

	<table class="table text-center">
		<thead>
		<tr>
			<th>Measures</th>
		</tr>
		</thead>
		<tbody>
		<tr ng-repeat="measure in measures">
			<td class="col-md-6">{{measure.name}}</td>
			<td class="col-md-6">{{measure.desc}}</td>
		</tr>
		</tbody>
	</table>

	<table class="table text-center">
		<thead>
		<tr>
			<th>Categories</th>
		</tr>
		</thead>
		<tbody>
		<tr ng-repeat="category in categories">
			<td class="col-md-6">{{category.name}}</td>
			<td class="col-md-6">{{category.desc}}</td>
		</tr>
		</tbody>
	</table>
</div>

</body>
</html>