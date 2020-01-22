//user - customB > cuBoardWrtieForm & customB >cuBoardView(댓글)
function onlyNumber(event){
	event = event || window.event;
	var keyID = (event.which) ? event.which : event.keyCode;
	if ( (keyID >= 48 && keyID <= 57) ||
		(keyID >= 96 && keyID <= 105) ||
		keyID == 8 || keyID == 46 || 
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

function checkValues(){

	var input = document.frm;
	if(input.subject.value.length>50){
		alert("견적문의 글 제목은 50자를 넘을 수 없습니다.");
		input.subject.style.borderColor = "#800000";
		input.subject.style.borderWidth = "2px";
		return false;
	}
	var no = 0;
	if(!input.subject.value){
		no++;
		input.subject.style.borderColor = "#800000";
		input.subject.style.borderWidth = "2px";
	}else{
		input.subject.style.borderColor = "#A09F9F";
		input.subject.style.borderWidth = "1px";
	}
	if(!input.content.value){
		no++;
		input.content.style.borderColor = "#800000";
		input.content.style.borderWidth = "2px";
	}else{
		input.content.style.borderColor = "#A09F9F";
		input.content.style.borderWidth = "1px";
	}
	
	var num = document.getElementsByName("option").length;
	for(var i=0; i<num; i++){
		var option = document.getElementsByName("option")[i];
		if(!option.value){
			no++;
			option.style.borderColor = "#800000";
			option.style.borderWidth = "2px";
		}else{
			option.style.borderColor = "#A09F9F";
			option.style.borderWidth = "1px";
		}
	}
	
	if(no>0){
		return false;
	}
}

//user - cuboardView의 reply
function blank(){
	var form = document.comment;
	if(!form.com.value){
		if(form.price.value&&form.options.value){
			return true;
		}else{
			alert('견적 문의 답변글을 작성해주세요.');
			return false;
		}
	}
}

