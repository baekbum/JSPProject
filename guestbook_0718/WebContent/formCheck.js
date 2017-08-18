	function formCheck(obj) {
//		입력한 2개의 비밀번호가 일치하는가 검사한다.
		if(obj.password.value.trim() != obj.repassword.value.trim()) {
			alert("비밀번호가 올바르지 않습니다.");
			obj.password.value = "";
			obj.repassword.value = "";
			obj.password.focus();
			return false;
		}
		/*
//		비밀번호의 글자수를 검사한다.
		if(obj.password.value.trim().length < 8 || obj.password.value.trim().length > 12) {
			alert("비밀번호는 8자 이상 12자 이하로 입력해야 합니다.");
			obj.password.value = "";
			obj.repassword.value = "";
			obj.password.focus();
			return false;
		}
		*/
		/*
//		비밀번호가 영문자, 숫자, 특수문자를 각각 1개 이상씩 포함하고 있나 검사한다.
		alphaCount = 0;
		numberCount = 0;
		etcCount = 0;
		password = obj.password.value.trim();
		for(i=0 ; i<password.length ; i++) {
			if(password.charAt(i) >= 'a' && password.charAt(i) <= 'z') {
				alphaCount++;
			} else if(password.charAt(i) >= '0' && password.charAt(i) <= '9') {
				numberCount++;
			} else {
				etcCount++;
			}
		}
//		alert("문자 : " + alphaCount + ", 숫자 : " + numberCount + ", 특수문자 : " + etcCount);
		if(alphaCount == 0 || numberCount == 0 || etcCount == 0) {
			alert("영문자, 숫자, 특수문자를 1개 이상 포함해야 합니다.");
			obj.password.value = "";
			obj.repassword.value = "";
			obj.password.focus();
			return false;
		}
		*/
		return true;
	}