<%@include file= "navbar.jsp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Insert title here</title>
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>


<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/i18n/defaults-*.min.js"></script>
  <style>
  #pad{
  margin-top:10%;
  margin-bottom:5%;
  }
  </style>
</head>
<body>
<div>
<div class="container well" id = "pad" >
  <div class="row">
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="product" >
          <img src="resources/images/product.jpg" alt="Product" style="width:100%;height:230px">
          <div class="caption">
            <b><p align = "center">Products</p></b>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="category">
          <img src="resources/images/category1.png" alt="Category" style="width:100%;height:230px;">
          <div class="caption">
            <b><p align = "center">Category</p></b>
          </div>
        </a>
      </div>
    </div>
    <div class="col-md-4">
      <div class="thumbnail">
        <a href="supplier">
          <img src="resources/images/supplier.jpg" alt="Supplier" style="width:100%;height:230px">
          <div class="caption">
            <b><p align = "center">Supplier</p></b>
          </div>
        </a>
      </div>
    </div>
  </div>
</div>
</div>
</body>
</html>
<%@include file = "footer.jsp" %>