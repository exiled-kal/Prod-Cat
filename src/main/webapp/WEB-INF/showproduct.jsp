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
	<h1>
		<c:out value="${product.name}" />
	</h1>
	<c:forEach items="${product.categories}" var="category">
		<h6>
			<c:out value="${category.name}" />
		</h6>
		<form action="/products/${product.id}" method="post">
			<input type="hidden" value="delete" name="_method" /> <input
				type="hidden" value="${category.id}" name="category" />
			<button type="submit" class="btn btn-danger">DELETE</button>
		</form>
	</c:forEach>
	<hr>
	<form action="/products/${product.id}" method="post">
		<select name="category">
			<c:forEach items="${allCategories}" var="category">
				<option value="${category.id}">
					<c:out value="${category.name}" />
				</option>
			</c:forEach>
		</select>
		<button class="btn btn-primary" type="submit">Submit</button>
	</form>

</body>
</html>