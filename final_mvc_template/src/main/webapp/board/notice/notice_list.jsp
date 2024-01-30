<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"  %>
<section  class="wrap">
	<table class="list">
		<tr>
			<th colspan="4">
				<h1>공지사항</h1>
			</th>
		</tr>
		<tr>
			<th colspan="4">${pm}</th>
		</tr>
		<tr>
			<td colspan="4">
				<a href="noticeWrite.do">공지글 작성</a>
			</td>
		</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
		</tr>
		<!-- 게시글 목록 존재 시 -->
		
		
		<!-- 페이징 블럭 출력 -->
		
		
		<!-- 게시글 목록 미 존재 시 -->
		<tr>
			<td colspan="4">등록된 게시물이 없습니다.</td>
		</tr>
	</table>
</section>
<%@ include file="/common/footer.jsp"  %>






