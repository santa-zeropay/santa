<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
<link rel="stylesheet" href="/resources/css/login.css">
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
						<label for="email">이메일 <span> 이메일 형식 지켜주세요 ex ) aa@naver.com</span></label> <input type="text"
							class="login-input" id="email" name="email"
							placeholder="아이디(이메일)를 입력해주세요"><span text="${valid_email}"></span>
					</div>

					<div class="form-group">
						<label for="password">비밀번호 <span>	비밀번호는 8자 이상 20자 이하로 입력해주세요.</span></label> <input type="password"
							class="login-input" id="password" name="password"
							placeholder="비밀번호를 입렵해주세요"><span text="${valid_password}"></span>
					</div>

					<div class="form-group">
						<label for="name">이름</label> <input type="text"
							class="login-input" id="name" name="name"
							placeholder="이름을 입력해주세요"><span text="${valid_name}"></span>
					</div>

					<div class="form-group">
						<label for="phonenum">핸드폰번호   <span>	ex) 010########</span></label> <input type="text"
							class="login-input" id="phonenum" name="phonenum"
							placeholder="핸드폰번호를 입력해주세요"><span text="${valid_phonenum}"></span>
					</div>

					<div class="form-group">
						<label for="role">역할</label>
						<div class="login-input">
							<input type="radio" name="role" id="role0" value="0"
								checked="checked"> 고객 <input type="radio" name="role"
								id="role1" value="1">사장님
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
							<label for="address">가게주소 </label> <input type="text"
								class="login-input" id="address" name="address"
								placeholder="가게주소를 입력해주세요">
						</div>

						<div class="form-group">
							<label for="phonenum">가게사진</label> <input type="file"
								class="login-input" id="fileItem" name="uploadFile"
								placeholder="가게사진을 넣어주세요">
							<div id="uploadResult"></div>
						</div>
					</div>
					<input type="submit" class="join_button" value="회원가입"></input>
					<input type="hidden" name="x" id="x"/>
					<input type="hidden" name="y" id="y"/>						
				</form>
	<div id="map" style="width:100%;height:350px;"></div>

			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
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
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=0b464bd1a1b138cbb522d292c53f2214&libraries=services"></script>
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