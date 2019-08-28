<%@ page language="java" contentType="text/html"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"  %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<title>Insert title here</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <style>
  #nav_bar {
	background-color: blue;
	border-color: blue;
  }

  </style>
</head>
<body>

<nav class="navbar navbar-inverse" id = "nav_bar">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" style = "color: white;">WebSiteName</a>
    </div>
    <ul class="nav navbar-nav">
      <li><a href="${pageContext.request.contextPath }" style = "color: white;">Home</a></li>
      <sec:authorize access="hasAnyRole('ROLE_ADMIN')">
      <li><a href="${pageContext.request.contextPath }/adminpage" style = "color: white;">Admin</a></li>
      </sec:authorize>
      <li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown"  href="#" style = "color: white; ">Categories <span class="caret"></span></a>
        <ul class="dropdown-menu">
          <c:forEach var = "category" items="${sessionScope.catList}">
              <li><a href="${pageContext.request.contextPath }/view/${category.categoryId}" style = "color: blue;">${category.categoryName}</a></li>
          </c:forEach>
        </ul>
      </li>
      
    </ul>
    <ul class="nav navbar-nav navbar-right" >
    <sec:authorize access="!hasAnyRole('ROLE_ADMIN', 'ROLE_USER')">
      <li><a href="${pageContext.request.contextPath }/signup" style = "color: white;"><span class="glyphicon glyphicon-user"></span> Sign Up</a></li>
      <li><a href="${pageContext.request.contextPath }/login" style = "color: white;"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>
    </sec:authorize>
    <sec:authorize access="authenticated">
      <li><a><b style = "color: white;">Welcome : ${sessionScope.customer.customerName } </b></a></li>
      <li><a href="${pageContext.request.contextPath }/logOut" style = "color: white;"><span class="glyphicon glyphicon-user"></span> Logout</a></li>
      <sec:authorize access="!hasAnyRole('ROLE_ADMIN')">
      <li><a href="${pageContext.request.contextPath }/placeOrder" style = "color: white;"><span class="glyphicon glyphicon-shopping-cart"></span></a></li>
    </sec:authorize>
    </sec:authorize>
    <li>&nbsp;&nbsp;&nbsp;</li>
    </ul>
  </div>
</nav>


</body>
</html>