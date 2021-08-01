<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp" />

	<div class="main-banner wow fadeIn">
<h1>공유주방 정보</h1>
지금 현재 나의 위치가 가장 먼저 표시됩니다.(chrom e에선 https 환경에서만 가능합니다.)<br>
gps 가 현재 위치를 찾기까지 잠시 기다려 주세요 <br><br>
1.서울시의 공유주방의 정보를 지도에서 확인할 수 있습니다.  <br><br>
2.마커에 마우스를 올리면 타이틀이 마커 위에 표시됩니다.<br><br>
3. 마커를 클릭하면 지도 밖에 마커이름이 표시됩니다. <br><br>

 -----------todo : 마커 클릭시 맵 밖에 주소 보이도록 하기 <br><br><br>



	
<!-- 지도를 표시할 div 입니다 -->
<div id="map" style="width:50%; height:350px;"></div>
<br><br><br>
	<table border="1">
		<tr>
			<th>공간 이름</th>
			<td id="kitchenName"></td>
		</tr>
</table><br>
		<span>
	    	<button type="button" id="spaceinfo"  onclick="popup();">공간 정보보기</button>
	    </span>
	    
</div>
<jsp:include page="footer.jsp" />
	    
	    <!--  script -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!--  javascript -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c49d55de179096be77a889b0a969ef10&libraries=clusterer"></script>
<script  type="text/javascript" >





var positions = [ ];
var nowSeq = "";


for(let i=1; i <6; i++){
	$.getJSON('resources/spacecloudjson/SCpage'+i+'.json', function(data) {
		// console.log(data.result[0].lng);
		 //SCpage1을 전부 data 에 넣어서, result의 키 안의 인덱스들(장소들) 의 이름. 경위도를 가져옴 
		 for(let j=0; j < data.result.length; j++){  
			 positions.push({ content : data.result[j].spcNm , latlng : new kakao.maps.LatLng(data.result[j].lat , data.result[j].lng) , spcSeq : data.result[j].spcSeq   });
			 //console.log(data.result[j].spcNm + "/"+ data.result[j].lat +"," + data.result[j].lng);
		 } 
	});
}
 		console.log(positions); 

//list = [ {"이름":name, "lng":123, "lat":123}, ~~~ ]
//{이름. [lat.lng] }  를 list 에 넣
/* getJSON  의 경로에 대한 설명  = = = ==
                  localhost:3334/bnpp/  : 3334 까지가 tomcat의 루트이고, 
                                        : /bnpp/ 가 context root ,  물리적인 최상위 디렉토리 
                                        [ webapp = context root ]
viewresolver  가 prefix  surfix  .jsp 붙여서 jsp파일들의 이름을 만들어주는데, 
spring이 .jsp 파일들은 views안에 있지만,   root를 webapp으로 해줌! (jsp 파일들 함부로 못건들게 할라고? )

그래서 webapp부터 root가 시작하니까 resource 앞에 / 필요없음! 
*/
//============================================
// div에 지도를 표시
var mapContainer = document.getElementById('map'),  
    mapOption = { 
        // browser open시 지도가 처음에 표시될  중심좌표
        center: new kakao.maps.LatLng(33.450701, 126.570667), 
        level: 10// 지도의 확대 레벨  (숫자가 커질수록 넓은 범위가 보임.)
    };  
    
    
    
