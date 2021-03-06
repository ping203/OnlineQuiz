<%@page import="vn.fpt.fsoft.intern517.olt.common.Constants"%>
<%@page import="vn.fpt.fsoft.intern517.olt.model.bean.Exam"%>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>Đặt lại IP</title>
	<link rel="stylesheet" href="css/style.css" />
</head>
<body>

	<div id = "sidebar" class = "sidebar animate-sidebar" style = "display:none">
		<ul>
			<li class = "active"><a href="WelcomeAdminServlet">Thi Trắc Nghiệm Online</a></li>
			<%
				if(Constants.ADMIN_RIGHTS.equals(""+session.getAttribute("type"))){
			%>
			<li><a href="ManageAdminServlet">Quản lý Admin</a></li>
			<%
				}else if (Constants.ADMIN_CHILD_RIGHTS.equals(""+session.getAttribute("type"))){
			%>
			<li><a href="EditPasswordChildAdminServlet">Đổi mật khẩu</a></li>
			<%
				}
			%>
			<li><a href="ManageClassServlet">Quản lý lớp/học viên</a></li>
			<li><a href="ManageTopicServlet">Quản lý Topic</a></li>
			<li><a href="ResultClassServlet">Lấy kết quả</a></li>
			<li><a href="CheckIPServlet">Kiểm tra IP</a></li>
			<li><a href="ResetIPServlet">Reset IP/Xóa dữ liệu</a></li>
		</ul>
	</div>
	
	<div class = "overlay overlay-sidebar" id = "overlay" onclick="document.getElementById('sidebar').style.display='none'; document.getElementById('overlay').style.display='none';">
	</div>
		<div id = "navbar" class = "container-navbar">
		<ul>
			<li class = "active"><a onclick="document.getElementById('sidebar').style.display='block'; document.getElementById('overlay').style.display='block';">Thi Trắc Nghiệm Online</a></li>
			<li style="float:right"><a href = "LogoutServlet">Đăng xuất</a></li>
			<li style="float:right">
				<a>Xin Chào: <%=(String)session.getAttribute("userName") %></a>
			</li>
		</ul>	
	</div>

	<%
		if(Constants.ADMIN_RIGHTS.equals(""+session.getAttribute("type"))){
	%>
	<div id = "tab-reset" class = "container-tab-reset">
		<ul>
			<li><a class="active" href = "ResetIPServlet">Reset IP</a></li>
			<li><a href = "ResetAllIPServlet">Reset all IP</a></li>
			<li><a href = "DeleteDataServlet">Xoá dữ liệu</a></li>
		</ul>
	</div>
	<br>
	<%
		}else if (Constants.ADMIN_CHILD_RIGHTS.equals(""+session.getAttribute("type"))){
	%>
	<div id = "tab-reset2" class = "container-tab-reset">
		<ul>
			<li><a class="active" href = "ResetIPServlet">Reset IP</a></li>
			<li><a href = "ResetAllIPServlet">Reset all IP</a></li>
		</ul>
	</div>
	<br>
	<%
		}
		ArrayList<Exam> listIP = (ArrayList<Exam>)request.getAttribute("listIP");
	%>
	<div class = "container-table-result table-result">
		<table border="1" width="100%">
	    	<tbody>
	        	<tr>
	            	<th>Tên học viên</th>
	              	<th>Địa chỉ IP</th>
	              	<th>Topic</th>
	              	<th>Reset</th>
	            </tr>
	            <%
	            	for (Exam exam:listIP){
	            %>
	            <tr>
	              	<td><%=exam.getFullNameStudent() %></td>
	              	<td><%=exam.getAddressIP() %></td>
	              	<td><%=exam.getTopicName() %></td>
	              	<td style = "text-align: center">
	              		<%
	              			if(null == exam.getEndTime()){
	              		%>
	              		<button onclick="document.getElementById('resetIP<%=exam.getExamID() %>').style.display='block'">Reset</button>
	              		<%
	              			}else{
	              		%>
	              		<label>Đã nộp bài</label>
	              		<%
	              			}
	              		%>
	              	</td>
	            </tr>
	            <%
	            	}
	            %>
	       	</tbody>
	  	</table>
	</div>
	
	<%
		for (Exam exam:listIP){
	%>
	<form id = "resetIP<%=exam.getExamID() %>" class = "modal" action="ResetIPServlet" method="post">
		<div class ="modal-content-noti animate-noti">
			<div class = "container-noti-header">
			</div>
			<input name="examIP" value="<%=exam.getExamID() %>" style="display: none;">
			<div class = "container-noti">
				<p>Bạn có muốn đặt lai IP?</p>
			</div>
			<div class = "container-noti-footer">
				<button type="submit" value="submit" name="submit">OK</button>
				<input type="button" value="Hủy" onclick="document.getElementById('resetIP<%=exam.getExamID() %>').style.display='none'">
			</div>
		</div>
	</form>
	<%
		}
	%>
	
</body>
</html>