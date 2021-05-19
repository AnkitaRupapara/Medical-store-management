<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
table, th, td {
  border: 1px solid black;
  border-collapse: collapse;
}
th, td {
  padding: 15px;
}
h2{
text-align:center;
}
</style>
<meta charset="ISO-8859-1">
<title>Manage  Medicine</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include><br><br>
<div class="class-lg-12">
<h2>Manage  Medicine</h2>
<hr>
</div>

<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/medicine"
					   user="root"
					   password="Ankita2704"
					   var="con"/>
					<c:if test="${param.MEDICINE_NAME!=null}">
		<sql:query var="rs" dataSource="${con}">
			select * from medicine_details where MEDICINE_NAME like '%' ? '%'
			<sql:param>${param.MEDICINE_NAME}</sql:param>
		</sql:query>
	</c:if>
	
	<c:if test="${param.MEDICINE_NAME==null}">
		<sql:query var="rs" dataSource="${con}">
	select a.MEDICINE_TYPE_ID,
        a.MEDICINE_NAME,
       a.MEDICINE_PRICE,
        a.MEDICINE_EXPIRY_DATE,
         a.ID,
         a.STORE_ID,
         a.MEDICINE_TYPE_ID,
         c.TYPE_NAME,
          b.MEDICINE_TYPE_NAME
         from medicine_details a
        JOIN medicine_type b
          ON a.MEDICINE_TYPE_ID = b.ID
           JOIN store_type c
            ON a.STORE_ID = c.ID;
			
	
		
		</sql:query>
	</c:if><br><br><br><br>
	 <div class="conatiner">
	 <div class="row">
					   <center>
					   <div class="col-lg-10">
					   <c:if test="${role!=null }">
					   	<c:if test="${role=='admin' }">
					   <button  class="btn btn-success btn-lg float-left"><a href="addmedicine.jsp">+Add Medicine</button></a>
					   </c:if></c:if>
					   <table border="1" style="width:150%">
					   <tr>
					   <c:if test="${role!=null }">
					   	<c:if test="${role=='admin' }">
					     
					   		<th>Action</th>
					   		</c:if>
					   		</c:if>
					   		<th>Medicine Name</th>
					   		<th>Medicine Price</th>
					   		<th>Expiry Date</th>
					   		<th>Medicine Type </th>
					   		<th>Store Name</th>
					   	
					   	</tr>
					   	<c:forEach items="${rs.rows }" var="row">
					   	<tr>
					   	<c:if test="${role!=null }">
					   	<c:if test="${role=='admin' }">
					   		<td><a href="editmedicine.jsp?sid=${row.ID }&name=${row.MEDICINE_NAME}&price=${row.MEDICINE_PRICE}&date=${row.MEDICINE_EXPIRY_DATE}&s1_type=${row.STORE_ID}&m1_type=${row.MEDICINE_TYPE_ID}" style="padding:0px">Edit</a> | <a href="DeleteServletMedicine?ID=${row.ID}" >Delete</a></td>	
					  		</c:if>
					  		</c:if>
					  		<td>${row.MEDICINE_NAME}</td>
					  		
					  		<td>${row.MEDICINE_PRICE}</td>
					  		<td>${row.MEDICINE_EXPIRY_DATE }</td>
					  		<td>${row.MEDICINE_TYPE_NAME} </td>
					  		<td>${row.TYPE_NAME}</td>
					  						  		
					  	</tr>
					   	
					   </c:forEach>
					   </table>
					   </div>
					   </center>
					   </div></div>
					   
</body>
</html>