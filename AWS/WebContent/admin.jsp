<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "vo.MemberVo" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "java.util.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
<%
	MemberVo sessionMember = (MemberVo)session.getAttribute("member");
	if(sessionMember == null || !sessionMember.getId().equals("admin")){
		out.print("<script>alert('올바른 접근이 아닙니다.'); location.href='index.jsp';</script>");
		return;
	}	
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	request.setCharacterEncoding("UTF-8"); 
	
	ArrayList<MemberVo> memberList = new ArrayList<>();

	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		con = ds.getConnection();
		
		String sql = "SELECT * FROM test_member";
		pstmt = con.prepareStatement(sql);
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			MemberVo m = new MemberVo();
			m.setId(rs.getString("id"));
			m.setPass(rs.getString("pass"));
			m.setName(rs.getString("name"));
			m.setAddr(rs.getString("addr"));
			m.setPhone(rs.getString("phone"));
			memberList.add(m);
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
<title>admin</title>
</head>
<body>
	<h1>회원 목록</h1>
		<table>
		<tr>
		<th>아이디</th>
		<th>이름</th>
		<th>주소</th>
		<th>전화번호</th>
		</tr>
		<% for(MemberVo m : memberList){ %>
		<tr>
			<td><%=m.getId() %></td>
			<td><%=m.getName() %></td>
			<td><%=m.getAddr() %></td>
			<td><%=m.getPhone() %></td>
		</tr>
		<%} %>
		</table>

</body>
</html>