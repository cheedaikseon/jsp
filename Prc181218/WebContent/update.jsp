<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.FinMemberVo" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<jsp:include page="checkAdmin.jsp" />
<%
	// 회원 정보 가져오기

	request.setCharacterEncoding("utf-8");
	Connection con = null; //연결객체
	PreparedStatement pstmt = null;
	ResultSet rs = null;


	String num = request.getParameter("u_num");
	int u_num = Integer.parseInt(num);

	FinMemberVo mem = new FinMemberVo();
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
		con = ds.getConnection();
		
		String sql =  "SELECT * FROM fin_member WHERE u_num =?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1,u_num);
		
		rs = pstmt.executeQuery();

		while(rs.next()){
			mem.setU_num(rs.getInt("u_num"));
			mem.setU_id(rs.getString("u_id"));
			mem.setU_pass(rs.getString("u_pass"));
			mem.setU_age(rs.getInt("u_age"));
			mem.setU_gender(rs.getString("u_pass"));
		}
		
		
	}catch(Exception e){
		
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
<title>회원관리</title>
</head>
<body>
	<h1>회원 정보 수정</h1><%if(mem != null){ %>
	<form action="updateSubmit.jsp" method="post">
		<input type="hidden" name="u_num" value="<%=mem.getU_num()%>"/>
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id" value="<%=mem.getU_id()%>"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="u_pass" value="<%=mem.getU_pass()%>" /></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="u_age" value="<%=mem.getU_age()%>"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<%if(mem.getU_gender().equals("male") ){ %>
					<input type="radio" name="u_gender" id="male" value="male" checked/> <label for="male">남성</label>
					<input type="radio" name="u_gender" id="female" value="female"/> <label for="female">여성</label>
					<%}else{%>
					<input type="radio" name="u_gender" id="male" value="male" /> <label for="male">남성</label>
					<input type="radio" name="u_gender" id="female" value="female" checked/> <label for="female">여성</label>
					<% 
					}
					%>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="수정"/>
				</td>
			</tr>		
		</table>
	</form><%}%>
</body>
</html>