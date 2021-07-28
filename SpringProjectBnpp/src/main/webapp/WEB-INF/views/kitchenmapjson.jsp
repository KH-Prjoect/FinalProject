<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>for the kitchen latlng list</title>
<!-- spacecloud   공유주방 정보 가져오는 코드 -->
<script src="https://code.jquery.com/jquery-3.6.0.min.js" ></script>



<script type="text/javascript" >

// 여기까지 해서 
$.getJSON('resources/spacecloudjson/SCpage1.json', function(data) {
	// console.log(data.result[0].lng);
	 //SCpage1을 전부 data 에 넣어서, result의 키 안의 인덱스들(장소들) 의 이름. 경위도를 가져옴 
	 for(let i=0; i < data.result.length; i++){  
			console.log(data.result[i].spcNm + "/"+ data.result[i].lat +"," + data.result[i].lng);
		}

 });
 


$.getJSON('resources/spacecloudjson/SCpage2.json', function(data) {
	// console.log(data.result[0].lng);
	 //SCpage1을 전부 data 에 넣어서, result의 키 안의 인덱스들(장소들) 의 이름. 경위도를 가져옴 
	 for(let i=0; i < data.result.length; i++){  
			console.log(data.result[i].spcNm + "/"+ data.result[i].lat +"," + data.result[i].lng);
		}

 });
 

$.getJSON('resources/spacecloudjson/SCpage3.json', function(data) {
	// console.log(data.result[0].lng);
	 //SCpage1을 전부 data 에 넣어서, result의 키 안의 인덱스들(장소들) 의 이름. 경위도를 가져옴 
	 for(let i=0; i < data.result.length; i++){  
			console.log(data.result[i].spcNm + "/"+ data.result[i].lat +"," + data.result[i].lng);
		}

 });
 

$.getJSON('resources/spacecloudjson/SCpage4.json', function(data) {
	// console.log(data.result[0].lng);
	 //SCpage1을 전부 data 에 넣어서, result의 키 안의 인덱스들(장소들) 의 이름. 경위도를 가져옴 
	 for(let i=0; i < data.result.length; i++){  
			console.log(data.result[i].spcNm + "/"+ data.result[i].lat +"," + data.result[i].lng);
		}

 });
 
 

$.getJSON('resources/spacecloudjson/SCpage5.json', function(data) {
	// console.log(data.result[0].lng);
	 //SCpage1을 전부 data 에 넣어서, result의 키 안의 인덱스들(장소들) 의 이름. 경위도를 가져옴 
	 for(let i=0; i < data.result.length; i++){  
			console.log(data.result[i].spcNm + "/"+ data.result[i].lat +"," + data.result[i].lng);
		}

 });
 

$.getJSON('resources/spacecloudjson/SCpage6.json', function(data) {
	// console.log(data.result[0].lng);
	 //SCpage1을 전부 data 에 넣어서, result의 키 안의 인덱스들(장소들) 의 이름. 경위도를 가져옴 
	 for(let i=0; i < data.result.length; i++){  
			console.log(data.result[i].spcNm + "/"+ data.result[i].lat +"," + data.result[i].lng);
		}

 });
 
/* getJSON  의 경로에 대한 설명  = = = == = = = = = = =

                     localhost:3334/bnpp/  : 3334 까지가 tomcat의 루트이고, 
                                           : /bnpp/ 가 context root ,  물리적인 최상위 디렉토리 
                                           [ webapp = context root ]
   viewresolver  가 prefix  surfix  .jsp 붙여서 jsp파일들의 이름을 만들어주는데, 
  spring이 .jsp 파일들은 views안에 있지만,   root를 webapp으로 해줌! (jsp 파일들 함부로 못건들게 할라고? )
  
   그래서 webapp부터 root가 시작하니까 resource 앞에 / 필요없음! 
   */
</script>
</head>
<body>

</h4>
</body>
</html>