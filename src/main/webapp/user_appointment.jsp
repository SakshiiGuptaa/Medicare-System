<%@page import="com.entity.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.db.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Appointment</title>
<%@include file="components/allcss.jsp" %>
<style>
	.paint-card{
		box-shadow: 0 0 8px 0 rgba(0,0,0,0.3);
	}
	.backImg{
		background:linear-gradient(rgba(0,0,0,0.4),rgba(0,0,0,0.4)),url("img/hospital.jpg");
		height:20vh;
		width:100%;
		background-size:cover;
		background-repeat:no-repeat;
	}
</style>
</head>
<body>
	<%@include file="components/navbar.jsp" %>
	
	<div class="container-fluid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	
	<div class="container p-3">
		<div class="row">
			<div class="col-md-6 p-5">
				<img alt="" src="img/doctor.jpg">
			</div>
			
			<div class="col-md-6">
				<div class="card paint-card">
					<div class="card-body">
						<p class="text-center fs-3">User Appointment</p>
						<c:if test="${not empty succMsg}">
							<p class="text-center text-success fs-5">${succMsg}</p>
							<c:remove var="succMsg" scope="session"/>
						</c:if>
						
						<c:if test="${not empty errorMsg}">
							<p class="text-center text-danger fs-5">${errorMsg}</p>
							<c:remove var="errorMsg" scope="session" />
						</c:if>
						
						<form class="row g-3" action="addAppointment" method="post">
							
							<input type="hidden" name="userid" value="${userObj.id}">
							
						    <div class="col-md-6">
								<label class="form-label">Full Name</label>
								<input name="fullname" type="text" class="form-control" required> 
							</div>
							
							
						    <div class="col-md-6">
								<label class="form-label">Gender</label>
								<select class="form-control" name="gender" required>
									<option value="male">Male</option>
									<option value="female">Female</option>
								</select>
							</div>
							
						    <div class="col-md-6">
								<label class="form-label">Age</label>
								<input name="age" type="number" class="form-control" required> 
							</div>
							
						    <div class="col-md-6">
								<label class="form-label">Appointment Date</label>
								<input name="appoint_date" type="date" class="form-control" required> 
							</div>
							
							
						    <div class="col-md-6">
								<label class="form-label">Email</label>
								<input name="email" type="email" class="form-control" required> 
							</div>
							
							
						    <div class="col-md-6">
								<label class="form-label">Phone No</label>
								<input maxlength="10" name="phno" type="number" class="form-control" required> 
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Diseases</label>
								<input name="diseases" type="text" class="form-control" required> 
							</div>
							
							<div class="col-md-6">
								<label class="form-label">Doctor</label>
								<select class="form-control" name="doct" required>
									<option value="">--select--</option>
									<% 
									DoctorDao dao = new DoctorDao(DBConnect.getconn());
									List<Doctor> list = dao.getAllDoctor();
									for(Doctor d : list){	
									%>
									<option value="<%=d.getId() %>"><%=d.getId() %>  <%=d.getFullName() %>(<%= d.getSpecialist() %>)</option>
									
									<%
									}
									%>
								</select>
							</div>
							
							<div class="col-md-12">
								<label>Full Address</label>
								<textarea required class="form-control" name="address" rows="3" cols=""></textarea>
							</div>
							
							<c:if test="${empty userObj}">
								<a href="user_login.jsp" class="col-md-6 offset-md-3 btn btn-success">Submit</a>
							</c:if>
							
							<c:if test="${not empty userObj}">
								<button class="col-md-6 offset-md-3 btn btn-success">Submit</button>
							</c:if>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>