/*var email = "valid_email";
var phone="valid_phone";
var idcard = "valid_idcard";
var chinese = "valid_chinese";
var username = "valid_username";
var YMH="valid_Y_M_H";
var callback = "check_return";
var valid_null = "valid_null";*/

var emailPattern=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/,chinese =/^[\u0391-\uFFE5]+$/;
var phonePattern=/^(((1[3|4|5|6|7|8|9][0-9]{1})|(15[0-9]{1}))+\d{8})$/,usernameP = /^[A-Z_a-z0-9]*$/;
var ymh = /^\d{4}-\d{1,2}-\d{1,2}$/;

var ymhPttern=/^((((19|20)\d{2})-(0?[13-9]|1[012])-(0?[1-9]|[12]\d|30))|(((19|20)\d{2})-(0?[13578]|1[02])-31)|(((19|20)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|((((19|20)([13579][26]|[2468][048]|0[48]))|(2000))-0?2-29))$/;
;
function valid_regex(){
	$("[valid_email],[valid_phone],[valid_idcard],[valid_username],[valid_null],[valid_Y_M_H]").each(function(i,n){
		
		var val = getVal($(n));
		
		var check = $(n).attr("check_return");
		
		var msg = $(n).attr("placeholder");
		if(!msg)msg = "有必填项没输入,请检查";
		
		if(val !="" && val !='undefined'){
			$(n).attr({"check_return":"true","placeholder":msg});
		}else if($.type(check)=='undefined' || check=='false'){
			$(n).attr({"check_return":"false","placeholder":msg});
		}else if(check ==  'true'){
			$(n).attr({"check_return":"true","placeholder":msg});
		}
	});
}
;function valid_check(){
	
	valid_regex();
	
	$("body").delegate("[valid_idcard]","click propertychange input blur",function(){
		var $this = $(this);
		var val = getVal($this);
		if(!val){
			$this.attr({"check_return":"false","placeholder":"请输入身份证号"});
			return;
		}
		if(!isIdCardNo(val)){
			$this.attr({"check_return":"false","placeholder":"请输入正确的身份证号"});
			return;
		}
		$this.attr({"check_return":"true"});
	});
	
	$("body").delegate("[valid_email]","click propertychange input blur",function(){
		var $this = $(this);
		var val = getVal($this);
		if(!val){
			$this.attr({"check_return":"false","placeholder":"请输入邮箱"});
			return;
		}
		if(!emailPattern.test(val)){
			$this.attr({"check_return":"false","placeholder":"请输入正确的邮箱"});
			return;
		}
		$this.attr({"check_return":"true"});
	});
	
	$("body").delegate("[valid_phone]","click propertychange input blur",function(){
		var $this = $(this);
		var val = getVal($this);
		if(!val){
			$this.attr({"check_return":"false","placeholder":"请输入手机号"});
			return;
		}
		if(!phonePattern.test(val)){
			$this.attr({"check_return":"false","placeholder":"请输入正确的手机号"});
			return;
		}
		$this.attr({"check_return":"true"});
	});
	
	$("body").delegate("[valid_username]","click propertychange input blur",function(){
		var $this = $(this);
		var val = getVal($this);
		if(!val){
			$this.attr({"check_return":"false","placeholder":"请输入用户名"});
			return;
		}
		if(!usernameP.test(val)){
			$this.attr({"check_return":"false","placeholder":"请输入正确的用户名"});
			return;
		}
		$this.attr({"check_return":"true"});
	});
	
	$("body").delegate("[valid_null]","click propertychange input blur",function(){
		var $this = $(this);
		var val = getVal($this);
		if(!val){
			$this.attr({"check_return":"false","placeholder": $this.attr("placeholder")? $this.attr("placeholder") : "请输入"});
			return;
		}
		$this.attr({"check_return":"true"});
	});
	
	$("body").delegate("[valid_Y_M_H]","click propertychange input blur",function(){
		var $this = $(this);
		var val = getVal($this);
		if(!val){
			$this.attr({"check_return":"false","placeholder":"请输入日期(只包括年月日)"});
			return;
		}
		
		if(!ymh.test(val)){
			$this.attr({"check_return":"false","placeholder":"请输入正确的日期,例:2016-12-12"});
			return;
		}
		$this.attr({"check_return":"true"});
	});
}

function getVal(obj){
	
	var $this = $(obj);
	var isInput = isRightTag($this,"input");
	var val = $this.attr("value");
	if(isInput){
		val = $this.val();
	}else if(isRightTag($this,"textarea")){
		val = $this.val();
	}
	return val;
}

function isRightTag(obj,tagname){
	return $(obj).is(tagname);
	
}

function isIdCardNo(num){
//	var factorArr=new Array(7,9,10,5,8,4,2,1,6,3,7,9,10,5,8,4,2,1);
//	var parityBit=new Array("1","0","X","9","8","7","6","5","4","3","2");var varArray=new Array();
//	var lngProduct=0;var intCheckDigit;var intStrLen=num.length;var idNumber=num;if((intStrLen!=15)&&(intStrLen!=18))
//	{return false;}for(var i=0;i<intStrLen;i++){varArray[i]=idNumber.charAt(i);
//	if((varArray[i]<"0"||varArray[i]>"9")&&(i!=17))	{return false;}
//	else{if(i<17){varArray[i]=varArray[i]*factorArr[i];}}}if(intStrLen==18){var date8=idNumber.substring(6,14);
//	if(isDate8(date8)==false){return false;}for(var i=0;i<17;i++){lngProduct=lngProduct+varArray[i];}intCheckDigit=parityBit[lngProduct%11];
//	if(varArray[17]!=intCheckDigit){return false;}}else{var date6=idNumber.substring(6,12);
//	if(isDate6(date6)==false){return false;}}return true;
	//new rule
	//if((num.length!==15)&&(num.length!==18)){return false;}
	var val = $(".cardType").find(".my-value").find("label").attr("val") ;
	if("0" === val){//chinese mainland
		return /^(\d{15}$|^\d{18}$|^\d{17}(\d|X|x))$/.test(num) ;
	}else if("1" === val){//hong kong
		return /^[A-Za-z]\d{6}\(\d{1}\)$/.test(num) ;
	}else if("2" === val){//aomen
		return /^\d\/\d{6}\/\d$/.test(num) ;
	}else if("3" === val){//tai wan
		return /^[A-Za-z]\d{9}$/.test(num) ;
	}else if("4" === val){//passport
		return /^[A-Za-z]\d{8}$/.test(num) ;
	}
	return false ;
}