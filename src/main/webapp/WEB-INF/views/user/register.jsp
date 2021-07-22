<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/resources/css/form.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>>

</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="login-form">
				<div class="logo-wrapper">
					<img class="logo" src="../../../resources/images/wp_logo.png">
					<div class="tagline">
						Welcome Package ! <br> 회원가입 감사합니다 ♡
					</div>
				</div>

				<form method="post" id="login-button">

					<div class="form-group">
						<label for="email">이메일 <span> 이메일 형식 지켜주세요 ex )
								aa@naver.com</span></label> <input type="text" class="login-input" id="email"
							name="email" placeholder="아이디(이메일)를 입력해주세요"><span
							text="${valid_email}"></span>
					</div>

					<div class="form-group">
						<label for="password">비밀번호 <span> 비밀번호는 8자 이상 20자
								이하로 입력해주세요.</span></label> <input type="password" class="login-input"
							id="password" name="password" placeholder="비밀번호를 입렵해주세요"><span
							text="${valid_password}"></span>
					</div>

					<div class="form-group">
						<label for="name">이름</label> <input type="text"
							class="login-input" id="name" name="name"
							placeholder="이름을 입력해주세요"><span text="${valid_name}"></span>
					</div>

					<div class="form-group">
						<label for="phonenum">핸드폰번호 <span> ex) 010########</span></label>
						<input type="text" class="login-input" id="phonenum"
							name="phonenum" placeholder="핸드폰번호를 입력해주세요"><span
							text="${valid_phonenum}"></span>
					</div>

					<div class="form-group">
						<label for="role">역할</label>
						<div class="login-input">
							<input type="radio" name="role" id="role0" value="0"> 고객
							<input type="radio" name="role" id="role1" value="1">사장님
						</div>
					</div>
					<div id="appendOwner" style="display: none">

						<div class="form-group">
							<label for="storenumber">사업자등록번호</label> <input type="text"
								class="login-input" id="stornumber" name="storenumber"
								placeholder="사업자번호를 입력해주세요">
						</div>


						<div class="form-group">
							<label for="storename">가게이름 </label> <input type="text"
								class="login-input" id="storename" name="storename"
								placeholder="가게이름을  입력해주세요">
						</div>
						<div class="form-group">
							<label for="category">카테고리</label>
							<div class="login-input">
								<input type="radio" name="category"  value="1">한식
								<input type="radio" name="category"  value="2">유흥주점
								<input type="radio" name="category"  value="3"> 중식
								<input type="radio" name="category"  value="4">카페
								<input type="radio" name="category"  value="5">일식
								<input type="radio" name="category"  value="6">치킨
								<input type="radio" name="category"  value="7">패스트푸드
								<input type="radio" name="category"  value="8">샐러드
							</div>
						</div>
						<div class="form-group">
							<input class="form-control" style="width: 40%; display: inline;"
								placeholder="우편번호" name="addr1" id="addr1" type="text"
								readonly="readonly">
							<button type="button" class="btn btn-default"
								onclick="execPostCode();">
								<i class="fa fa-search"></i> 우편번호 찾기
							</button>
						</div>
						<div class="form-group">
							<input class="form-control" style="top: 5px;"
								placeholder="도로명 주소" name="address" id="address" type="text"
								readonly="readonly" />
						</div>
						<div class="form-group">
							<input class="form-control" placeholder="상세주소" name="addr3"
								id="addr3" type="text" />
						</div>

						<div class="form-group">
							<label for="phonenum">가게사진</label> <input type="file"
								class="login-input" id="fileItem" name="uploadFile"
								placeholder="가게사진을 넣어주세요">
							<div id="uploadResult"></div>
						</div>
					</div>
					<input type="submit" class="join_button" value="회원가입"></input> <input
						type="hidden" name="x" id="x" /> <input type="hidden" name="y"
						id="y" />
				</form>
				<div id="map" style="width: 100%; height: 350px;"></div>

			</div>
		</div>
	</div>

	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
	function execPostCode() {
        new daum.Postcode({
            oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

               // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
               // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
               var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
               var extraRoadAddr = ''; // 도로명 조합형 주소 변수

               // 법정동명이 있을 경우 추가한다. (법정리는 제외)
               // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                   extraRoadAddr += data.bname;
               }
               // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment === 'Y'){
                  extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== ''){
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== ''){
                   fullRoadAddr += extraRoadAddr;
               }

               // 우편번호와 주소 정보를 해당 필드에 넣는다.
               console.log(data.zonecode);
               console.log(fullRoadAddr);
               
               
               $("[name=addr1]").val(data.zonecode);
               $("[name=address]").val(fullRoadAddr);
               
               document.getElementById('addr1').value = data.zonecode; //5자리 새우편번호 사용
               document.getElementById('address').value = fullRoadAddr;
           }
        }).open();
    }
	</script>

	<script>
