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
		<c:out value="${category.name}" />
	</h1>
	<c:forEach items="${category.products}" var="product">
		<h6>
			<c:out value="${product.name}" />
		</h6>
		<form action="/category/${category.id}" method="post">
			<input type="hidden" value="delete" name="_method" /> <input
				type="hidden" value="${product.id}" name="product" />
			<button type="submit" class="btn btn-danger">DELETE</button>
		</form>
	</c:forEach>
	<hr>
	<form action="/category/${category.id}" method="post">
		<select name="category">
			<c:forEach items="${allProducts}" var="product">
				<option value="${product.id}">
					<c:out value="${product.name}" />
				</option>
			</c:forEach>
		</select>
		<button class="btn btn-primary" type="submit">Submit</button>
	</form>

</body>
</html>