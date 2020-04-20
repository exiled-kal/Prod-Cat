<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>

</head>
<body>
	<div class="container">
		<h1>Create Product</h1>
		<form:form action="/products/new" method="post"
			modelAttribute="product">
			<p>
				Name:
				<form:input path="name" />
				<form:errors path="name" />
			</p>
			<p>
				Desc:
				<form:input path="description" />
				<form:errors path="description" />
			</p>
			<p>
				Price:
				<form:input path="price" />
				<form:errors type="number" path="price" />
			</p>
			<button class="btn btn-primary" type="submit">Submit</button>
		</form:form>
	</div>
</body>
</html>