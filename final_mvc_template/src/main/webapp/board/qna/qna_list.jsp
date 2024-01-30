<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_list.jsp -->
<%@ include file="/common/header.jsp"  %>
<section class="wrap">
	<table>
		<tr>
			<th colspan="5">
				<h1>질문과 답변 목록</h1>
			</th>
		</tr>
		<tr>
			<th colspan="5" style="text-align:right">
				<a href="#">질문 작성하러 가기</a>
			</th>
		</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<!-- 게시글 목록 출력 -->
		
		
		<!-- 페이징 처리 -->
		
		
		<!-- 등록된 게시물 없음 -->
		<tr>
			<th colspan="8">
				등록된 게시물이 없습니다.
			</th>
		</tr>
	</table>
</section>
<%@ include file="/common/footer.jsp"  %>












