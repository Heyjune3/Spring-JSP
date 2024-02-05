<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- findPass.jsp -->
<%@ include file="/common/header.jsp" %>
<section>
	<form action="findPass.mc" method="POST">
		<table>
			<tr>
				<th colspan="2"> 
					<h1>비밀번호 찾기</h1>
				</th>
			</tr>
			<tr>
				<th colspan="2"> 
					회원가입 시 등록 한 아이디(email)과 이름을 입력해주세요.
				</th>
			</tr>
			<tr>
				<td>아이디(이메일)</td>
				<td>
					<input type="email" name="id" required />
				</td>
			</tr>
			<tr>
				<td>이름</td>
				<td>
					<input type="text" name="name" required />
				</td>
			</tr>
			<tr>
				<th colspan="2">
					<input type="submit" value="확인"/>
				</th>
			</tr>
		</table>
	</form>
</section>
<%@ include file="/common/footer.jsp" %>







