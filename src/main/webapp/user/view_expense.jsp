<%@page import="com.entity.Expense"%>
<%@page import="java.util.List"%>
<%@page import="com.db.HibernateUtil"%>
<%@page import="com.dao.ExpenseDao"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>All Expenses</title>
<%@include file="../Component/All_css.jsp"%>


<style type="text/css">
.card-sh {
	box-shadow: 0 0 6px 0 rgba(0, 0, 0.3);
}
</style>

</head>
<body>

	<c:if test="${empty loginUser }">
		<c:redirect url="../login.jsp"></c:redirect>
	</c:if>

	<%@include file="../Component/Navbar.jsp"%>

	<div class="container">
		<div class="row">
			<div class="col-md-8 offset-md-2">
				<div class="card card-sh">
					<div class="card-header text-center">
						<p class="fs-3">All Expenses</p>
						<c:if test="${not empty msg }">
							<p class="text-center text-sucess fs-4">${msg}</p>
							<c:remove var="msg" />
						</c:if>

					</div>
					<table class="table caption-top">
						<thead>
							<tr>
								<th scope="col">Title</th>
								<th scope="col">Description</th>
								<th scope="col">Date</th>
								<th scope="col">Time</th>
								<th scope="col">Price</th>
								<th scope="col">Action</th>
							</tr>
						</thead>
						<tbody>
							<%
							User user = (User) session.getAttribute("loginUser");

							ExpenseDao dao = new ExpenseDao(HibernateUtil.getSessionFactory());
							List<Expense> list = dao.getAllExpenseByUser(user);
							for (Expense ex : list) {
							%>
							<tr>
								<th scope="row"><%=ex.getTitle()%></th>
								<td><%=ex.getDescription()%></td>
								<td><%=ex.getDate()%></td>
								<td><%=ex.getTime()%></td>
								<td><%=ex.getPrice()%></td>
								<td>
								<a href="editExpense.jsp?id=<%=ex.getId()%>"
									class="btn btn-sm btn-primary me-1">Edit</a> 
									
								<a href="../deleteExpense?id=<%=ex.getId()%>"
									class="btn btn-sm btn-danger me-1">Delete</a>	
								</td>

							</tr>
							<%
							}
							%>
						</tbody>
					</table>
					<div class="card-body"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
