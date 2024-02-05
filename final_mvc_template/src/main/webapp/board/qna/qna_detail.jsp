<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/common/header.jsp"  %>
<section class="wrap">
	<table class="list">
		<tr>
			<th colspan=2><h1>게시물 상세내용</h1></th>
		</tr>
		<tr>
			<td>작성자</td>
			<td>
				${qna.qna_name}
			</td>
		</tr>
		<tr>
			<td>제목</td>
			<td>
				${qna.qna_title}
			</td>
		</tr>
		<tr>
			<td>내용</td>
			<td>
				<pre>${qna.qna_content}</pre>
			</td>
		</tr>
		<tr>
			<td colspan=2>
				<c:if test="${!empty member}">
					<a href="boardReply.qna?qna_num=${qna.qna_num}">[답글]</a>
					<c:if test="${qna.qna_writer_num eq member.num}">
						<a href="boardUpdate.qna?qna_num=${qna.qna_num}">[수정]</a>
						<a href="boardRemove.qna?qna_num=${qna.qna_num}">[삭제]</a>
					</c:if>
				</c:if>
				<a href="boardList.qna">[목록]</a>
			</td>
		</tr>
	</table>
</section>
<%@ include file="/common/footer.jsp"  %>