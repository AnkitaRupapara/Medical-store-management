<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Medicine</title>
<style>
h2
{
	text-align:center;
}
.required {
  color: red;
}
</style>

</head>
<body>
<script>
   function validateform(){  
	var name=document.form2.medicine_name.value;  
	var det=document.form2.details.value;
	var dat=document.form2.date.value;
	var pri=document.form2.Price.value;
	var qua=document.form2.quantity.value;
	if (name==null || name==""){  
	  alert("Medicine  name cannot be blank");  
	  return false;  
	}
	else if(det==null || det==""){
		alert("Medicine details cannot be blank");
		return false;
	
	}
	else if(dat==null || dat==""){
		alert("Expiry Date Cannot be blank");
		return false;
		
	}
	else if(pri==null || pri =="")
	{
		alert("Price Cannot be blank");
		return false;
		
	}
	else if(qua==null || qua=="")
	{
		alert("quantity cannot be blank");
		return false;
	}
	
	}


</script>

<jsp:include page="header.jsp"></jsp:include><br><br>
<form action="MedicineServlet"  name="form2" method="post"  onsubmit="return validateform()">
<div class="class-lg-12">
<h2>Add  Medicine</h2>
<hr>
</div>
	<div class="container">
		<div class="row">
			<div class="col-lg-3">
			<label>Medicine Name <span class="required">*</span></label></div>
			<div class="col-lg-3">
			<input type="text" class="form-control" name="medicine_name" />
			</div>
			<div class="col-lg-3">
			<label>Price <span class="required">*</span></label></div>
			<div class="col-lg-3">
			<input type="text" class="form-control" name="Price" /><br>
			</div>
			<div class="col-lg-3">
			<label>Medicine Details <span class="required">*</span></label></div>
			<div class="col-lg-3">
			<input type="text" class="form-control" name="details" /><br>
			</div>
			<div class="col-lg-3">
			<label>Quantity <span class="required">*</span></label></div>
			<div class="col-lg-3">
			<input type="text" class="form-control" name="quantity" /><br>
			</div>
			<div class="col-lg-3 dropdown">
						<label>Medicine Type <span class="required">*</span></label></div>
						<div class="col-lg-3 dropdown">
						<select name="m_type">
						<option value="1">Pain Killer</option>
						<option value="2">Weight Loss</option>
						<option value="3">Weight Gain</option>
						<option value="4">Vitamin</option>
						</select>
						  </div>
			<div class="col-lg-3 dropdown">
						<label>Store <span class="required">*</span></label></div>
						<div class="col-lg-3 dropdown">
						<select name="type">
						<option value="1">Hospital Medical Store</option>
						<option value="2">Own Medical Store</option>
						<option value="3">Chain Pharmacy Outlets</option>
					
						</select>
						  </div>
			<div class="col-lg-3"><br>
			<label>Expiry Date</label>
			
			</div>
			<div class="col-lg-3 "><br>
			<input type="date" name="date">
	
			</div>
			<div class="col-lg-3 dropdown">
						<label>Company <span class="required">*</span></label></div>
						<div class="col-lg-3 dropdown">
						<select name="var">
						<option value="1">Company 1</option>
						<option value="2">Company 2</option>
						<option value="3">Company 3</option>
					
						</select>
						  </div>
			<div class="col-lg-12">
                         <button class="btn btn-success btn-lg float-right" value="Register">Save </button>
                         <label></label>
                         <button class="btn  btn-lg float-right"><a href="Medicine.jsp">Back</a></button>
            </div>
						  
		
		</div>
	
	</div>





</form>


</body>
</html>