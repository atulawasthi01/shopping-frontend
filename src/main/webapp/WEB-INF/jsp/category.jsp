<%@include file = "navbar.jsp" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "sf" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
<title>Insert title here</title>
</head>
<body>

<div class="container well">
<sf:form action = "${pageContext.request.contextPath}/addCategory" method = "post" modelAttribute = "category">
   <c:if test = "${empty category.categoryName}">
   <h2 align = "center">Add Category</h2>
   </c:if>
   <c:if test = "${not empty category.categoryName}">
   <h2 align = "center">Update Category</h2>
   </c:if>
    
    <c:if test = "${not empty category.categoryName}">
    <div class="form-group">
      <label for="text">Category ID:</label>
       <sf:input type="text" class="form-control"  path="categoryId" disabled = "true"/>
    </div>
    </c:if>
    <sf:input type="hidden" class="form-control"  path="categoryId"/>
    <div class="form-group">
      <label for="text">Category Name:</label>
      <sf:input type="text" class="form-control" placeholder = "Enter Category Name" path="categoryName"/>
    </div>
    <div class="form-group">
      <label for="text">Category Description</label>
      <sf:input type="text" class="form-control" placeholder="Enter Category Description" path="categoryDescription"/>
    </div>
    <c:if test = "${empty category.categoryName}">
    <button type="submit" class="btn btn-default" style = "background-color:green;color:white;">Add</button>
	</c:if>
	<c:if test = "${not empty category.categoryName}">
    <button type="submit" class="btn btn-default" style = "background-color:green;color:white;">Update</button>
	</c:if>
</sf:form>
</div>


<c:if test ="${not empty categoryList}">
<div class = "container well">
<table class="table table-striped table-responsive">
<thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items = "${categoryList}" var = "cat">
<tr>
<td>
${cat.categoryId}
</td>
<td>
${cat.categoryName}
</td>
<td>
${cat.categoryDescription}
</td>
<td><a href="editCategory/${cat.categoryId}">Edit</a></td>

<td><a href="deleteCategory/${cat.categoryId}">Delete</a></td>

</tr>
</c:forEach>
</tbody>
</table>
</div>
</c:if>



</body>
</html>
<%@include file = "footer.jsp" %>