<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		Connection con = null;
		
		String driver = "oracle.jdbc.driver.OracleDriver";
			
		String url ="jdbc:oracle:thin:@localhost:1521:orcl";
		String username ="java";
		String pass ="java";
		
		try{
			Class.forName(driver);		
			
			con = DriverManager.getConnection(url,username,pass);
			
			out.print("연결 성공");
		}catch(Exception e){
			e.printStackTrace();
			out.print("연결 실패");
		}finally{
			con.close();
		}
	%>
	
	<a href="insertForm.jsp">회원정보 입력</a> <br/>
	<a href="updateForm.jsp">회원정보 수정</a> <br/>
	<a href="memberList.jsp">회원정보 확인</a> <br/>
	
</body>
</html>