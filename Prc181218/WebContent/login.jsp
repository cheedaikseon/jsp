<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
	$(function(){
		$("#btnBack").click(function(){
			location.href="index.jsp";
		});
	});
	
</script>
</head>
<body>
	<h1>로그인 페이지</h1>
	<form action="loginSubmit.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="u_pass"/></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인"/> | <input type="button" id="btnBack" value="돌아가기"/></td>
			</tr>
		</table>	
	</form>
</body>
</html>