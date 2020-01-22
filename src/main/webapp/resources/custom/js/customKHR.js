//admin - adCustomWriteForm & adCustomModifyForm
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) ||
		(keyID >= 96 && keyID <= 105) ||
		keyID == 8 || keyID == 9 || keyID == 46 || 
		keyID == 37 || keyID == 39 ) 
		return;
	else
		return false;
}
function removeChar(event) {
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( keyID == 8 || keyID == 46 ) 
		return;
	else
		event.target.value = event.target.value.replace(/[^0-9]/g, "");
}

function checkValuesW(){
	var input = document.frm;
	if(input.name.value.length>30){
		alert("주문제작 상품명은 최대 30자를 넘을 수 없습니다.")
		input.name.parentNode.className = "form-group has-error";
		return false;
	}
	var num = document.getElementById("selectNum").value;
	var no = 0;
	if(!input.name.value){
		no++;
		input.name.parentNode.className = "form-group has-error";
	}else{
		input.name.parentNode.className = "form-group";
	}
	
	for(var i=0; i<3; i++){
		var cu_main = document.getElementsByName("cu_main_v")[i];
		if(!cu_main.value){
			no++;
			cu_main.style.backgroundColor = "red";
		}else{
			cu_main.style.backgroundColor = "white";
		}
	}
	if(!input.cu_detail_v.value){
		no++;
		input.cu_detail_v.style.backgroundColor = "red";
	}else{
		input.cu_detail_v.style.backgroundColor = "white";
	}
	for(var i=0; i<num; i++){
		var option = document.getElementsByName("option")[i];
		var optionName = document.getElementsByName("optionName")[i];
		if(!option.value){
			no++;
			option.parentNode.className = "form-group has-error col-lg-4 col-md-4 col-sm-3 col-xs-3";
		}else{
			option.parentNode.className = "form-group col-lg-4 col-md-4 col-sm-3 col-xs-3";
		}
		if(!optionName.value){
			no++;
			optionName.parentNode.className = "form-group has-error col-lg-8 col-md-8 col-sm-9 col-xs-9";
		}else{
			optionName.parentNode.className = "form-group col-lg-8 col-md-8 col-sm-9 col-xs-9";
		}
	}

	if(no>0){
		return false;
	}
}

function checkValuesM(){
	var input = document.frm;
	if(input.name.value.length>30){
		alert("주문제작 상품명은 최대 30자를 넘을 수 없습니다.")
		input.name.parentNode.className = "form-group has-error";
		return false;
	}
	var num = document.getElementById("selectNum").value;
	var no = 0;
	if(!input.name.value){
		no++;
		input.name.parentNode.className = "form-group has-error";
	}else{
		input.name.parentNode.className = "form-group";
	}
	for(var i=0; i<num; i++){
		var option = document.getElementsByName("option")[i];
		var optionName = document.getElementsByName("optionName")[i];
		if(!option.value){
			no++;
			option.parentNode.className = "form-group has-error col-lg-4 col-md-4 col-sm-3 col-xs-3";
		}else{
			option.parentNode.className = "form-group col-lg-4 col-md-4 col-sm-3 col-xs-3";
		}
		if(!optionName.value){
			no++;
			optionName.parentNode.className = "form-group has-error col-lg-8 col-md-8 col-sm-9 col-xs-9";
		}else{
			optionName.parentNode.className = "form-group col-lg-8 col-md-8 col-sm-9 col-xs-9";
		}
	}
	if(no>0){
		return false;
	}
}

//user - customReviewForm & customReviewModifyForm
function go(actionName){
	var input = document.form;
	var no=0;
	if(!input.subject.value || input.subject.value.length<5){
		no++;
		input.subject.style.borderColor = "#800000";
	}else{
		input.subject.style.borderColor = "#A09F9F";
	}
	if(!input.com.value || input.com.value.length<10){
		no++;
		input.com.style.borderColor = "#800000";
	}else{
		input.com.style.borderColor = "#A09F9F";
	}
	if(!input.re_img.value){
		input.re_img.style.backgroundColor = "white";
	}else{
		var file_name = input.re_img.value;
		var file_ext = file_name.substring(file_name.length, file_name.length-3);
		if(!(file_ext=='jpg'||file_ext=='png'
			||file_ext=='JPG'||file_ext=='PNG')){
			alert('jpg 또는 png 형식의 파일을 선택해주세요.');
			no++;
			input.re_img.style.backgroundColor = "#ff6060";
		}else{
			input.re_img.style.backgroundColor = "white";
		}
	}
	if(no>0){return false;}
	
	window.opener.name = "parent";
	input.target = "parent";
	input.action = actionName;
	input.submit();
	self.close();
}
//user - customView의 reply
function blank(form){
	if(!form.reply.value){
		alert('답변을 작성해주세요.');
		return false;
	}
}

