<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


<!DOCTYPE html>
<html>
<head>
<style >

h2
{
text-align:center;
}

</style>
<meta charset="ISO-8859-1">
<title>Edit Store</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include><br><br>
		
		<div class="class-lg-12">
<h2>Edit Store</h2>
<hr>
</div>
		
<form action="UpdateServlet" method="post">
<div class="container">
		<div class="row">
		
		
 			 <div class="col-lg-3">
 			 	<label>Store Name <span class="required">*</span></label>
 			 	</div>
 			 <div class="col-lg-3">
 				<input type="text" class="form-control" name="store_name" value="${param.name} "/>
 			</div>
 				<div class="col-lg-3">
 				<label>Username <span class="required">*</span></label>
 				</div>
 				<div class="col-lg-3">
 				<input type="text" class="form-control" name="username" value="${param.username}" /><br>
 				</div>
 				
 				<div class="col-lg-3">
 				<label>Store licence <span class="required">*</span></label>
 				</div>
 				<div class="col-lg-3">
					  <input type="radio"  name="select" value="Retail Drug License" <c:if test="${param.select =='Retail Drug License' }" > checked</c:if>>
					  
					  <label >Retail Drug License</label><br>
						<input type="radio" name="select" value="Wholesale Drug License" <c:if test="${param.select =='Wholesale Drug License' }">checked </c:if>>
						<label >Wholesale Drug License</label>
						</div>
				
						  <div class="col-lg-3 dropdown">
						<label>Store Type <span class="required">*</span></label></div>
						<div class="col-lg-3 dropdown">
						<select name="type" value="${param.type}">
						<option value="1" <c:if test="${param.type ==1 }" >selected </c:if>>Hospital Medical Storee</option>
						<option value="2" <c:if test="${param.type ==2 }" > selected </c:if>>Own Medical Store</option>
						<option value="3" <c:if test="${param.type ==3 }" >selected </c:if>>Chain Pharmacy Outlets</option>
						</select>
						  </div>
						  <div class="form-group col-lg-3">
				<label>Enter Store ID</label></div>
				<div class="form-group col-lg-3">
				<input type="text" name="ID" value="${param.sid}"  class="form-control"/>
			</div>
				       <div class="col-lg-12">
                         <button class="btn btn-success btn-lg float-right" value="Register">Save </button>
                         <label></label>
                         <button class="btn  btn-lg float-right"><a href="Managestore.jsp">Back</a></button>
            </div>				
		</div>		
</div>
</form>
</body>
</html>