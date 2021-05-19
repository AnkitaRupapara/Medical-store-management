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
h2
{
	text-align:center;
}
</style>
<meta charset="ISO-8859-1">
<title>Manage Store</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include><br><br>
<div class="class-lg-12">
<h2>Manage Store</h2>
<hr>
</div>

<sql:setDataSource driver="com.mysql.jdbc.Driver"
					   url="jdbc:mysql://localhost:3306/medicine"
					   user="root"
					   password="Ankita2704"
					   var="con"/>
					<c:if test="${param.STORE_NAME!=null}">
		<sql:query var="rs" dataSource="${con}">
			select * from medical_store where STORE_NAME like '%' ? '%'
			<sql:param>${param.STORE_NAME}</sql:param>
		</sql:query>
	</c:if>
	
	<c:if test="${param.STORE_NAME==null}">
		<sql:query var="rs" dataSource="${con}">
			
	      select a.STORE_TYPE_ID ,a.STORE_NAME,a.USERNAME,a.STORE_LICENCE,a.ID,b.TYPE_NAME
	      from medical_store a, store_type b
	      where a.STORE_TYPE_ID=b.ID
	  
		</sql:query>
	</c:if><br><br><br><br>

	 <div class="conatiner">
	 <div class="row">
	 
					   <center>
					   
					   <div class="col-lg-10">
					   <c:if test="${role!=null }">
					   	<c:if test="${role=='admin' }">
					    <button  class="btn btn-success btn-lg float-left"><a href="register.jsp">+Add</button></a>
					   </c:if></c:if>
					   <table border="1" style="width:200%">
					  
					   <tr>
					 	<c:if test="${role!=null }">
					   	<c:if test="${role=='admin' }">
					   		<th>Action</th>
					   		</c:if></c:if>
					   		<th>Store Name</th>
					   		<th>Username</th>
					   		<th>Store Licence</th>
					   		<th>Store Type</th>
					   	</tr>
					   	<c:forEach items="${rs.rows }" var="row">
					   	<tr>
					   		<c:if test="${role!=null }">
					   	<c:if test="${role=='admin' }">
					   		<td><a href="edit.jsp?sid=${row.ID}&name=${row.STORE_NAME}&username=${row.USERNAME}&select=${row.STORE_LICENCE}&type=${row.STORE_TYPE_ID}" style="padding:0px">Edit</a> | <a href="DeleteServlet?ID=${row.ID}" >Delete</a></td>	
					  		</c:if></c:if>
					  		<td>${row.STORE_NAME}</td>
					  		<td>${row.USERNAME}</td>
					  		<td>${row.STORE_LICENCE}</td>
					  		<td>${row.TYPE_NAME }</td>
					  		
					  		
					  	</tr>
					   	
					   </c:forEach>
					   </table>
					   </div>
					   </center>
			</div></div>		   
</body>
</html>