<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- login.jsp -->
<%@ include file="common/header.jsp" %>
<script type="text/javascript" src="js/inputCheck.js"></script>
<section>
<form action="loginCheck.jsp" method="POST">
	<table>
		<tr>
			<th colspan="2"><h1>로그인</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" data-msg="아이디" autofocus autocomplete="off"/>
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" data-msg="비밀번호"/>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<label>
				<input type="checkbox" name="login" value="login"/>
					로그인 상태 유지
				</label>
			</td>
		</tr>
		<tr>
			<th colspan="2"><button>로그인</button></th>
		</tr>
	</table>
</form>
</section>
<%@ include file="common/footer.jsp" %>
















