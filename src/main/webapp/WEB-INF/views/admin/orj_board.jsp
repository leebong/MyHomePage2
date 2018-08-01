<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"></script>





<script type="text/javascript">
		function deleteBoard(){
			var conf = confirm("삭제하시겠습니까?");
			if(conf){
				var link = "/admin/board/delete?number=" 
						+ number + "&Page"+page;
				location.href = link;
			}
		}
</script>



</head>
<body>
	<nav class="navbar navbar-expand-sm bg-warning navbar-dark">
		<div class="container">
			<div class="col-12">
				<form class="form-inline" 
			  		style="display:inline-block">
		  		  	<select class="form-control" name="type">
		  		  		<option value="0"
		  		  			<c:out value="${type==0?'selected':''}"/>
		  		  		>선택</option>
					    <option value="1" 
					    	<c:out value="${type==1?'selected':''}"/>
					    >제목</option>
					    <option value="2"
					    	<c:out value="${type==2?'selected':''}"/>
					    >저자</option>
					    <option value="3"
					    	<c:out value="${type==3?'selected':''}"/>
					    >내용</option>
					</select>
			    	<input class="form-control mr-sm-2" type="text" 
			    	placeholder="Search" name="search" value="${search}">
			    	<button class="btn btn-success" type="submit">Search</button>
			  	</form>
			  	<div class="float-right ">
			  		<c:if test="${!admin}">
			  			<a href="/admin/user">사용자관리 페이지</a>
			  		</c:if>
		  			<span style="color:white"> | </span>
			  		<a href="/board/list">게시판 페이지</a>
		  			<span style="color:white"> | </span>
			  		<a href="/modify">회원 정보 수정</a>
				  	<span style="color:white"> | </span>
					<a href="/logout">로그아웃</a>
				</div>
			</div>
	  	</div>
	</nav>
	
	<div class="container">
		<h1>게시판 관리</h1>
		
		<table class="table table-bordered">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>목록뷰</th>
				<th>글삭제</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="board" items="${list}" varStatus="page">
				<tr>
					<td>${board.number}</td>
					<td><a href="/board/detail?number=${board.number}">${board.title }</a></td>
					<td>${board.author }</td>
					<td>
						<c:if test="${board.disable.compareTo('TRUE')==0}">
							<a href="/admin/board/disable?number=${board.number}&disable=FALSE&page=${pageMaker.criteria.page}">
								<button>가능</button>
							</a>
						</c:if>
						<c:if test="${board.disable.compareTo('FALSE')==0}">
							<a href="/admin/board/disable?number=${board.number}&disable=TRUE&page=${pageMaker.criteria.page}">
								<button>불가능</button>
							</a>
						</c:if>
					</td>
					<td>

						<c:if test="${board.disable.compareTo('TRUE')==0}">
							<a href="/admin/board/delete?number=${board.number}&disable=FALSE&page=${pageMaker.criteria.page}">
								<button onclick="deleteBoard()">삭제</button>
							</a>
						</c:if>		
					</td>
					
				</tr>
			</c:forEach>
		</tbody>
	</table>
		<ul class="pagination" style="justify-content: center;">
			<c:if test="${pageMaker.prev}">
		  		<li class="page-item">
		  			<a class="page-link" 
		  			href="/admin/board?page=${pageMaker.startPage-1}">Prev</a>
	  			</li>
	  		</c:if>
		  	<c:forEach var="page" begin="${pageMaker.startPage}" 
		  		end="${pageMaker.endPage}" >
		  		<li class="page-item">
		  			<a class="page-link" href="/admin/board?page=${page}">${page}</a>
	  			</li>
		  	</c:forEach>
		  	<c:if test="${pageMaker.next}">
		  		<li class="page-item">
		  			<a class="page-link" href="/admin/board?page=${pageMaker.endPage+1}">Next</a>
	  			</li>
	  		</c:if>
		</ul>
	</div>
	
	
</body>
</html>