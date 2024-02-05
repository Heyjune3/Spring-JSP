<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_writer.jsp -->
<%@ include file="/common/header.jsp"  %>
<section class="wrap">
	<h1> 글 작성</h1>
	<!-- 
		1. qnaSubmit.qna
	 -->
	<form action="qnaSubmit.qna" method="POST">
		<input type="hidden" name="qna_writer_num" value="${member.num}"/>
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="qna_name" value="${member.name}" required readonly/>
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" name="qna_title" required />
				</td>
			</tr>
			<tr>
				<td>
					글 내용
				</td>
				<td>
					<textarea name="qna_content" cols="50" rows="10" required></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input type="submit" value="작성완료"/> 
					<input type="reset" value="새로작성"/>
				</td>
			</tr>
		</table>
	</form>
</section>
<%@ include file="/common/footer.jsp"  %>









