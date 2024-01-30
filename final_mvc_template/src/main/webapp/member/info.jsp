<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"  %>
<section class="wrap">
<table class="info">
	<tr>
		<td>회원번호</td>
		<td>
		
		</td>
	</tr>
	<tr>
		<td>아이디</td>
		<td>
		
		</td>
	</tr>
	<tr>
		<td>나이</td>
		<td>
		
		</td>
	</tr>
	<tr>
		<td>성별</td>
		<td>
			남성
			여성
		</td>
	</tr>
	<tr>
		<td>회원등록일</td>
		<td>
			
		</td>
	</tr>
	<tr>
		<td colspan=2>
			<input type="button" onclick="" value="메인" /> | 
			<input type="button" onclick="withdraw('');" value="회원탈퇴" />
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

