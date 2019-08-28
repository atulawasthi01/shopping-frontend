<%@include file = "navbar.jsp" %>
<%@ page language="java" 
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
<title>Insert title here</title>
 <style>
  #pad{
  margin-top:5%;
  margin-bottom:5%;
  }
  </style>
</head>
<body>
<div class="container well" id = "pad">
<h3>Shipment Details</h3>
<div class="tab-content">
<div class="tab-pane active" role="tabpanel" id="step1">
<div class="step1">
<div class="row" style="">
<div class="checkout_details">
<div class="col-sm-6 col-sm-offset-3">
<dl class="dl-horizontal">
<dt>Name:<span></span></dt>
<dd>${customer.customerName }</dd>
</dl>
<dl class="dl-horizontal">
<dt>Mobile Number:<span></span></dt>
<dd>${customer.mobileNumber }</dd>
</dl>
<dl class="dl-horizontal">
<dt>Email:<span></span></dt>
<dd>${customer.email }</dd>
</dl>
<dl class="dl-horizontal">
<dt>Shipping Address : <span></span></dt>
<dd>${customer.shippingAddress.shippingLocality } ${customer.shippingAddress.shippingCity } ${customer.shippingAddress.shippingState }</dd>
</dl>
<dl class="dl-horizontal">
<dt>Shipping Address Pincode:<span></span></dt>
<dd>${customer.shippingAddress.shippingPincode }</dd>
</dl>
<dl class="dl-horizontal">
<dt>Billing Address :<span></span></dt>
<dd>${customer.billingAddress.billingLocality } ${customer.billingAddress.billingCity } ${customer.billingAddress.billingState }</dd>
</dl>
<dl class="dl-horizontal">
<dt>Shipping Address Pincode:<span></span></dt>
<dd>${customer.billingAddress.billingPincode }</dd>
</dl>
<div>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="btn btn-primary next-step btn-theme" data-toggle="modal" onclick="location.href='${pageContext.request.contextPath}/editDetails';">Edit</a>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="btn btn-primary next-step btn-theme" data-toggle="modal" onclick="location.href='${pageContext.request.contextPath}/place';">Confirm</a>
</div>
</div>
</div>
</div> 
</div>
</div>
</div>
</div>
</body>
</html>
<%@include file = "footer.jsp" %>