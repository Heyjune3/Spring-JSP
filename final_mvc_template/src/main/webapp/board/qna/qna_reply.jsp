<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- qna_writer.jsp -->
<%@ include file="/common/header.jsp"  %>
<!-- 원본글 번호 -->
<section class="wrap">
	<h1> 답변 글 작성</h1>
	<form action="#" method="POST">
		<table>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="qna_name" value="" readonly required />
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









