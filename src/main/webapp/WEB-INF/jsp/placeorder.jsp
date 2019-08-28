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
<c:forEach var = "item" items = "${itemList }">
    <div class="col-md-4" >
      <div class="thumbnail">
      	  <a href = "${pageContext.request.contextPath }/deleteItem/${item.itemId}" class = "close"><b>x</b></a>
          <img class="img-responsive" src="${pageContext.request.contextPath}/resources/images/${item.product.productId}.jpg" alt="Lights" style="width:100%;height:300px">
          <div class="caption">
            <p><b>Price : </b>Rs.${item.product.productPrice}</p>
            <b>Quantity:</b>
            <div class="input-group col-md-2">
            <span class="input-group-btn">
               <button type="button" class="quantity-left-minus btn btn-danger btn-number"  data-type="minus" onclick="location.href='${pageContext.request.contextPath}/decreaseQuantity/${item.itemId}';">
                   <span class="glyphicon glyphicon-minus"></span>
               </button>
            </span>
           	&nbsp;${item.quantity}&nbsp;
            <span class="input-group-btn">
                 <button type="button" class="quantity-right-plus btn btn-success btn-number" data-type="plus" onclick="location.href='${pageContext.request.contextPath}/increaseQuantity/${item.itemId}';">
                     <span class="glyphicon glyphicon-plus"></span>
                 </button>
             </span>
             </div>
             
          </div>
      </div>
    </div>
</c:forEach>
</div>
<button type ="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/confirmOrder';">PLACE ORDER</button>
</div>
</body>
</html>
<%@include file = "footer.jsp" %>