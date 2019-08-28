<%@ page language="java" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "sf" %>
<%@taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<script>
function func(checkBox){
	if(checkBox.checked){
	document.getElementById("billingLocality").value = document.getElementById("shippingLocality").value;
	document.getElementById("billingCity").value = document.getElementById("shippingCity").value;
	document.getElementById("billingPincode").value = document.getElementById("shippingPincode").value;
	document.getElementById("billingState").value = document.getElementById("shippingState").value;
	}
	else 
	{
		document.getElementById("billingLocality").value = "";
		document.getElementById("billingCity").value = "";
		document.getElementById("billingPincode").value = "";
		document.getElementById("billingState").value = "";
	}
}
</script>
<style>
body 
{
	overflow-x: hidden;
	padding-left:12%;
	background-image:url("resources/images/background.jpg");
	opacity:1;
}
.pad{
padding-top : 2%;
padding-bottom:2%;
}
</style>
</head>

<body>
<c:if test = "${empty customer.customerName }">
<h2>Sign Up!</h2>
</c:if>
<c:if test = "${not empty customer.customerName }">
<h2>Update Details</h2>
</c:if>
<sf:form class="form-horizontal" action="addCustomer" modelAttribute = "customer">
<div class = "pad">
<h4><b><i>Personal Details</i></b></h4><br>
  <c:if test = "${not empty product.productName}">
  <div class="form-group">
      <label class="control-label col-sm-1" for="Name">Customer Id : </label>
      <div class="col-sm-8">
       <sf:input type="text" class="form-control"  path="customerId" disabled = "true"/>
      </div>
   </div>
    </c:if>
    <sf:input type="hidden" class="form-control"  path="customerId"/>
    
  <div class="form-group">
    <label class="control-label col-sm-1" for="Name">Name</label>
    <div class="col-sm-8">
      <sf:input type="text" class="form-control" path = "customerName" placeholder="Name"/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-1" for="pwd">Password:</label>
    <div class="col-sm-8"> 
      <sf:input type="password" class="form-control" path = "password" placeholder="Password"/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-1" for="email">Email:</label>
    <div class="col-sm-8">
      <sf:input type="email" class="form-control" path = "email" placeholder="Enter email"/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-1" for="mobileNumber">Mobile</label>
    <div class="col-sm-8"> 
      <sf:input type="text" class="form-control" path = "mobileNumber" placeholder="Mobile Number"/>
    </div>
  </div>
  <div class="form-group"> 
  <label class="control-label col-sm-1" for="gender">Gender</label>
      <div class="col-sm-8"> 
      <sf:input type="text" class="form-control" path = "gender" placeholder="Gender"/>
    </div>
  </div>
</div>
  
  
  <hr>
  <div class = "pad">
  <h4><b><i>Shipping Details</i></b></h4><br>
  <div class="form-group">
    <label class="control-label col-sm-1" for="text" >Locality</label>
    <div class="col-sm-8">
      <sf:input type="text" class="form-control" path = "shippingAddress.shippingLocality" placeholder="Locality" id = "shippingLocality"/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-1" for="text">City</label>
    <div class="col-sm-8"> 
      <sf:input type="text" class="form-control" path = "shippingAddress.shippingCity" placeholder="City" id = "shippingCity"/>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-1" for="pincode">Pincode</label>
    <div class="col-sm-8"> 
      <sf:input type="text" class="form-control" path = "shippingAddress.shippingPincode" placeholder="Pincode" id = "shippingPincode"/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-1" for="text">State</label>
    <div class="col-sm-8">
      <sf:input type="text" class="form-control" path = "shippingAddress.shippingState" placeholder="State" id = "shippingState"/>
    </div>
  </div>
  </div>
  
  
  <hr>
  <div class = "pad">
  <h4><b><i>Billing Details</i></b></h4> 
  <br>
  <div class="form-group">
    <label class="control-label col-sm-1" for="text">Locality</label>
    <div class="col-sm-8">
      <sf:input type="text" class="form-control" path = "billingAddress.billingLocality" placeholder="Locality" id = "billingLocality"/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-1" for="text">City</label>
    <div class="col-sm-8"> 
      <sf:input type="text" class="form-control" path = "billingAddress.billingCity" placeholder="City" id = "billingCity"/>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-1" for="pincode">Pincode</label>
    <div class="col-sm-8"> 
      <sf:input type="text" class="form-control" path = "billingAddress.billingPincode" placeholder="Pincode" id = "billingPincode"/>
    </div>
  </div>
  <div class="form-group">
    <label class="control-label col-sm-1" for="text">State</label>
    <div class="col-sm-8">
      <sf:input type="text" class="form-control" path = "billingAddress.billingState" placeholder="State" id = "billingState"/>
    </div>
  </div>
  </div>
 
  
  <div class="form-group">
  	<div class="col-sm-offset-1 col-sm-8"> 
  	<input type = "checkbox" onchange = "func(this)" name = "fill"> Click to fill automatically<br><br>
  	</div>
    <div class="col-sm-offset-1 col-sm-8">
      <c:if test = "${empty customer.customerName }">
      <button type="submit" class="btn btn-default" style = "background-color:green;color:white">Submit</button>
      </c:if>
      <c:if test = "${not empty customer.customerName }">
      <button type="submit" class="btn btn-default" style = "background-color:green;color:white">Update</button>
      </c:if>
      
    </div>
  </div>
</sf:form>

</body>
</html>
<%@include file = "footer.jsp" %>