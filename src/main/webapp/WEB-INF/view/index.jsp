<!DOCTYPE html>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en" ng-app>
<body>
	<div>
		<div>
			<h1>Spring Boot JSP Example</h1>
			<h2>Hello</h2>

			<form ng-submit="createBank()" ng-controller="createBankController">
				<label>ID: </label><input type="text" class="form-control"
					ng-model="id" placeholder="Inserte id del banco" name="idBanco" />
				<label>Nombre: </label><input type="text" class="form-control"
					ng-model="name" placeholder="Ingrese nombre" name="nombreBanco" />
				<label>Descripcion: </label><input type="text" class="form-control"
					ng-model="description" placeholder="Inserte descripcion"
					name="descriptionBanco" />
				<button type="submit" name="altaBanco" class="btn btn-default">
					<span>Enviar</span>
				</button>
				<p ng-bind="nombreBanco"></p>

			</form>
		</div>
		<div ng-controller="banksController">

			<table class="table table-responsive table-hover">
				<tr>
					<th>Id</th>
					<th>Nombre</th>
					<th>Descripcion</th>
				</tr>

				<tr ng-repeat="bank in banks">
					<td>{{ bank.id }}</td>
					<td>{{ bank.name }}</td>
					<td>{{ bank.description }}</td>
				</tr>
			</table>
		</div>
	</div>
	<script>
		function banksController($scope, $http) {
			var url = "http://localhost:8080/banks";

			$http.get(url).then(function(response) {
				$scope.banks = response.data;
			});
		}

		function createBankController($scope, $http) {
			var url = "http://localhost:8080/banks";

			$scope.createBank = function() {

				$http({
					url : url,
					method : "PUT",
					data : {
						"id" : $scope.id,
						"name" : $scope.name,
						"description" : $scope.description,
					}
				}).then(function successCallback(response) {
					// this callback will be called asynchronously
					// when the response is available
					$scope.data = response.data;
				}, function errorCallback(response) {
					// called asynchronously if an error occurs
					// or server returns response with an error status.
					$scope.error = response.statusText;
				});
			};
		}
	</script>
	<script	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.0.7/angular.min.js"></script>
</body>
</html>