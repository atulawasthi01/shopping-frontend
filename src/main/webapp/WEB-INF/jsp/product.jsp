<%@include file = "navbar.jsp" %>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "sf" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>

<%@ page language="java" pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>

<title>Insert title here</title>
</head>
<body>

<c:if test="${not empty message }">
<div class="alert alert-danger">
    <strong>Danger!</strong> ${message }
  </div>
</c:if>

<div class="container well">
<sf:form action = "${pageContext.request.contextPath}/addProduct" method = "post" modelAttribute = "product" enctype="multipart/form-data">
   <c:if test = "${empty product.productName}">
   <h2 align = "center">Add Product</h2>
   </c:if>
   <c:if test = "${not empty product.productName}">
   <h2 align = "center">Update Product</h2>
   </c:if>
    
    <c:if test = "${not empty product.productName}">
    <div class="form-group">
      <label for="text">Category ID:</label>
       <sf:input type="text" class="form-control"  path="productId" disabled = "true"/>
    </div>
    </c:if>
    <sf:input type="hidden" class="form-control"  path="productId"/>
    <div class="form-group">
      <label for="text">Product Name:</label>
      <sf:input type="text" class="form-control" placeholder = "Enter Product Name" path="productName" />
    </div>
    <div class="form-group">
      <label for="text">Product Price:</label>
      <sf:input type="text" class="form-control" placeholder = "Enter Product Price" path="productPrice" />
    </div>
    
    <div class="form-group">
      <label for="text">Product Quantity:</label>
      <sf:input type="number" class="form-control" placeholder = "Enter Product Quantity" path="productQuantity" />
    </div>
    <div class="form-group">
      <label for="text">Product Description</label>
      <sf:input type="text" class="form-control"  placeholder="Enter Product Description" path="productDescription" />
    </div>
    
    <div class="form-group">
  		<label for="category" >Category: </label><br>
  		<sf:select class="selectpicker show-tick" data-style="btn-success" path = "categoryId">
    		<c:forEach var = "cat" items = "${categoryList}">
    		<sf:option value = "${cat.categoryId}" label = "${cat.categoryName }"/>
    		</c:forEach>
  		</sf:select>
	</div>
    
    <div class="form-group">
      <label for="text">Product Image</label>
      <sf:input type="file" class="form-control"   path="productImage" />
    </div>
   
    <c:if test = "${empty product.productName}">
    <button type="submit" class="btn btn-default" style = "background-color:blue;color:white;">Add</button>
	</c:if>
	<c:if test = "${not empty product.productName}">
	<button type="submit" class="btn btn-default" style = "background-color:blue;color:white;">Update</button>
	</c:if>
	
</sf:form>
</div>

<c:if test ="${not empty productList}">
<div class = "container well">
<table class="table table-striped table-responsive">
<thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Description</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items = "${productList}" var = "pro">
<tr>
<td>
${pro.productId}
</td>
<td>
${pro.productName}
</td>
<td>
${pro.productPrice}
</td>
<td>
${pro.productQuantity}
</td>
<td>
${pro.productDescription}
</td>
<td><a href="editProduct/${pro.productId}">Edit</a></td>

<td><a href="deleteProduct/${pro.productId}">Delete</a></td>

</tr>
</c:forEach>
</tbody>
</table>
</div>
</c:if>



</body>
</html>
<%@include file = "footer.jsp" %>