<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
h2{

text-align:center;
}

</style>
<meta charset="ISO-8859-1">
<title>Edit Medicine</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include><br><br>
<div class="class-lg-12">
<h2>Edit Medicine</h2>
<hr>
</div>
<form action="UpdateServletMedicine" method="post">
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
			<label>Medicine Name <span class="required">*</span></label></div>
			<div class="col-lg-3">
			<input type="text" class="form-control" name="medicine_name" value="${param.name}"  />
			</div>
			<div class="col-lg-3">
			<label>Price <span class="required">*</span></label></div>
			<div class="col-lg-3">
			<input type="text" class="form-control" name="Price" value="${param.price}" /><br>
			</div>
			<div class="col-lg-3 dropdown">
						<label>Medicine Type <span class="required">*</span></label></div>
						<div class="col-lg-3">
						<select name="m_type" value="${param.m1_type}">
						<option value="1" <c:if test="${param.m1_type ==1}">selected </c:if>>Pain Killer</option>
						<option value="2" <c:if test="${param.m1_type ==2}">selected </c:if>>Weight Loss</option>
						<option value="3" <c:if test="${param.m1_type ==3}">selected </c:if>>Weight Gain</option>
						<option value="4" <c:if test="${param.m1_type ==4}">selected </c:if>>Vitamin</option>
						</select>
						  </div>
			<div class="col-lg-3 dropdown">
						<label>Store <span class="required">*</span></label></div>
						<div class="col-lg-3">
						<select name="s_type" value="${param.s1_type}">
						<option value="1" <c:if test="${param.s1_type ==1}">selected </c:if>>Hospital Medical Store</option>
						<option value="2" <c:if test="${param.s1_type ==2}">selected </c:if>>Own Medical Store</option>
						<option value="3" <c:if test="${param.s1_type ==3}">selected </c:if>>Chain Pharmacy Outlets</option>
					
						</select>
						  </div>
			<div class="col-lg-3"><br>
			<label>Expiry Date</label>
			
			</div>
			<div class="col-lg-3 "><br>
			<input type="date" name="date" value="${param.date}">
	
			</div>
			<div class="col-lg-12">
                         <button class="btn btn-success btn-lg float-right" value="Register">Save </button>
                         <label></label>
                         <button class="btn  btn-lg float-right"><a href="Medicine.jsp">Back</a></button>
            </div>
            <label>Enter Store ID</label></div>
				<div class="form-group col-lg-3">
				<input type="text" name="ID" value="${param.sid}"  class="form-control"/>
			</div>
						  
		
		</div>
	
	</div>
</form>
</body>
</html>