//지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOption); 


		//지금 나의 위치 
		//HTML5의 geolocation으로 사용할 수 있는지 확인합니다 --------------------------------------------
		if (navigator.geolocation) {
		 // GeoLocation을 이용해서 접속 위치를 얻어옵니다
		 navigator.geolocation.getCurrentPosition(function(position) {
			 var lat = position.coords.latitude, // 위도
		         lon = position.coords.longitude; // 경도
		     var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
		         message = '<div style="padding:5px;"> 나의 현재위치</div>'; // 인포윈도우에 표시될 내용입니다
		         // 마커와 인포윈도우를 표시합니다
		     displayMarker(locPosition, message);
		   });
		//HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
		} else { 
		    var locPosition = new kakao.maps.LatLng(33.450701, 126.570667),    
		        message = 'geolocation을 사용할수 없어요..'
		    displayMarker(locPosition, message);
		}
		
		//--------------geolocation----------------------------------------------
		
		//마커를 보여주는 함수 
		function displayMarker(locPosition, message) {
		 // 마커를 생성합니다
		 var marker = new kakao.maps.Marker({  
		     map: map, 
		     position: locPosition
		 }); 
		 
		 
		 var iwContent = message, // 인포윈도우에 표시할 내용
		     iwRemoveable = true;
		
		 // 인포윈도우를 생성합니다
		 //클릭하면 아래쪽에 작게 나타나는 인포윈도우 
		  var infowindow = new kakao.maps.InfoWindow({
		     content : iwContent,
		     removable : iwRemoveable
		 });		 
		 // 인포윈도우를 마커위에 표시합니다 
		 infowindow.open(map, marker);
		 
		 // 지도 중심좌표를 접속위치로 변경합니다
		 map.setCenter(locPosition);     
		 
		 kakao.maps.event.addListener(marker, 'click', function() {
				// 마커 위에 인포윈도우를 표시합니다
			    infowindow.open(map, marker);  
			});
		}  
		
		
		   // 마커 클러스터러를 생성합니다 
		    var clusterer = new kakao.maps.MarkerClusterer({
		        map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
		        averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
		        minLevel: 10 // 클러스터 할 최소 지도 레벨 
		    });  

		
			var marker; 
				//var 재선언 가능 
				//let 재선언 불가, 값 바꾸기 가능.
				//const 둘다안됨.
				
			setTimeout(           //지연시키는 함수 
			   function (){    
					for (let i = 0; i < positions.length; i ++) {
				// 마커를 생성합니다
			       marker = new kakao.maps.Marker({
			    	map: map, // 마커를 표시할 지도
			        position: positions[i].latlng, // 마커의 위치
			        clickable: true
			        //true 로 지정하게 되면 마커를 클릭 했을 때, 지도의 클릭 이벤트가 발생하지 않도록 막아준다.
					    });	
				     // 클러스터러)에 마커들을 추가합니다
				     clusterer.addMarker(marker);
				    // 마커에 표시할 인포윈도우를 생성합니다 
				    let infowindow = new kakao.maps.InfoWindow({
				        	content: positions[i].content             // 인포윈도우의 내용.     	
				    });    
				    // 마커를 클릭하면 지도 밖에 이름을 표시해줌 . 
				    kakao.maps.event.addListener(marker, 'click', function() {
				    	 //console.log( i );
						   		      document.getElementById("kitchenName").innerHTML = positions[i].content; 
						   		      nowSeq = JSON.stringify(positions[i].spcSeq);
				    });
				    // 마커에 mouseover 이벤트와 mouseout 이벤트를 등록합니다
				    // 이벤트 리스너로는 클로저를 만들어 등록합니다 
				    // for문에서 클로저를 만들어 주지 않으면 마지막 마커에만 이벤트가 등록됩니다
				    kakao.maps.event.addListener(marker, 'mouseover', makeOverListener(map, marker, infowindow));
				    kakao.maps.event.addListener(marker, 'mouseout', makeOutListener(infowindow));
				}
							
							
				//--마우스 오버 아웃이벤트 -----
				//마커에 마우스오버 이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'mouseover', function() {
				// 마커에 마우스오버 이벤트가 발생하면 인포윈도우를 마커위에 표시합니다
				 infowindow.open(map, marker);
				});
				//마커에 마우스아웃 이벤트를 등록합니다
				kakao.maps.event.addListener(marker, 'mouseout', function() {
				 // 마커에 마우스아웃 이벤트가 발생하면 인포윈도우를 제거합니다
				 infowindow.close();
				});
				

				//---------------------------------------클릭시 스페이스 클라우드 주소 나오도록 ajax사용해서 
		/* 	   function ToSpaceAddr(){
					var getSpcSeq = positions[i].spcSeq
			 */
				
				}, 500);    //0.5초 지연시킴.
				
		
		
		
		//----------------infowindow on/off  함수 --------------------------------
		// 인포윈도우를 표시하는 클로저를 만드는 함수입니다 
		function makeOverListener(map, marker, infowindow) {
		    return function() {
		        infowindow.open(map, marker);
		    };
		}
		// 인포윈도우를 닫는 클로저를 만드는 함수입니다 
		function makeOutListener(infowindow) {
		    return function() {
		        infowindow.close();
		    };
		}
		
		
		//---------------------------------------클릭시 스페이스 클라우드 주소 나오도록 ajax사용해서 
	/*   function ToSpaceAddr(){
			var getSpcSeq = 
		}   */
		
		
		
		
		
	
		function popup(){
			
			var address = "https://www.spacecloud.kr/space/"+nowSeq+"?type=search"
			
					window.open( address, width=400, height=300, left=300, top=150 );
			}

		
</script>
</body>
</html>