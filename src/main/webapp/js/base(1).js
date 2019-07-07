/** AJAX请求未登录返回值*/
QZ_NOT_LOGIN = "999992";
/** AJAX请求重复登陆返回值*/
QZ_LOGIN_REPEAT = "999991";

/** 手机号码验证表达式*/
PHONE_PATTERN = /^(((1[3|4|5|6|7|8|9][0-9]{1})|(15[0-9]{1}))+\d{8})$/;
/** 座机号码验证表达式*/
TEL_PATTERN = /^(0[0-9]{2,3}-)?([2-9][0-9]{6,7})+(-[0-9]{1,4})?$/;
/** 邮箱验证表达式*/
EMAIL_PATTERN=/^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/;
/** 汉字验证表达式*/
CHINESE_PATTERN =/^[\u4e00-\u9fa5]+$/;
/** ??? */
ILLEGAL_PATTERN=/^(?:[\u4e00-\u9fa5]*\w*\s*)+$/;
/** 数字验证表达式*/
NUMBER_PATTERN=/^[0-9]+$/;
/** 数字字母表达式*/
NUM_EN_PATTERN = /^[A-Za-z0-9]+$/;
/** 融云表情表达式 */
EMOJI_PATTERN = /\[[^\[\]\s]+?\]/g;

seajs.config({
	alias:{
		'qzAjax':'/script/lib/qz_ajax.js',
		'qzValidate':'/script/lib/qz_validate.js',
		'qzStrUtil':'/script/lib/qz_strUtil.js',
		'qzDateUtil':'/script/lib/qz_dateUtil.js',
		"qzAlert":"/script/lib/qz_alert_layer.js",
		"qzDownload":"/script/lib/qz_download.js"
	},
	base:'/script/seajs/sea.js'
});


