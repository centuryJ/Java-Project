$(function(){
	
		/*关闭弹层*/
		$("body").delegate(".wp-layer .wp-layer-exit","click",function(){
			$(this).closest(".wp-layer").hide();
			$(".layer-fixed").hide();
		});
		
		/*支持 placeholder*/
		$("input[type='text'],input[type='password']").placeholder();
		
		

		/*筛选 -更多*/
		$(".sl-ext").on("click",function(){
			var bool=$(this).parents(".sl-wrap").hasClass("extend");
			if(bool){
				$(this).parents(".sl-wrap").removeClass("extend");
				$(this).find("em").text("更多");
			}else{
				$(this).parents(".sl-wrap").addClass("extend");
				$(this).find("em").text("收起");
			}
			
		});
		
		/*单选*/
		$(document).bind("click",".my-radio label",function(event){
			var $this = $(event.target).closest("label");
			$this.closest(".my-radio").find('label').not(this).removeClass('my-radio-on');
			$this.addClass('my-radio-on');
		})
		/*多选*/
     	var evTimeStamp = 0;
		$(document).bind("click",".my-checkbox label",function(event){
			var $this = $(event.target).closest("label");
			if($this.hasClass('my-checkbox-on')==true){
				$this.removeClass('my-checkbox-on');
				}
			else {
				$this.addClass('my-checkbox-on');
				}
		});
		/*图片上传-删除操作*/
		$('.up-img-lst li').hover(function(){
			$(this).find('.up-img-b').show();
		},function(){
			$(this).find('.up-img-b').hide();
		})
		//调用幻灯片插件方法
		//$(".banner-box").flash();
		

})
	

//下拉组件
var baseSelect =
{
    resetSelect: function (e) {
        if (e == undefined) {
            //模拟下拉框
            $(".my-select").unbind("click").click(function () {
                if (!$(this).find(".my-option").is(":visible")) {
                    hideSelect($(".my-select"));
                    selectHander($(this));
                } else {
                    hideSelect($(".my-select"));
                    $(this).removeClass('my-on-select');
                }
            });
            //失去焦点时隐藏list
            $(document).click(function () {
                hideSelect($(".my-select"));
                $(".my-select").removeClass('my-on-select');
            })
            //阻止冒泡事件
            function evtStopPropa(e){
            	e ? e.stopPropagation() : event.cancelBubble = true;
            }
            $(".my-select").click(evtStopPropa);
            $(".my-option dd").unbind("click",evtStopPropa).click(evtStopPropa);

            //鼠标hover效果
            $(".my-option dd").hover(function () {
                $(this).css({color: "#eb8b00" });
            }, function () {
                $(this).css({color: "#2a3336" });
            });

            //鼠标点击效果
            $(".my-option dd").click(function () {
                hideSelect($(".my-select"));
                setValue($(this));
            });

        } else {
            //模拟下拉框
            $(e + " .my-select").unbind("click").click(function () {
                if (!$(this).find(".my-option").is(":visible")) {
                    hideSelect($(e + " .my-select"));
                    selectHander($(this));
                } else {
                    hideSelect($(e + " .my-select"));
                    $(this).removeClass('my-on-select');
                }
            });
            //失去焦点时隐藏list
            $(document).click(function () {
                hideSelect($(e + " .my-select"));
                $(e + " .my-select").removeClass('my-on-select');
            })
            //阻止冒泡事件
            $(e + " .my-select").click(function (e) {
                e ? e.stopPropagation() : event.cancelBubble = true;
            });
            $(e + " .my-option dd").unbind("click").click(function (e) {
                e ? e.stopPropagation() : event.cancelBubble = true;
            });

            //鼠标hover效果
            $(e + " .my-option dd").hover(function () {
                $(this).css({color: "#eb8b00" });
            }, function () {
                $(this).css({color: "#2a3336" });
            });

            //鼠标点击效果
            $(e + " .my-option dd").click(function () {
                hideSelect($(e + " .my-select"));
                setValue($(this));
            });

        }
    },
    resetSelect1: function (e) {
        if (e == undefined) {
            //模拟下拉框
            $(".my-select").unbind("click").click(function () {
                if (!$(this).find(".my-option").is(":visible")) {
                    hideSelect($(".my-select"));
                    selectHander($(this));
                } else {
                    hideSelect($(".my-select"));
                    $(this).removeClass('my-on-select');
                }
            });
            //失去焦点时隐藏list
            $(document).click(function () {
                hideSelect($(".my-select"));
                $(".my-select").removeClass('my-on-select');

            })
            //阻止冒泡事件
            $(".my-select").click(function (e) {
                e ? e.stopPropagation() : event.cancelBubble = true;
            });
            $(".my-option dd").unbind("click").click(function (e) {
                e ? e.stopPropagation() : event.cancelBubble = true;
            });

            //鼠标hover效果
            $(".my-option dd").hover(function () {
                $(this).css({color: "#eb8b00" });
            }, function () {
                $(this).css({color: "#2a3336" });
            });

            //鼠标点击效果
            $(".my-option dd").click(function () {
                hideSelect($(".my-select"));
                setValue1($(this));
            });
        } else {
            //模拟下拉框
            $(e + " .my-select").unbind("click").click(function () {
                if (!$(this).find(".my-option").is(":visible")) {
                    hideSelect($(e + " .my-select"));
                    selectHander($(this));
                } else {
                    hideSelect($(e + " .my-select"));
                    $(this).removeClass('my-on-select');
                }
            });
            //失去焦点时隐藏list
            $(document).click(function () {
                hideSelect($(e + " .my-select"));
                $(e + " .my-select").css({ zIndex: "1" });
            })
            //阻止冒泡事件
            $(e + " .my-select").click(function (e) {
                e ? e.stopPropagation() : event.cancelBubble = true;
            });
            $(e + " .my-option dd").unbind("click").click(function (e) {
                e ? e.stopPropagation() : event.cancelBubble = true;
            });

            //鼠标hover效果
            $(e + " .my-option dd").hover(function () {
                $(this).css({color: "#eb8b00" });
            }, function () {
                $(this).css({color: "#2a3336" });
            });

            //鼠标点击效果
            $(e + " .my-option dd").click(function () {
                hideSelect($(e + " .my-select"));
                setValue1($(this));
            });
        }
    }
}

