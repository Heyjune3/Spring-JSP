<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"  %>
<section class="wrap">
<!-- qna_update.jsp -->
	<form action="#" method="POST">
		<table>
			<tr>
				<th colspan="2"><h1>게시글 수정</h1></th>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
					<input type="text" name="qna_name" value="" required />
				</td>
			</tr>
			<tr>
				<td>글제목</td>
				<td>
					<input type="text" name="qna_title" value="" required />
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







