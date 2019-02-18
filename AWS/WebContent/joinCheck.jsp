<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>



<jsp:useBean id="joinMember" class="vo.MemberVo"/>
<jsp:setProperty property="*" name="joinMember"/>

<% 

	request.setCharacterEncoding("UTF-8"); 
	Connection con =null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	try{
		Context init = new InitialContext();
		DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/mysql");
		con = ds.getConnection();
		
		String sql = "SELECT * FROM test_member WHERE id = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		rs = pstmt.executeQuery();
		
		while(rs.next()){
			out.print("<script>alert('이미 존재하는 아이디입니다.'); location.href='index.jsp?page=join';</script>");
			return;
		}
		rs.close();
		
		sql = "INSERT INTO test_member(id,pass,name,addr,phone) values(?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, joinMember.getId());
		pstmt.setString(2, joinMember.getPass());
		pstmt.setString(3, joinMember.getName());
		pstmt.setString(4, joinMember.getAddr());
		pstmt.setString(5, joinMember.getPhone());
		pstmt.executeUpdate();
		
		out.print("<script>alert('회원가입 완료');location.href='index.jsp?page='login';</script>");
		
		
	}catch(Exception e){
		
	}finally{
		pstmt.close();
		con.close();
	}



%>
<script>
	alert("회원가입 완료!");
	location.href="index.jsp?page=login";
</script>