<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp" %>
<section class="wrap">
<table border=1>
	<tr>
		<th colspan="4">회원정보</th>
	</tr>
	<tr>
		<th>회원번호</th>
		<th>이름</th>
		<th>회원등록일</th>
		<th>기타</th>
	</tr>
	<!-- 회원 목록 출력 -->
	
	<!-- 페이징 블럭 출력 -->
	
	
	<!-- 등록된 회원 정보가 없을 시 출력 -->
	<tr>
		<td colspan="4">등록된 회원정보가 없습니다.</td>
	</tr>
</table>
<form name="updateForm" action="" method="POST">
	<input type="hidden" name="id" />
</form>
</section>
<%@ include file="/common/footer.jsp" %>










