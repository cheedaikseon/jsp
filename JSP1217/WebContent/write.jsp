<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import = "vo.MemberVo" %>
<%@ page import = "java.sql.*" %>
<%@ page import = "javax.sql.*" %>
<%@ page import = "javax.naming.*" %>
    <% 
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	
		try{
			Context init = new InitialContext();
			DataSource ds = (DataSource)init.lookup("java:comp/env/jdbc/oracleDB");
			con = ds.getConnection();
			
		}catch(Exception e){
			e.printStackTrace();
		}
		Cookie cookies[] = request.getCookies();
		if(cookies != null){
			for(int i= 0; i<cookies.length; i++){
				if(cookies[i].getName().equals("id")){
					
					String sql = "SELECT * FROM test_member WHERE id = ?";
					pstmt = con.prepareStatement(sql);
					pstmt.setString(1,cookies[i].getValue());
					
					rs = pstmt.executeQuery();
					
					MemberVo member = null;
					
					while(rs.next()){
						member = new MemberVo();
						member.setId(rs.getString("id"));
					}
					
					if(member != null){
						session.setAttribute("member",member);	
					}
					
				}
			}
		}
		
		if(rs!=null){rs.close();}
		if(pstmt!=null){pstmt.close();}
		if(con!=null){con.close();}
		
		// id값은 session의 정보
		MemberVo sessionMember = (MemberVo)session.getAttribute("member"); 
			
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
	<jsp:include page="header.jsp"/>
	<article>
	<form action="writeSubmit.jsp" method="post">
		<table>
			<tr>
				<td>작성자</td>
				<td><input type="text" name="b_auth" value="<%= sessionMember.getId()%>" /></td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
					<textarea name="b_content" style="width:300px;height:300px;"></textarea>
				</td>
			</tr>
			<tr>
				<td><input type="submit" value="작성완료"/></td>
			</tr>
		</table>
	</form></article>	
	<jsp:include page="footer.jsp"/>
</body>
</html>