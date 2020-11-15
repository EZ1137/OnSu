<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link
   href="${pageContext.request.contextPath}/resources/css/studylist.css"
   rel="stylesheet">
<link
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css"
   rel="stylesheet">
<!--CDN 링크 -->

</head>
<body>

   <section class="section second area">
      <div class="vod_cards_title">
         <p>동영상 강의</p>
      </div>
      <c:choose>
         <c:when test="${empty list }">
            <div class="class_row">
               <div class="class_card">
                  <div class="class_title">
                     <h3>준비 중</h3>
                  </div>
               </div>
            </div>
         </c:when>
         <c:otherwise>
            <div class="class_row">
               <c:forEach items="${list }" var="dto">
                  <div class="class_card" onclick="location.href='studydetail.do?class_no=${dto.studyDto.class_no}&member_id=${member_id }'">
                     <img src="<spring:url value='http://localhost:8787/image/${dto.uploadDto.image_directory }'/>" />
                     
                     <div class="class_title">
                        <h6 id="test" class="class_font"># ${dto.studyDto.class_bigcategory } &nbsp # ${dto.studyDto.class_smallcategory }</h6>
                        <h5 class="class_font">${dto.studyDto.class_teachername }</h5>
                        <h4 class="class_font">${dto.studyDto.class_title }</h4>
                        <h5 class="class_font">별점</h5>
                     </div>
                     
                  </div>
               </c:forEach>
            </div>
         </c:otherwise>
      </c:choose>
   </section>

   <!-- footer -->
   <footer id="footerarea" class="area">
      <%@ include file="/WEB-INF/views/footer.jsp"%>
   </footer>
</body>
</html>