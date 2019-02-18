<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="member" class="vo.MemberVo" scope="session"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	table{
    		text-align:center;
    		margin:0 auto;
    		padding-top:150px;
    	}
    	
    	table tr{
    		height:40px;
    	}
</style>
</head>
<body>
	<table>
		<tr>
			<td>아이디</td>
			<td><%=member.getId() %></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><%=member.getName() %></td>
		</tr>
		<tr>
			<td>주소</td>
			<td><%=member.getAddr() %></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><%=member.getPhone() %></td>
		</tr>
		<tr>
			<td>
				<a href="index.jsp">메인으로</a>
			</td>
		</tr>
	</table>
</body>
</html>