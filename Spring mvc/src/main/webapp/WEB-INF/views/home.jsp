<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
	
 <script src="<c:url value="/resources/js/angular.js"/>"></script>
 <%--  <link href="${pageContext.request.contextPath}/resources/css/main.css" rel="stylesheet" > --%>
 	
</head>

<body ng-app="rgpp">
<div ng-controller="rgcontroller">
<form  ng-submit="" action="">
	<h1>
		Hello world!  
	</h1>
	
	<P>The time on the server is ${serverTime}.</P>
	<a href="" ng-click="myData.doClick(item, $event);">ClickToUploadFile</a>
</form>

<!-- JSP from server:<br/> {{myData.fromServer}} -->
<div ng-bind-html="thisCanBeusedInsideNgBindHtml"></div>

</div>

	 <script>	 
	    angular.module("rgpp", [])
	        .controller("rgcontroller", function($scope, $http, $sce) {
	            $scope.myData = {};
	            $scope.myData.doClick = function(item, event) {
	
	                var responsePromise = $http.get("uploadTemplate");
	
	                /* responsePromise.success(function(data, status, headers, config) {
	                    $scope.myData.fromServer = data;
	                 // debugger;
	                }); */
	                
	                responsePromise.success(function(data, status, headers, config) {
	                	
	                	$scope.thisCanBeusedInsideNgBindHtml = $sce.trustAsHtml(data);
	                 
	                });	                
	                responsePromise.error(function(data, status, headers, config) {
	                    alert("AJAX failed!");
	                });
	            }	
	        });    
  </script>



</body>
</html>
