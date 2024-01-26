<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="common/header.jsp"%>
<%
	if(loginMember == null){
%>
		<script>
			alert('잘못된 접근입니다.');
			location.replace('login.jsp');
		</script>
<%
		return; // info.jsp 종료
	}
%>
<section>
	<table>
		<tr>
			<th colspan="2"><h1>회원정보</h1></th>
		</tr>
		<tr>
			<td>아이디</td>
			<td>
				<%=loginMember.getId()%>
			</td>
		</tr>
		<tr>
			<td>이름</td>
			<td>
				<%=loginMember.getName()%>
			</td>
		</tr>
		<tr>
			<td>주소</td>
			<td>
				<%=loginMember.getAddr()%>
			</td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td>
				<%=loginMember.getPhone()%>
			</td>
		</tr>
		<tr>
			<td>성별</td>
			<td>
				<%=loginMember.getGender()%>
			</td>
		</tr>
		<tr>
			<td>나이</td>
			<td>
				<%=loginMember.getAge()%>
			</td>
		</tr>
		<tr>
			<th colspan="2">
				<!-- <button type="button" onclick="loacation.href='index.jsp';">메인으로</button> -->
				<button type="button" onclick="location.href='index.jsp';">메인으로</button>
			</th>
		</tr>
	</table>
</section>
<%@ include file="common/footer.jsp"%>























