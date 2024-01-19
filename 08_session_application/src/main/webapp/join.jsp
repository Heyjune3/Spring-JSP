<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- uid|upw|uname -->
<%@ include file="common/header.jsp" %>
<form action="joinCheck.jsp" method="POST">
	<table border=1>
		<tr>
			<th colspan="2">
				<h3>JOIN PAGE</h3>
			</th>
		</tr>
		<tr>
			<th>아이디</th>
			<td>
			<!-- required가 있는 값은 submit에 값이 없으면 넘어가지 못한다. -->
				<input type="text" name="uid" required/>
			</td>
		</tr>
		<tr>
			<th>비밀번호</th>
			<td>
				<input type="password" name="upw" required/>
			</td>
		</tr>
		<tr>
			<th>이름</th>
			<td>
				<input type="text" name="uname" required/>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button>회원가입</button>
			</th>
		</tr>
	</table>
</form>
<%@ include file="common/tail.jsp" %>