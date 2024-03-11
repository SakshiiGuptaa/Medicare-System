<%@page import="com.entity.Doctor"%>
<%@page import="com.dao.DoctorDao"%>
<%@page import="com.entity.Specialist"%>
<%@page import="java.util.List"%>
<%@page import="com.db.DBConnect"%>
<%@page import="com.dao.SpecialistDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="../components/allcss.jsp" %>
<style>
	.paint-card{
		box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
	}
	body{
		background-image:url("../img/background.jpg");
	}
</style>
</head>
<body>
	<%@include file="navbar.jsp" %>
	<div class="container-fluid p-3">
		<div class="row">
		
			<div class="col-md-5 offset-md-4">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-3 text-center">Add Doctor</p>
							<c:if test="${not empty errorMsg}">
								<p class="fs-3 text-center text-danger">${errorMsg}</p>
								<c:remove var="errorMsg" scope="session" />
							</c:if>
							<c:if test="${not empty succMsg}">
								<div class="fs-3 text-center text-success" role="alert">${succMsg}</div>
								<c:remove var="succMsg" scope="session" />
							</c:if>
						<form action="../addDoctor" method="post">
							<div class="mb-3">
								<label class="form-label">Full Name</label>
								<input type="text" name="fullname" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">DOB</label>
								<input type="date" name="dob" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Qualifications</label>
								<input type="text" name="qualification" class="form-control" required>
							</div>
							<div class="mb-3">
								<label class="form-label">Specialist</label>
								<select name="spec" required class="form-control">
									<option>--select--</option>
									<% SpecialistDao dao= new SpecialistDao(DBConnect.getconn());
										List<Specialist> list = dao.getAllSpecialist();
										for(Specialist s : list){
										%>
										<option><%=s.getSpecialistName() %></option>
										<%
										}
									
									%>
								</select>
							</div>
							<div class="mb-3">
								<label class="form-label">Email</label>
								<input type="email" name="email" class="form-control" required>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Mob No</label>
								<input type="text" name="mobno" class="form-control" required>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Password</label>
								<input type="password" name="password" class="form-control" required>
							</div>
							
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</div>
			</div>
						
						
		</div>
	</div>
</body>
</html>