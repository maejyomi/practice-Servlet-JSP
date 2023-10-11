<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="common.JDBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JDBC</title>
</head>
<body>
	<h2>회원 목록 조회 테스트</h2> <!-- (executeQuery() 사용) -->
	<table border="1"  style = 'border-collapse : collapse;'>
	<tr style='background-color:skyblue;'><th>id</th><th>pass</th><th>name</th><th>regidate</th></tr>
	<%
	JDBConnect jdbc = new JDBConnect();
	Connection con = jdbc.getConnetcion();
	
	String sql = "select id, pass, name, regidate from member";
	Statement stmt = con.createStatement();
	
	ResultSet rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		String id = rs.getString(1);
		String pw = rs.getString(2);
		String name = rs.getString("name");
		java.sql.Date regidate = rs.getDate("regidate");
	%>
	<tr align = 'center'><td><%=id %></td>
		<td><%=pw %></td>
		<td><%=name %></td>
		<td><%=regidate %></td></tr>
	<% 
	}
	%>
	</table>
	
	<br/>
	
	<h2>게시판 목록 조회 테스트</h2>
	<table border="1"  style = 'border-collapse : collapse;'>
	<tr style='background-color:skyblue;'><th>num</th><th>title</th><th>content</th><th>id</th><th>postdate</th><th>visitcount</th></tr>
	<%
	sql = "select num, title, content, id, postdate, visitcount from board";
	stmt = con.createStatement();
	rs = stmt.executeQuery(sql);
	
	while(rs.next()){
		String num = rs.getString("num");
		String title = rs.getString("title");
		String content = rs.getString("content");
		String id = rs.getString("id");
		java.sql.Date postdate = rs.getDate("postdate");
		String visitcount = rs.getString("visitcount");
	%>
	<tr align = 'center'><td><%=num %></td>
		<td><%=title %></td>
		<td><%=content%></td>
		<td><%=id%></td>
		<td><%=postdate %></td>
		<td ><%=visitcount %></td></tr>
	<% 
	}
	
	rs.close();
	stmt.close();
	jdbc.close();
	%>
	</table>
</body>
</html>