<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"  %>
<section class="wrap">
<table class="info">
	<tr>
		<td>회원번호</td>
		<td>
			${member.num}
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
			${member.id}
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>
			${member.age}
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			<c:choose>
				<c:when test="${member.gender eq 'male'}">남성</c:when>
			<c:otherwise>여성</c:otherwise>
			</c:choose>
		</td>
	</tr>
	<tr>
		<td>회원등록일</td>
		<td>
			<f:formatDate value="${member.regdate}" pattern="yyyy년MM월dd일 E hh:mm:ss"/>
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="button" onclick="location.href='${context}';" value="메인" /> |
			<input type="button" onclick="withdraw('${member.id}');" value="회원탈퇴" />
		</td>
	</tr>
</table>

<script>
	function withdraw(u_id) {
		if (u_id == 'admin') {
			alert('관리자 계정은 삭제할 수 없습니다.');
			return;
		}

		if (confirm('정말로 탈퇴 하시겠습니까?')) {
			location.href = 'withdraw.mc';
		}
	}
</script>
</section>
<%@ include file="/common/footer.jsp"  %>

