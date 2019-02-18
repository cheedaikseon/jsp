<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="vo.FinMemberVo" %>
<%@page import="java.util.*" %>
<%@page import="java.sql.*" %>
<%@page import="javax.sql.*" %>
<%@page import="javax.naming.*" %>
<jsp:include page="checkAdmin.jsp" />
<%
	// 회원 목록 가져오기
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("UTF-8"); 
	
	
	ArrayList<FinMemberVo> memberList = new ArrayList<>();
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
		con = ds.getConnection();
		
		String sql = "SELECT * FROM fin_member";
		pstmt = con.prepareStatement(sql);
		rs=pstmt.executeQuery();
		
		while(rs.next()){
			FinMemberVo mem = new FinMemberVo();
			mem.setU_num(rs.getInt("u_num"));
			mem.setU_id(rs.getString("u_id"));
			mem.setU_pass(rs.getString("u_pass"));
			mem.setU_age(rs.getInt("u_age"));
			mem.setU_gender(rs.getString("u_gender"));
			memberList.add(mem);
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
<title>회원관리</title>
</head>
<body>
	<h1>회원목록</h1>
	<table>
		<tr>
			<td>번호</td>
			<td>아이디</td>
			<td>나이</td>
			<td>성별</td>
			<td colspan=2>비고</td>
		</tr>
		<%for(FinMemberVo member : memberList){ %>
		<tr>
			<td><%=member.getU_num() %></td>
			<td><%=member.getU_id() %></td>
			<td><%=member.getU_age() %></td>
			<td><%=member.getU_gender() %></td>
			<td><a href="update.jsp?u_num=<%=member.getU_num()%>">수정</a></td>
			<td><a href="delete.jsp?u_num=<%=member.getU_num()%>">삭제</a></td>
		</tr>
		<%} %>
	</table>
</body>
</html>