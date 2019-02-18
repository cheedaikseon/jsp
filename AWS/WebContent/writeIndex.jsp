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
		DataSource dataSource = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		con = dataSource.getConnection();
		
		String sql = "select @rownum:=@rownum+1 as rnum, board_test.* from board_test,(select @rownum:=0) as r order by rnum desc";
		pstmt = con.prepareStatement(sql);
		
		rs = pstmt.executeQuery();
		
	}catch(Exception e){
		e.printStackTrace();
	}
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	article{
		height:500px;
		border-bottom:1px solid #ccc;
	}
		table{
			text-align:center;
			margin: 0 auto;
			margin	-top:200px;
		}
		
		table tr{
			height:40px;
		}
</style>
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
			<td><%=rs.getInt("rnum")%></td>
			<td><%=rs.getString("b_auth")%></td>
			<td><%=rs.getString("b_content")%></td>	
			<td>
				<a href="update.jsp?b_num=<%=rs.getInt("b_num")%>">수정</a> 
				 | 
				<a href="delete.jsp?b_num=<%=rs.getInt("b_num")%>">삭제</a>
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