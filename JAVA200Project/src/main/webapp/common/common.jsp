<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   int twelve = 12 ;
%>
<%-- 로그인 상태 정보 --%>
<c:set var="whologin" value="0" /> 
<c:if test="${empty sessionScope.loginfo}">
   <c:set var="whologin" value="0" />
</c:if>
<c:if test="${not empty sessionScope.loginfo}">
   <c:if test="${sessionScope.loginfo.id == 'admin'}">
      <c:set var="whologin" value="2" />
   </c:if>
   <c:if test="${sessionScope.loginfo.id != 'admin'}">
      <c:set var="whologin" value="1" />
   </c:if>
</c:if>
<%
   String contextPath = request.getContextPath();
   
   String mapping = "/Shopping";
   
   String Noform = contextPath + mapping + "?command=";
   
   String YesForm = contextPath + mapping;
%>
<!DOCTYPE html>
<html>
<head>
   <meta charset="utf-8">
   <meta name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no">
      <link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Cinzel:wght@700&family=Slabo+27px&family=Song+Myung&display=swap" rel="stylesheet">
   <link rel="stylesheet" href="<%=contextPath%>/css/animate.css">
   <link rel="stylesheet" href="<%=contextPath%>/css/owl.carousel.min.css">
   <link rel="stylesheet" href="<%=contextPath%>/css/owl.theme.default.min.css">
   <link rel="stylesheet" href="<%=contextPath%>/css/magnific-popup.css">
   
   <link rel="stylesheet" href="<%=contextPath%>/css/flaticon.css">
   <link rel="stylesheet" href="<%=contextPath%>/css/style.css">
    <link rel="stylesheet"
      href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
   <script src="<%=contextPath%>/js/jquery.min.js"></script>
   <script src="<%=contextPath%>/js/jquery-migrate-3.0.1.min.js"></script>
   <script src="<%=contextPath%>/js/popper.min.js"></script>
   <script src="<%=contextPath%>/js/bootstrap.min.js"></script>
   <script src="<%=contextPath%>/js/jquery.easing.1.3.js"></script>
   <script src="<%=contextPath%>/js/jquery.waypoints.min.js"></script>
   <script src="<%=contextPath%>/js/jquery.stellar.min.js"></script>
   <script src="<%=contextPath%>/js/owl.carousel.min.js"></script>
   <script src="<%=contextPath%>/js/jquery.magnific-popup.min.js"></script>
   <script src="<%=contextPath%>/js/jquery.animateNumber.min.js"></script>
   <script src="<%=contextPath%>/js/scrollax.min.js"></script>
   
   <script src="<%=contextPath%>/js/main.js"></script>
   
   <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
   
   <style type="text/css">
      /* for form validation check */
      .err{font-size:10pt;color:red;font-weight:bolder;}
   </style>
   
   <script type="text/javascript">
      function zipfind() {
         
         new daum.Postcode({
            oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
   
                   // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                   // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var roadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 참고 항목 변수
   
                   // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                   // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                  extraRoadAddr += data.bname;
               }
                   // 건물명이 있고, 공동주택일 경우 추가한다.
                   if(data.buildingName !== '' && data.apartment === 'Y'){
                      extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                   }
                   // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                   if(extraRoadAddr !== ''){
                       extraRoadAddr = ' (' + extraRoadAddr + ')';
                   }
   
                   // 우편번호와 주소 정보를 해당 필드에 넣는다.
                   document.getElementById('zipcode').value = data.zonecode;
                   document.getElementById("roadaddress").value = roadAddr;
                   document.getElementById("address1").value = data.jibunAddress;
                   
                   // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                   if(roadAddr !== ''){
                       document.getElementById("extraaddress").value = extraRoadAddr;
                   } else {
                       document.getElementById("extraaddress").value = '';
                   }
   
                   var guideTextBox = document.getElementById("guide");
                   // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                   if(data.autoRoadAddress) {
                       var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                       guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                       guideTextBox.style.display = 'block';
   
                   } else if(data.autoJibunAddress) {
                       var expJibunAddr = data.autoJibunAddress;
                       guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                       guideTextBox.style.display = 'block';
                   } else {
                       guideTextBox.innerHTML = '';
                       guideTextBox.style.display = 'none';
                   }
               }
           }).open();
      }
      
      function gotomain() {
			location.href = '<%=Noform%>main';
		}
   </script>
   
</head>
<body>

</body>
</html>