$(function () {
    baseSelect.resetSelect();
});

function hideSelect(val) {
    $('.my-option>dl').height('');
    val.find(".my-option").hide();
    $(".my-select").removeClass('my-on-select');
}

function selectHander(tar) {
    tar.find(".my-option").show();
    if (tar.find(".my-option dl").height() > 184) {
        tar.find(".my-option dl").height(184);
    }
    tar.addClass('my-on-select');
    //ie6下宽度-2像素
}

function setValue(e) {
	var txt = e.text();
    var val = e.attr("value");
    var label = e.parents(".my-select").find("label");
    var input = e.parents(".my-select").find("input");

    if (input.length == 0) {
        label.text(txt);
        label.attr("val", val);
    } else {
        label.text(txt);
        input.val(val);
    }


}
//幻灯片插件方法
$(function(){
	if($('#slides').length>0){
		$('#slides').slides({
			preload: true,
			preloadImage: '../images/loading.gif',
			play: 5000,
			pause: 2500,
			hoverPause: true,
			/*
			animationStart: function(){
				$('.caption').animate({
					bottom:-92
				},100);
			},
			*/
			animationComplete: function(current){
				$('.caption').animate({
					bottom:0
				},200);
				if (window.console && console.log) {
					// example return of current slide number
					console.log(current);
				};
			}
		});
	}
});
(function($,window,document){
	//弹窗信息
	$.alert = function(msg){
		var $ai = $(".a-info") ;
		if($ai.length){
			$ai.show().find("h4").html(msg) ;
			return ;
		}
		var html = "<div class='wp-layer qz_layer a-info' style='width: 400px; margin-left: -231px; margin-top: -152px; top: 50%; position: fixed;'>" +
			"<div class='wp-layer-tit'>" +
			"<h3>提示</h3>" +
			"<a href='javascript:;' class='wp-layer-exit qz_layer_close'><span>关闭</span></a></div>" +
			"<div class='wp-layer-cnt'>" +
			"<div class='lay-frm-box'>" +
			"<div class='tip-cjcg'>" +
			"<h4>"+msg+"</h4></div>" +
			"<div class='tac' style='margin-top:10px;'><a href='javascript:;' class='btn-blue-sml qz_layer_suer'><span>确定</span></a></div></div></div></div>"
		$("body").append(html) ;
		$(".a-info").on("click",".qz_layer_suer,.qz_layer_close",function(){
			$(".a-info").hide() ;
		}) ;
	}
})(jQuery,window,document) ;
