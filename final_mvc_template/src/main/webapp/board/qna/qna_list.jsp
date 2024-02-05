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
		<c:if test="${!empty sessionScope.member}">
		<tr>
			<th colspan="5" style="text-align:right">
				<a href="boardWrite.qna">질문 작성하러 가기</a>
			</th>
		</tr>
		</c:if>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성시간</th>
			<th>조회수</th>
		</tr>
		<%-- 질문과 답변 게시물 목록을 list로 전달 --%>
		<c:choose>
			<c:when test="${!empty list}">
				<!-- 게시글 목록 출력 -->
				<c:forEach var="board" items="${list}">
					<c:choose>
						<c:when test="${board.qna_delete eq 'N'.charAt(0)}">
							<tr>
								<td>${board.qna_num}</td>
								<td style="text-align:left; padding:5px;">
									<c:if test="${board.qna_re_lev != 0}">
										<c:forEach begin="1" end="${board.qna_re_lev}">
											&nbsp;&nbsp;&nbsp;
										</c:forEach>
										<!-- ㅂ + 한자 키 + 6 -->
										└>
									</c:if>
									<a href="qnaAbout.qna?qna_num=${board.qna_num}" title="게시글 상세보기">
									${board.qna_title}
									</a>
								</td>
								<td>${board.qna_name}</td>
								<td>${board.qna_date}</td>
								<td>${board.qna_readcount}</td>
							</tr>
						</c:when>
						<c:otherwise>
							<tr>
								<td></td>
								<td>삭제된 게시물 입니다.</td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</c:otherwise>
					</c:choose>
				</c:forEach>
				<!-- 페이징 처리 -->
				<tr>
					<th colspan="5">
						<c:if test="${pm.first}">
							<a href="${pm.makeQuery(1)}">[처음]</a>
						</c:if>
						<c:if test="${pm.prev}">
							<a href="${pm.makeQuery(pm.startPage - 1)}">[이전]</a>
						</c:if>
						<c:forEach var="i" begin="${pm.startPage}" end="${pm.endPage}">
							<a href="${pm.makeQuery(i)}">[${i}]</a>
						</c:forEach>
						<c:if test="${pm.next}">
							<a href="${pm.makeQuery(pm.endPage + 1)}">[다음]</a>
						</c:if>
						<c:if test="${pm.last}">
							<a href="${pm.makeQuery(pm.maxPage)}">[마지막]</a>
						</c:if>
					</th>
				</tr>
			</c:when>
			<c:otherwise>
				<!-- 등록된 게시물 없음 -->
				<tr>
					<th colspan="5">
						등록된 게시물이 없습니다.
					</th>
				</tr>
			</c:otherwise>
		</c:choose>
	</table>
</section>
<%@ include file="/common/footer.jsp"  %>












