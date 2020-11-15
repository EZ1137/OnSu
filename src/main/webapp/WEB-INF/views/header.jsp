<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ page import="com.kh.onsoo.admin.model.dto.AdminDto" %>
<%@ page import="com.kh.onsoo.admin.model.dto.AuthDto" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>   
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="${pageContext.request.contextPath}/resources/css/header.css?after" rel="stylesheet">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript">
   function menu() {
       if ($('#mySidenav').css('display') == 'none') {
          $('#mySidenav').show();
          
      } else {
          $('#mySidenav').hide();
      }
   }
</script>
</head>
<body>

   <div>
      <div class="wrapper">
         <div id="header-bar" onclick="location.href='${pageContext.request.contextPath}/main.do'">
            <span> On:Soo </span>
         </div>
         <nav>
            <!-- 통합검색 -->
            <form id="searchzone" action="classSearch.do">
               <input type="hidden" name="class_title" value="class_title">
               <input type="text" name="search" id="headsearch" required="required" placeholder="찾으시는 강의를 검색하세요"> 
            </form>
            
            
            <ul class="header-menu">
            <!-- 권한 없을시 페이지   -->
            

                  <sec:authorize access="isAnonymous()">
                  <li>
                     <a href="<c:url value="/login/loginForm.do" />">
                        <span class="login">
                           <button id="loginbtn">Log In</button>
                        </span>
                     </a>
                  </li>
                  <li>
                     <a href="<c:url value="/registForm.do" />">
                        <span class="regist">
                           <button id="registbtn">Sign Up</button>
                        </span>
                     </a>
                  </li>
                  </sec:authorize>
                  
                     <sec:authorize access="hasRole('USER')">
                     <li>
                           <sec:authentication property="principal.username" var="user_id"  />
                           <div id="user_id"> ${user_id}님 안녕하세요</div>
                     </li>
                     <li>
                           <span class="login">
                              <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                  <input type="submit" id="loginbtn" value="Log Out" />
                              </form:form>
                           </span>
                     </li>
                     <li>
                        <a href="<c:url value="/user/registUdpatechk.do" />">
                           <span class="regist">
                              <button id="registbtn">My Info</button>
                           </span>
                        </a>
                     </li>
                     </sec:authorize>
               
                     <sec:authorize access="hasRole('ADMIN')">
                     <li>
                        <a href="<c:url value="admin/admin.do" />">
                           <span class="regist">
                              <button id="registbtn">Admin Page</button>
                           </span>
                        </a>
                     </li>
                     </sec:authorize>
                     <sec:authorize access="hasRole('BLOCK')">
                     <li>
                           <sec:authentication property="principal.username" var="user_id"  />
                           <div id="user_id">안녕하세요. ${user_id}</div>
                     </li>
                     <li>
                           <span class="login">
                              <form:form action="${pageContext.request.contextPath}/logout" method="POST">
                                  <input type="submit" id="loginbtn" value="Log Out" />
                              </form:form>
                           </span>
                     </li>
                     <li>
                        <a href="<c:url value="/user/registUdpatechk.do" />">
                           <span class="regist">
                              <button id="registbtn">My Info</button>
                           </span>
                        </a>
                     </li>
                     </sec:authorize>
            </ul>
            <div class="sidenav">
               <i id="hamburger" class="fas fa-bars fa-2x" onclick="menu()"></i>
               <div id="mySidenav">
               
                  <sec:authorize access="isAnonymous()">
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/about.do'">A B O U T</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/video/studylist.do'">V I D E O</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/with/studylist.do'">1 : 1 C L A S S</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/qna.do'">Q n A</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/notice.do'">N O T I C E</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/contact.do'">C O N T A C T</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/admin/admin.do'">A D M I N</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/mypage.do'">M Y P A G E</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/freelist.do'">F R E E</p>
                  </sec:authorize>
                  <sec:authorize access="hasRole('BLOCK')">
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/block.do'">B L O C K</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/qna.do'">Q n A</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/notice.do'">N O T I C E</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/contact.do'">C O N T A C T</p>
                  </sec:authorize>
                  <sec:authorize access="hasAnyRole('USER','ADMIN' )">
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/about.do'">A B O U T</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/video/studylist.do'">V I D E O</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/with/studylist.do'">1 : 1 C L A S S</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/qna.do'">Q n A</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/notice.do'">N O T I C E</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/contact.do'">C O N T A C T</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/admin/adminpage.do'">A D M I N</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/mypage.do'">M Y P A G E</p>
                  <p class="sideAsset" onclick="location.href='${pageContext.request.contextPath}/freelist.do'">F R E E</p>
                  </sec:authorize>                  
               </div>
            </div>
         </nav>
      </div>
   </div>

</body>
</html>