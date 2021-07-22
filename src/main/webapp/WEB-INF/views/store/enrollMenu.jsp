<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myStore-메뉴등록</title>
<link rel="stylesheet" href="/resources/css/form.css">

</head>
<body>
	<jsp:include page="../top-var.jsp" flush="false" />
	<div class="container">
		<div class="row justify-content-center">
			<div class="login-form">
				<div class="logo-wrapper">
					<img class="logo" src="../../../resources/images/wp_logo.png">
					<div class="tagline2">메뉴등록</div>
				</div>

				<form method="post" id="login-button">

					<div class="form-group">
						<label for="menuname">메뉴 이름</label> <input type="text"
							class="login-input" id="menuname" name="menuname"
							placeholder="메뉴이름을 입력해주세요">
					</div>

					<div class="form-group">
						<label for="price">가격</label> <input type="text"
							class="login-input" id="price" name="price"
							placeholder="가격을 입력해주세요">
					</div>

					<div class="form-group">
						<label for="discountrate">할인율(10%는 0.1로 적어주세요!)</label> <input
							type="text" class="login-input" id="discountrate"
							name="discountrate" placeholder="할인율을 입력해주세요">
					</div>

					<div class="form-group">
						<label for="image">메뉴사진 </label> <input type="file"
							class="login-input" id="fileItem" name="uploadFile">
						<div id="uploadResult"></div>
					</div>
					<input type="button" value="메뉴등록" class="menuEnrollBtn"></input> <input
						type="button" value="돌아가기" class="returnMyStoreBtn"></input> <input
						type="hidden" name="store_id" value="${store_id}">

				</form>
			</div>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
	<script>
$(document).ready(function(){
	$(".menuEnrollBtn").click(function(){
		console.log("asdasdd")
	
		$("#login-button").attr("action", "/store/enrollMenuPlay");
		$("#login-button").submit();
	});
	
	$(".returnMyStoreBtn").click(function(){
		
		$("#login-button").attr("action", "/store/myStore");
		$("#login-button").submit();
	});
	



	/* var, method related with attachFile */
	let regex = new RegExp("(.*?)\.(jpg|png)$");
	let maxSize = 1048576; //1MB	

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



</body>
</html>