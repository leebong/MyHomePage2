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
</head>
<body>
	<style> 
		.form-control:disabled, .form-control[readonly]{
			background: #ffffff;
		}
	</style>
	<div class="container">
  		<form >
  			<h1>게시글 상세</h1>
		    <div class="form-group">
		    	<label>번호</label>
		      	<input type="text" class="form-control" name="number" value="${board.number }" disabled>
		    </div>
		    <div class="form-group">
		    	<label>제목</label>
		      	<input type="text" class="form-control" name="title" value="${board.title}" disabled>
		    </div>
		    <div class="form-group">
		    	<label>작성자</label>
		      	<input type="text" class="form-control" name="author" value="${board.author}" disabled>
		    </div>
		    <!-- 2018-06-22 파일다운로드추가 -->
			<div class="form-group">
		        <label>첨부파일</label>
		        <div class="form-control" name="file" id="file">
		        	<c:if test="${fileName != null}">
			        	<a href="/board/download?fileName=${board.filepath}" target="_blank">
			        	${fileName}</a>
		        	</c:if>
		        	
		        	<c:if test="${fileName == null}">
		        		<font color = "red">첨부파일없음</font>
		        	</c:if>
		        </div>
		        
 			</div>
		    <div class="form-group">
		    	<label>내용</label>
		      	<textarea class="form-control" rows="5" name="contents" disabled>${board.contents}</textarea>
		    </div>
		    
	  	</form>
	  	<div>
		    <a href="/board/list"><button class="btn btn-primary">목록</button></a>

			<c:if test="${isAuthor}">
			    <a href="/board/modify?number=${board.number }">
			    <button class="btn btn-primary">수정</button></a>
			</c:if>
		   
		    <!-- 
		    1. jsp에 button 추가 - 추가한 삭제 버튼 클리시 /board/delete로 이동 가능하도록 작성
		    2. Controller에서 /board/delete를 관리하는 메서드를 추가
		    3. 해당 Controller에서 넘겨받은 정보를 이용하여 boardMapper를 이용하여 게시판 정보를 가져옴
		    4. 가져온 게시판 정보에 disable값을 true로 설정한다
		    5. 그리고 수정된 가져온 정보를 boardMapper를 이용하여 업데이트 한다
		    6. 모든 작업이 끝나면 /board/list로 redirect한다.
		     -->
		    <c:if test="${isAuthor}">
		    <a href="/board/delete?number=${board.number }">
		    	<button class="btn btn-danger">삭제</button></a>
		    </c:if>
		    
	    </div>
	</div>
</body>
</html>