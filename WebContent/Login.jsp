<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login Page</title>
<style>
h1 {
  text-align: center;
}
label{
text-align: jsutify;
}

</style>
</head>
<body>
<%
	session.removeAttribute("role");
	session.invalidate();
%>

<div class="container">
<div class="row"><br><br><br><br><br>
<jsp:include page="header.jsp"></jsp:include>
<form action="LoginServlet" method="post" ">
<div class-"class-lg-6">
		<h1>Medical Store Management</h1><br><br>
	</div>

<div class="container">
<div class="row">
	
		<div class="col-lg-6">
 			 	<h3> Enter Username<h3>
 		</div>
		<div class="col-lg-6">
				<input type ="text" name="username" placeholder="Enter Username" class="form-control" /><br><br>

</div>
		<div class="form-group col-lg-6">
				<h3>Enter Password</h3>
				</div>
				<!-- Expression Tag -->
				<div class="col-lg-6">
				<input type="password" name="password"  placeholder="Enter Paasword" class="form-control"/><br>
			</div>
     <div class="col-lg-12">
      <div class="text-center">
                         <button class="btn btn-success btn-lg value="Register">Login </button>
                         </div>
                         
            </div>
</div>
</div>
</form>
</div>
</div>
</body>
</html>