$(document).ready(function(){
	//회원가입 버튼(회원가입 기능 작동)
	$(".join_button").click(function(e){
		
		if($("#email").val()==''){			
			alert("이메일을 입력해주세요");
			return false;
		}else if($("#password").val()==''){			
			alert("비밀번호를 입력해주세요");
			return false;
		}else if($("#name").val()==''){			
			alert("이름을 입력해주세요");
			return false;
		}else if($("#phonenum").val()==''){			
			alert("핸드폰번호를 입력해주세요");
			return false;
		}
		$("#login-button").attr("action", "/user/register");
		$("#login-button").submit();
	});
	$("input:radio[name=role]").click(function(){
	 	if($("input:radio[name=role]:checked").val()=='0'){
	 		console.log("hide")
	        $("#appendOwner").hide();
	 		
		};
	    if($("input:radio[name=role]:checked").val()=='1'){
	        $("#appendOwner").show();
		};
	});	
	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 10485760; //1MB	

	function fileCheck(fileName, fileSize){

		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}			  
		if(!regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;		
	}

	$("input[type='file']").on("change", function(e){
		if($(".imgDeleteBtn").length > 0){
			deleteFile();
		}		
		let formData= new FormData();
		var fileInput=$('input[name="uploadFile"]');

		console.log(fileInput.val)
		
		var fileList=fileInput[0].files;
		
		console.log(fileList);
		
		var fileObj = fileList[0];
		console.log(fileObj);
		
		if(!fileCheck(fileObj.name, fileObj.size)){
			return false;
		}
		
		formData.append("uploadFile",fileObj)
		console.log(formData)
		
		$.ajax({
			url: '/user/uploadAjaxAction',
	    	processData : false,
	    	contentType : false,
	    	data : formData,
	    	type : 'POST',
	    	dataType : 'json',
	    	success: function(result){
	    		console.log(result);
	    		showUploadImage(result);
	    	},
	    	error: function(result){
	    		alert("이미지파일이아니다");
	    	}
	    	
		});	
		
		alert('통과')
	});


	function showUploadImage(uploadResultArr){
		
		if(!uploadResultArr || uploadResultArr.length == 0 ){
			return
			}

		let uploadResult = $("#uploadResult");

		let obj=uploadResultArr[0];
		
		let str ="";

		let fileCallPath = encodeURIComponent(obj.uploadPath.replace(/\\/g, '/') + "/s_" + obj.uuid + "_" + obj.fileName);

		str += "<div id='result_card'>";
		str += "<img src='/user/display?fileName=" + fileCallPath +"'>";
		str += "<div class='imgDeleteBtn' data-file='"+ fileCallPath +"'>x</div>";
		str += "<input type='hidden' name='imageList[0].fileName' value='"+ obj.fileName +"'>";
		str += "<input type='hidden' name='imageList[0].uuid' value='"+ obj.uuid +"'>";
		str += "<input type='hidden' name='imageList[0].uploadPath' value='"+ obj.uploadPath +"'>";	
		str += "</div>";

		uploadResult.append(str);     

	};

	$("#uploadResult").on("click", ".imgDeleteBtn", function(e){
		
		deleteFile();
		
	});

		function deleteFile(){

			let targetFile = $(".imgDeleteBtn").data("file");
			
			let targetDiv = $("#result_card");
			
			$.ajax({
				url:"/user/deleteFile",
				data:{fileName:targetFile},
				dataType:"text",
				type:"POST",
				success:function(result){
					console.log(result);
					
					targetDiv.remove();
					$("input[type='file']").val("");
				},
				error:function(result){
					console.log(result);
					alert("삭제실패")
				}

			});
		}
	
});


</script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b464bd1a1b138cbb522d292c53f2214&libraries=services"></script>
	<script>

// 주소-좌표 변환 객체를 생성합니다
var geocoder = new kakao.maps.services.Geocoder();

// 주소로 좌표를 검색합니다
geocoder.addressSearch('제주특별자치도 제주시 첨단로 242', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {

        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        console.log(coords.La);

        console.log(coords.Ma);

        console.log(coords);
        
    } 
});    
</script>
</body>
</html>