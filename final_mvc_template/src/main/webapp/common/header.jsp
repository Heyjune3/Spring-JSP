<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="f" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test Member</title>
<c:url var="context" value="/"/>
<link href="${context}/css/header.css" rel="stylesheet" type="text/css" />
<link href="${context}/css/footer.css" rel="stylesheet" type="text/css" />
<link href="${context}/css/common.css" rel="stylesheet" type="text/css" />
<script>
	if('${msg}' != ''){
		alert('${msg}');
	}
</script>
</head>
<body>
	<header>
		<div>
			<ul>
				<li>
					<a href="${context}">home</a>
				</li>
				<c:choose>
					<c:when test="${!empty sessionScope.member}">
						<!-- 로그인 된 사용자 -->
						<li>
							<a href="info.mc">${member.name}</a>님 방가
						</li>
						<!-- 관리자 -->
						<c:if test="${member.id eq 'admin'}">
						<li>
							<a href="">회원관리</a>
						</li>
						</c:if>
						<li><a href="logOut.mc">로그아웃</a></li>
					</c:when>
					<c:otherwise>
						<!-- 비 로그인 사용자 -->
						<li><a href="login.mc">로그인</a></li>
						<li><a href="join.mc">회원가입</a></li>
					</c:otherwise>
				</c:choose>
				<li>
					<a href="${context}/googleMailTest">Google Mail Test</a>
				</li>
			</ul>
		</div>
		<div>
			<ul>
				<li><a href="#">공지사항</a></li>
				<li><a href="boardList.qna">질문과답변</a></li>
			</ul>
		</div>
	</header>
	
	
	
	
	
	
	
	
	
	
	
	
	
	