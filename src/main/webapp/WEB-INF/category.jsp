<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Index</title>

</head>
<body>
	<h1>Create Category</h1>
	<form:form action="/category/new" method="post"
		modelAttribute="category">
		<p>
			Name:
			<form:input path="name" />
			<form:errors path="name" />
		</p>

		<button class="btn btn-primary" type="submit">Submit</button>
	</form:form>
</body>
</html>