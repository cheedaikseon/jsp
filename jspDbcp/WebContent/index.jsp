<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<%
	
	Connection con = null;
	PreparedStatement pstmt =null;
	ResultSet rs = null;
	
	try{
		
		Context init = new InitialContext();
		DataSource dataSource = (DataSource)init.lookup("java:comp/env/jdbc/OracleDB");
		con = dataSource.getConnection();
		out.print("<h1>데이터베이스 연결 성공</h1>");
		
		String sql = "SELECT * FROM board_test ORDER BY b_num DESC";
		
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
	}catch(Exception e){
		out.print("<h1>데이터베이스 연결 실패</h1>");
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<table border=1>
		<tr>
			<td>번호</td>
			<td>작성자</td>
			<td colspan=2>내용</td>
		</tr>
		<% while(rs.next()){ %>
		<tr>
			<td><%=rs.getInt(1)%></td>
			<td><%=rs.getString(2)%></td>
			<td><%=rs.getString(3)%></td>	
			<td>
				<a href="update.jsp?b_num=<%=rs.getInt(1)%>">수정</a> 
				 | 
				<a href="delete.jsp?b_num=<%=rs.getInt(1)%>">삭제</a>
			</td>
		</tr>
		<%} %>
		<tr>
			<td colspan=4><a href="write.jsp">글 작성</a></td>
		</tr>
	</table>
	<%
		rs.close();
		pstmt.close();
		con.close();
	%>
</body>
</html>