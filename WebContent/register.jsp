<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Store</title>
<style>

.required {
  color: red;
}
h2{
text-align:center;
}
</style>
</head>
<body>
<script>
	function myfunction(textbox)
	{
		var val=textbox.value;
		var ID=textbox.id;
		var url="ValidateServlet?v="+val+"&ID="+ID;
			
		 var xhttp = new XMLHttpRequest();
		 
		  xhttp.onreadystatechange = function() 
		  {
		    if (this.readyState == 4 && this.status == 200) 
		    {
		     	document.getElementById("msg"+ID).innerHTML = this.responseText;
		    }
		  };
		  
		  xhttp.open("GET", url);
		  xhttp.send();
	}
function validateform(){  
		var name=document.form1.store_name.value;  
		var password=document.form1.password.value;  
		var address1=document.form1.address1.value; 
		var role=document.form1.role.value; 
		if (name==null || name==""){  
		  alert("Name can't be blank");  
		  return false;  
		}
		else if(password.length<6){  
		  alert("Password must be at least 6 characters long.");  
		  return false;  
		  }  
		else if(address1==null || address1==""){  
			  alert("Address can't be blank");  
			  return false;  
			  }  
		else if(role==null || role==""){  
			  alert("Role can't be blank");  
			  return false;  
			  } 
		
		}
	
</script>

<jsp:include page="header.jsp"></jsp:include><br><br>
<form action="RegisterServlet" name="form1" method="post"  onsubmit="return validateform()" >
		<div class="class-lg-12">
<h2>Add Store</h2>
<hr>
</div>

<div class="container">
		<div class="row">

 			 <div class="col-lg-3">
 			 	<label>Store Name <span class="required">*</span></label>
 			 	</div>
 			 <div class="col-lg-3">
 				<input type="text"  class="form-control"  name="store_name" />
 				
 			</div>
 				<div class="col-lg-3">
 				<label>Username <span class="required">*</span></label>
 				<span id="msgusername" style="color:red"></span>
 				</div>
 				<div class="col-lg-3">
 				<input type="text" class="form-control" name="username" id="username" onkeyup="myfunction(this)"/><br>
 				</div>
 				<div class="col-lg-3">
 				<label>Password <span class="required">*</span></label>
 				</div>
 				<div class="col-lg-3">
 				<input type="password" class="form-control" name="password"/>
 				</div>
 				<div class="col-lg-3">
 				<label>Email Id</label>
 				</div>
 				<div class="col-lg-3">
 				<input type="text" class="form-control"/><br>
 				<span id="msgemail" style="color:red"></span>
 				</div>
 				<div class="col-lg-3">
 				<label>Mobile Number</label>
 				</div>
 				<div class="col-lg-3">
 				<input type="text" class="form-control" name="mobile"/>
 				</div>
 				<div class="col-lg-3">
 				<label>Registration No</label>
 				</div>
 				<div class="col-lg-3">
 				<input type="text" class="form-control" name="registration"/><br>
 				</div>
 				
 				<div class="col-lg-3">
 				<label>Store licence <span class="required">*</span></label>
 				</div>
 				<div class="col-lg-3">
					  <input type="radio"  name="select" value="Retail Drug License" checked />
					  <label >Retail Drug License</label><br>
						<input type="radio" name="select" value="Wholesale Drug License" />
						<label >Wholesale Drug License</label>
						</div>
						
						
						  <div class="col-lg-3">
						  <label>Address 1 <span class="required">*</span> </label>
						  </div>
						
						  <div class="col-lg-3">
						  <textarea rows="2" cols="30" name ="address1"></textarea> 
						  </div>
						   <div class="col-lg-3">
						  <label>Address 2 </label></div>
					
						  <div class="col-lg-3">
						  <textarea rows="2" cols="30" name ="address2"></textarea> <br>
						  
						  </div>
						  <div class="col-lg-3 dropdown">
						<label>Store Type <span class="required">*</span></label></div>
						<div class="col-lg-3 dropdown">
						<select name="type">
						<option value="1">Hospital Medical Store</option>
						<option value="2">Own Medical Store</option>
						<option value="3">Chain Pharmacy Outlets</option>
						</select>
						  </div>
						  <div class="col-lg-3">
 				<label>Role <span class="required">*</span></label>
 				</div>
 				<div class="col-lg-3">
 				<input type="text" class="form-control" name="role"/><br>
 				</div>
 				
				       <div class="col-lg-12">
                         <button class="btn btn-success btn-lg float-right" value="Register">Save </button>
                         <label></label>
                         <button class="btn  btn-lg float-right"><a href="Login.jsp">Back</a></button>
                         
            </div>
		
						  
		 				
		</div>
		 
		
</div>
</form>
</body>
</html>