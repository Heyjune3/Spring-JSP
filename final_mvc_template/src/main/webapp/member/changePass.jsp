<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<section>
	<form action="changePass.mc" method="POST">
		<input type="hidden" name="id" value="${id}" />
		<table>
			<tr>
				<th colspan="2">
					<h1>비밀번호 변경</h1>
				</th>
			</tr>
			<tr>
				<th colspan="2">
					새롭게 사용하실 비밀번호를 입력해 주세요.
				</th>
			</tr>
			<tr>
				<td>새 비밀번호</td>
				<td>
					<input type="password" name="pass" required />
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="변경하러 가기" />
				</th>
			</tr>
		</table>
	</form>
</section>

<%@ include file="/common/footer.jsp" %>