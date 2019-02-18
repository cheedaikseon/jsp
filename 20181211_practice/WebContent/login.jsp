<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	<style>
		table{
			text-align:center;
			margin: 0 auto;
			padding-top:200px;
		}
		
		table tr{
			height:40px;
		}
	</style>
    <form action="loginCheck.jsp" method="post">
    	<table>
    		<tr>
    			<td>아이디</td>
    			<td><input type="text" name="id"/></td>
    		</tr>
    		<tr>
    			<td>비밀번호</td>
    			<td><input type="password" name="pass"/></td>
    		</tr>
    		<tr>
    			<td colspan=2>
    				<input type="checkbox" id="login" name="login" value="login"/>
    				<label for="login">로그인 상태 유지</label>
   				</td>
    		</tr>
    		<tr>
    			<td colspan="2">
    				<input type="submit" value="로그인"/>
    			</td>
    		</tr>
    	</table>
    
    </form>