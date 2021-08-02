<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd" 
"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>실시간 상담 채팅방</title>

<style type="text/css">

body {
  position: relative;
}



#mainbody{
	padding-top:150px;
	padding-bottom:100px;
	padding-left:50px;
	padding-right:50px;
}



/*  대화창 */
/* #messages {
	position: relative;
	background: #88b7d5;
	border: 4px solid #c2e1f5;
}
#messages :after, .messages :before {
	bottom: 100%;
	left: 50%;
	border: solid transparent;
	content: "";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

#messages :after {
	border-color: rgba(136, 183, 213, 0);
	border-bottom-color: #88b7d5;
	border-width: 30px;
	margin-left: -30px;
}
#messages :before {
	border-color: rgba(194, 225, 245, 0);
	border-bottom-color: #c2e1f5;
	border-width: 36px;
	margin-left: -36px;
} */



</style>

</head>
<body>
	<jsp:include page="header.jsp" />
    <div  id="mainbody">
        <button type="button" class="btn btn-success" onclick="openSocket();">상담 시작하기</button>
        <button type="button" class="btn btn-danger" onclick="closeSocket();">상담 끝내기</button>
    	<br/><br/><br/>
    	<c:choose>
    		<c:when test="${sessionScope.id eq 'admin'}">
    		고객님과의상담방입니다. 상담 시작하기를 눌러주세요. <br><br>
    		<input type="hidden"  id="sender" value="상담사" style="display: none;"/>
    		</c:when>
    	<c:otherwise>
          <input type="text" id="sender" value="${sessionScope.id}" style="display: none;">   <!--  id: jstl 로 사용 -->
          <p> [ ${id} 님과 상담사와의 실시간 채팅방 ] 입니다. 상담 시작하기를 눌러주세요 </p><br>
          </c:otherwise>
          </c:choose>
          <br>
          <div data-spy="scroll" data-target="#list-example" data-offset="0" class="scrollspy-example  bg-info" style="height: 300px;overflow: auto;" >
          <div  class="container" >
	           <!-- Server responses get written here -->
	   			 <div id="messages"  ></div>
  		  </div>
  		  </div>
    
    
          <div class="input-group has-validation">
  		<span class="input-group-text">메세지 입력</span>   <!--  메세지 입력  표시 -->
        <input type="text" id="messageinput" class="form-control"  placeholder=' 메세지를 입력해 주세요.'> <!--  메세지 입력 input -->
        <button type="button" onclick="send();" class="btn btn-outline-primary">메세지 전송</button> <!-- 전송버튼 -->
        <!--  현재의 대화내용 모두 지우는 함수 호출 버튼-->
       <!--   <button type="button" onclick="javascript:clearText();">대화내용 지우기</button> --> 
       </div>
    </div>
    
    
    <!-- websocket javascript =======================================-->
    <script type="text/javascript">
        var ws;
        var messages = document.getElementById("messages");
        
        //대화방참여 
        function openSocket(){
            if(ws !== undefined && ws.readyState !== WebSocket.CLOSED ){
                writeResponse("이미 대화방에 참여 중입니다.");
                return;
            }
            
            //웹소켓 객체 만드는 코드          //qclass.iptime.org  :포트도 톰켓 버전에 맞춰서 바꿔주기. (9.0에맞는거 쓰면 됨.)
            ws = new WebSocket("ws://localhost:3334/bnpp/echo.do");            //바꿔야 하나?
            		//localhost: me: 127.0.0.1  나한테 요청, 실제 아이피 주소가 바뀜. 
            		//dns. 
            
            
            ws.onopen = function(event){
                if(event.data === undefined){
              		return ;
                }
                writeResponse(event.data);  //  function writeResponse(text){   // +된 내메세지 보여주기
            };
            
            
            ws.onmessage = function(event){ // 메시지를 받았을 때(
                console.log('writeResponse');
                console.log(event.data)
                writeResponse(event.data);
            };
            
            //  function closeSocket()
            ws.onclose = function(event){
                writeResponse("대화 종료");
            }
            
        }
        
        //메세지전송 
        function send(){                         // 보낸사람의 메세지 내용 , 보낸사람 
            var text = document.getElementById("messageinput").value  + "," +document.getElementById("sender").value;  ///메세지 
            ws.send(text);
            text = "";
        }
        //대화방 나가기 
        function closeSocket(){
            ws.close();
        }
        
        // 내가 메세지전송 후 이제까지 메세지 + 내메세지 보여주기 
        function writeResponse(text){
            messages.innerHTML += "<br/>"+  text;
        }
        
        
        //대화내용 지우기 
       /*  function clearText(){
            console.log(messages.parentNode);
            messages.parentNode.removeChild(messages)
      	} */
  </script>
  <jsp:include page="footer.jsp" />
  
  
</body>
</html>