<%@include file = "navbar.jsp" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "sf" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<div class="container well">
<sf:form action = "${pageContext.request.contextPath}/addSupplier" method = "post" modelAttribute = "supplier">
	<c:if test = "${empty suppier.supplierName}">
    <h2 align = "center">Add Supplier</h2>
    </c:if>
    <c:if test = "${not empty suppier.supplierName}">
    <h2 align = "center">Update Supplier</h2>
    </c:if>
    <c:if test = "${not empty suppier.supplierName}">
    <div class="form-group">
      <label for="text">Supplier Id:</label>
      <sf:input type="text" class="form-control" path="supplierId" disabled = "true"/>
    </div>
    </c:if>
    <sf:input type = "hidden" class="form-control" path = "supplierId"/>
    <div class="form-group">
      <label for="text">Supplier Name:</label>
      <sf:input type="text" class="form-control" placeholder = "Enter Supplier Name" path="supplierName"/>
    </div>
    <div class="form-group">
      <label for="text">Supplier Description</label>
      <sf:input type="text" class="form-control"  placeholder="Enter Supplier Description" path="supplierDescription"/>
    </div>
    <c:if test = "${empty supplier.supplierName}">
    <button type="submit" class="btn btn-default" style = "background-color:blue;color:white;">Add</button>
	</c:if>
	<c:if test = "${not empty supplier.supplierName}">
    <button type="submit" class="btn btn-default" style = "background-color:blue;color:white;">Update</button>
	</c:if>
	
</sf:form>
</div>

<c:if test ="${not empty supplierList}">
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
<c:forEach items = "${supplierList}" var = "sup">
<tr>
<td>
${sup.supplierId}
</td>
<td>
${sup.supplierName}
</td>
<td>
${sup.supplierDescription}
</td>
<td><a href="editSupplier/${sup.supplierId}">Edit</a></td>

<td><a href="deleteSupplier/${sup.supplierId}">Delete</a></td>

</tr>
</c:forEach>
</tbody>
</table>
</div>
</c:if>

</body>
</html>
<%@include file = "footer.jsp" %>