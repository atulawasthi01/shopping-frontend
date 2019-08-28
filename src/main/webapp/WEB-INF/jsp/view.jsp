<%@ page language="java"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c"%>
<%@include file = "navbar.jsp" %>
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
<div class = "container-fluid">
<div class="row">
<c:forEach var = "product" items = "${productList }">
    <div class="col-md-4" >
      <div class="thumbnail">
          <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/${product.productId}.jpg" alt="Lights" style="width:100%;height:300px">
          <div class="caption">
            <p><b>Price : </b>Rs.${product.productPrice}</p>
            <p><b>About : </b>${product.productDescription}</p>
            <p><b>Availability : </b>${product.productQuantity}</p>
            <button type = "button" class="btn btn-info" onclick="location.href='${pageContext.request.contextPath}/details/${product.productId}';">More Deatils</button>
            <button type ="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/addToCart/${product.productId}';">ADD TO CART</button>
          </div>
      </div>
    </div>
</c:forEach>
</div>
</div>
</body>
</html>
<%@include file = "footer.jsp" %>