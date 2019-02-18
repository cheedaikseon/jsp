<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %> <!-- //xml을불러오기 위함 -->
<%@ page import = "javax.naming.*" %>

<%
	request.setCharacterEncoding("utf-8");
	
	String num = request.getParameter("b_num"); // 값 받아오기
	int b_num = Integer.parseInt(num);// 인수형으로 변환하기.
	
	Connection con = null; //연결객체
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String auth = "";
	String content = "";
	
	try{
		
		Context init = new InitialContext();	//jdbc/OracleDB
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");		
		con = ds.getConnection();
		
		String sql = "SELECT * FROM board_test WHERE b_num =?";
		
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,b_num);
		
		rs = pstmt.executeQuery();
		
		while(rs.next()){//rs의 값이 존재하면 돌아감
			
			auth = rs.getString("b_auth");
			content = rs.getString("b_content");

			
		}
		
	}catch(Exception e){
		e.printStackTrace();
	}finally{
		rs.close();
		pstmt.close();
		con.close();
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

</style>
</head>
<body>
	<jsp:include page="header.jsp"/>
	<article>
	<form action = "updateSubmit.jsp" method = "post">
		<input type = "hidden" name ="b_num" value = "<%=b_num %>"/>
		<table>
			<tr>
				<td>작성자</td>
				<td><input type = "text" name = "b_auth" value = "<%=auth%>"/></td>
			</tr>
			<tr>
				<td>내용</td>
				<td><input type = "text" name = "b_content" value = "<%=content%>" style="width:300px;height:300px;"/></td>
			</tr>
			<tr>
				<td colspan = "2"><input type = "submit" value = "수정 완료"></td>
			</tr>
		</table>
		
	</form></article>	
	<jsp:include page="footer.jsp"/>
</body>
</html>