<%@include file = "navbar.jsp" %>
<%@ page language="java" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<div class="container-fluid">
  <div class="row" style="padding-bottom:5%">
    <div class="col-sm-6" style="padding-left:10%;">
      <img style = "padding-bottom:3%" src = "${pageContext.request.contextPath}/resources/images/${product.productId}.jpg" alt = "sldmv" class = "img-responsive">
      <button type ="button" class="btn btn-warning" onclick="location.href='${pageContext.request.contextPath}/addToCart/${product.productId}';">ADD TO CART</button>
    </div>
    <div class="col-sm-5" style="background-color:pink;padding:1.5%">    
      <h3>${product.productName }</h3>
      <ul>
      <c:forTokens items="${product.productDescription }" delims="," var="mySplit">
   		<li><c:out value="${mySplit}"/><br></li>
	  </c:forTokens>
	  </ul>
    </div>
  </div>
</div>
</body>
</html>
<%@include file = "footer.jsp"%>