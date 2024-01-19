/**
 * js/input.js
 */
// 문서가 모두 로드 되면 실행 할 함수
window.onload = function(){
	var input 
		= document.getElementsByTagName("input");
	var btn = document.querySelector("button");
	btn.onclick = function(event){
		for(var i=0; i<input.length; i++){
			// 작성된 value 값이 없을 때
			if(input[i].value.length == 0){
				var msg = input[i].dataset.msg+"를 확인해주세요.";
				alert(msg);
				input[i].focus();
				// submit 기본 이벤트 무시
				event.preventDefault();
				// 반복문 종료
				break;
			}
		}
	}
}










