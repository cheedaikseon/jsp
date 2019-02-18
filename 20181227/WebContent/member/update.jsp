<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:include page="../common/header.jsp"/>
	<h1>회원가입</h1>
	<form action="memberUpdate.mb" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="id" value="${member.id}" readonly /></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="pass" value="${member.pass}"/></td>
			</tr>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name" value="${member.name}"/></td>
			</tr>
			<tr>
				<td>주소</td>
				<td><input type="text" name="addr" value="${member.addr}"/></td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td><input type="text" name="phone" value="${member.phone}"/></td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="submit" value="정보수정">
					<input type="button" onclick="javascript:location.href='test1';" value="메인"/>
				</td>
			</tr>
		</table>	
	</form>
</body>
</html>