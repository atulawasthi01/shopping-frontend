<%@include file = "navbar.jsp" %>
<%@ page language="java" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c"  %>
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

<div class = "container well">
<table class="table table-striped table-responsive">
<h3>Items</h3>
<thead>
      <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Price</th>
        <th>Quantity</th>
        <th>Total Price</th>
      </tr>
    </thead>
    <tbody>
<c:forEach items = "${itemList}" var = "item">
<tr>
<td>
${item.itemId}
</td>
<td>
${item.product.productName}
</td>
<td>
${item.price}
</td>
<td>
${item.quantity}
</td>
<td>
${item.quantity*item.price}
</td>
</c:forEach>
<tr>
<td>
Total Price
</td>
<td>
</td>
<td>
</td>
<td>
</td>
<td>
INR ${totalPurchaseAmount }/-
</td>

</tr>

</tbody>

</table>
<a class="btn btn-primary next-step btn-theme" data-toggle="modal" onclick="location.href='${pageContext.request.contextPath}/confirmDetails';">Confirm</a>
</div>

</body>
</html>
<%@include file = "footer.jsp" %>