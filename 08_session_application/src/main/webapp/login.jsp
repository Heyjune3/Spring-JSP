<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login.jsp -->
<%@ include file="common/header.jsp" %>
<form action="loginCheck.jsp" method="POST">
<table border=1>
		<tr>
			<th colspan="2">
				<h3>LOGIN PAGE</h3>
			</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
			<!-- required가 있는 값은 submit에 값이 없으면 넘어가지 못한다. -->
				<input type="text" name="uid" required />
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="upw" required/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>
					<input type="checkbox" name ="rememberMe"/> 로그인 정보 저장
				</label>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button>로그인</button>
			</th>
		</tr>
	</table>
</form>
<%@ include file="common/tail.jsp" %>