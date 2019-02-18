<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function directLogin(){
		location.href="login.jsp";		
	}

</script>
</head>
<body>
	<h1>회원 가입 페이지</h1>
	<form action="joinSubmit.jsp" method="post">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="u_id"/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="text" name="u_pass"/></td>
			</tr>
			<tr>
				<td>나이</td>
				<td><input type="text" name="u_age"/></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<input type="radio" name="u_gender" id="male" value="male" checked/> <label for="male">남성</label>
					<input type="radio" name="u_gender" id="female" value="female"/> <label for="female">여성</label> 
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="회원가입"/>
					<input type="button"onclick="directLogin();" value="로그인" />
				</td>
			</tr>		
		</table>
	</form>
</body>
</html>