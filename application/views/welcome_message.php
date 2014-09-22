<!DOCTYPE html>
<html ng-app="giftApp">
<head>
	<meta charset="utf-8">

	<script src="bower_components/angular/angular.js"></script>
	<script src="<?php echo base_url(); ?>js/products.js"></script>

	<link rel="stylesheet" href="bower_components/bootstrap/dist/css/bootstrap.css"/>
	<link rel="stylesheet" href="<?php echo base_url(); ?>css/main.css"/>
</head>
<body>

<div class="um-container" ng-controller="ProductsCtrl">
	<table class="table">
		<thead>
		<tr>
			<th>Products</th>
		</tr>
		</thead>
		<tbody>
		<tr ng-repeat="product in products">
			<td>{{product.name}}</td>
			<td>{{product.amount}}</td>
		</tr>
		</tbody>
	</table>
</div>

</body>
</html>