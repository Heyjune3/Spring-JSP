<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- join.jsp -->
<%@ include file="common/header.jsp" %>
<script type="text/javascript" src="js/inputCheck.js"></script>
<section>
<form action="joinCheck.jsp" method="POST">
	<table>
		<tr>
			<th colspan="2"><h1>회원가입</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<input type="text" name="id" data-msg="아이디" />
			</td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td>
				<input type="password" name="pass" data-msg="비밀번호" />
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<input type="text" name="name" data-msg="이름" />
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<input type="text" name="addr" data-msg="주소" />
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<input type="text" name="phone" data-msg="전화번호" />
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<label>
				<input type="radio" name="gender" value="남성" checked />
				남성
				</label>
				<label>
				<input type="radio" name="gender" value="여성" />
				여성
				</label>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<input type="number" name="age" data-msg="나이"/>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<button>회원가입</button>
			</th>
		</tr>
	</table>
</form>
</section>
<%@ include file="common/footer.jsp" %>








