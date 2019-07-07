/*
 * ·ÖÒ³²å¼þ
 * ËùÐèjquery×îµÍ°æ±¾Îª1.4.2
 * @×÷Õß Gabriel Birke (birke *at* d-scribe *dot* de)
 * @ ·­Òë£º³¾ÐõÔµ  qq:80213876   http://blog.csdn.net/luoyeyu1989         .netÍøÕ¾ÖÆ×÷£¬É¾Ìû×Ó£¬seoÓÅ»¯¡£ http://www.89nian.com
 * @2011-11-22
 * @°æ±¾ 2.2
 * @ÏêÏ¸²ÎÊý¼ûreadme.txt
 */
 (function($){
	/**
	 * @¼ÆËã·ÖÒ³ÖµµÄclassÀà
	 */
	$.PaginationCalculator = function(maxentries, opts) {
		this.maxentries = maxentries;
		this.opts = opts;
	};
	
	$.extend($.PaginationCalculator.prototype, {
		/**
		 * ¼ÆËã×ÜÒ³Êý
		 * @·µ»Ø {Number}
		 */
		numPages:function() {
			return Math.ceil(this.maxentries/this.opts.items_per_page);
		},
		/**
		 * ¼ÆËã¿ªÊ¼ºÍ½áÊøµãµÄ·ÖÒ³
		 * µ±Ç°Ò³ÂëÊýºÍÒªÏÔÊ¾µÄÒ³Âë
		 * @·µ»ØÊý×é {Array}
		 */
		getInterval:function(current_page)  {
			var ne_half = Math.floor(this.opts.num_display_entries/2);
			var np = this.numPages();
			var upper_limit = np - this.opts.num_display_entries;
			var start = current_page > ne_half ? Math.max( Math.min(current_page - ne_half, upper_limit), 0 ) : 0;
			var end = current_page > ne_half?Math.min(current_page+ne_half + (this.opts.num_display_entries % 2), np):Math.min(this.opts.num_display_entries, np);
			return {start:start, end:end};
		}
	});
	
	// ³õÊ¼»¯·ÖÒ³µÄjqueryÈÝÆ÷¶ÔÏó
	$.PaginationRenderers = {};
	
	/**
	 * @äÖÈ¾·ÖÒ³Á´½ÓµÄÀà
	 */
	$.PaginationRenderers.defaultRenderer = function(maxentries, opts) {
		this.maxentries = maxentries;
		this.opts = opts;
		this.pc = new $.PaginationCalculator(maxentries, opts);
	};
	$.extend($.PaginationRenderers.defaultRenderer.prototype, {
		/**
		 * Éú³ÉÒ»¸öµ¥¶ÀµÄÁ´½ÓµÄº¯Êý£¨Èç¹ûÊÇµ±Ç°Ò³£¬ÔòÉú³Éspan±êÇ©£©
		 * @²ÎÊý {Number} page_id £ºÐÂÒ³µÄÒ³Âë
		 * @²ÎÊý {Number}current_page £ºµ±Ç°Ò³Ò³Âë
		 * @²ÎÊý {Object} appendopts £ºÐÂÒ³µÄoptions£ºÎÄ±¾ºÍÀà
		 * @·µ»Ø {jQuery} £º°üº¬Á´½ÓµÄjquery¶ÔÏó
		 */
		createLink:function(page_id, current_page, appendopts){
			var lnk, np = this.pc.numPages();
			page_id = page_id<0?0:(page_id<np?page_id:np-1); 
			appendopts = $.extend({text:page_id+1, classes:""}, appendopts||{});
			if(page_id == current_page){
                var on = appendopts.classes.indexOf("pg_pre")==-1 && appendopts.classes.indexOf("pg_nxt")==-1;
                if(on) {
                    lnk = $("<a class='on'>" + appendopts.text + "</a>")
                        .attr('href', 'javascript:void(0)');
                }else{
				    lnk = $("<span class='current'>" + appendopts.text + "</span>");
                }
			}
			else
			{
				lnk = $("<a>" + appendopts.text + "</a>")
					.attr('href', this.opts.link_to.replace(/__id__/,page_id));
			}
			if(appendopts.classes){ lnk.addClass(appendopts.classes); }
			lnk.data('page_id', page_id);
			return lnk;
		},
		// Éú³ÉÊý×Ö·¶Î§ÄÚµÄÒ³ÂëÁ´½Ó
		appendRange:function(container, current_page, start, end, opts) {
			var i;
			for(i=start; i<end; i++) {
				this.createLink(i, current_page, opts).appendTo(container);
			}
		},
		getLinks:function(current_page, eventHandler) {
			var begin, end,
				interval = this.pc.getInterval(current_page),
				np = this.pc.numPages(),
				fragment = $("<div class='pagination pg_lst'></div>");
			
			// Éú³É¡°ÉÏÒ»Ò³¡±µÄÁ´½Ó
			if(this.opts.prev_text && (current_page > 0 || this.opts.prev_show_always)){
				fragment.append(this.createLink(current_page-1, current_page, {text:this.opts.prev_text, classes:"prev pg_pre"}));
			}
			// ¿ªÊ¼Ïî
			if (interval.start > 0 && this.opts.num_edge_entries > 0)
			{
				end = Math.min(this.opts.num_edge_entries, interval.start);
				this.appendRange(fragment, current_page, 0, end, {classes:'sp'});
				if(this.opts.num_edge_entries < interval.start && this.opts.ellipse_text)
				{
					jQuery("<span class='pg_oth'>"+this.opts.ellipse_text+"</span>").appendTo(fragment);
				}
			}
			// Á´½ÓÖ®¼äµÄ¼ä¸ô
			this.appendRange(fragment, current_page, interval.start, interval.end);
			// ½áÊøµã
			if (interval.end < np && this.opts.num_edge_entries > 0)
			{
				if(np-this.opts.num_edge_entries > interval.end && this.opts.ellipse_text)
				{
					jQuery("<span>"+this.opts.ellipse_text+"</span>").appendTo(fragment);
				}
				begin = Math.max(np-this.opts.num_edge_entries, interval.end);
				this.appendRange(fragment, current_page, begin, np, {classes:'ep'});
				
			}
			// ¡°ÏÂÒ»Ò³¡±Á´½Ó
			if(this.opts.next_text && (current_page < np-1 || this.opts.next_show_always)){
				fragment.append(this.createLink(current_page+1, current_page, {text:this.opts.next_text, classes:"next pg_nxt"}));
			}
			$('a', fragment).click(eventHandler);
			return fragment;
		}
	});
	
	// jqueryÀ©Õ¹
	$.fn.pagination = function(maxentries, opts){
		
		//³õÊ¼»¯OptionsµÄÄ¬ÈÏÖµ
		opts = jQuery.extend({
			items_per_page:10,
			num_display_entries:11,
			current_page:0,
			num_edge_entries:0,
			link_to:"#",
			prev_text:"Prev",
			next_text:"Next",
			ellipse_text:"...",
			prev_show_always:true,
			next_show_always:true,
			renderer:"defaultRenderer",
			load_first_page:false,
			callback:function(){return false;}
		},opts||{});
		
		var containers = this,
			renderer, links, current_page;
		
		/**
		 * ·ÖÒ³Á´½ÓÊÂ¼þ´¦Àíº¯Êý
		 * @²ÎÊý {int} page_id £ºÐÂµÄÒ³Âë
		 */
		function paginationClickHandler(evt){
			var links, 
				new_current_page = $(evt.target).data('page_id'),
				continuePropagation = selectPage(new_current_page);
			if (!continuePropagation) {
				evt.stopPropagation();
			}
			return continuePropagation;
		}
		
		/**
		 * ÄÚ²¿ÊÂ¼þ´¦Àíº¯Êý
		 * ÔÚ·ÖÒ³ÈÝÆ÷¶ÔÏóÉÏÉèÖÃÐÂµÄ·ÖÒ³
		 * ¸ù¾Ý·ÖÒ³Á´½ÓºÍ»Øµ÷Éú³ÉÐÂµÄhtml
		 * »Øµ÷º¯Êý
		 */
		function selectPage(new_current_page) {
			// ¸üÐÂÈÝÆ÷ÖÐµÄËùÓÐÁ´½ÓÏÔÊ¾
			containers.data('current_page', new_current_page);
			links = renderer.getLinks(new_current_page, paginationClickHandler);
			containers.empty();
			links.appendTo(containers);
			// Èç¹û·µ»Øtrue£¬Ôòµ÷ÓÃ»Øµ÷º¯ÊýÒÔ¼°Ò»Ð©ÊÂ¼þ¡£
			var continuePropagation = opts.callback(new_current_page, containers);
			return continuePropagation;
		}
		
		// -----------------------------------
		// ·ÖÒ³ÈÝÆ÷³õÊ¼»¯
		// -----------------------------------
		current_page = opts.current_page;
		containers.data('current_page', current_page);
		// Îª maxentries ºÍ items_per_page¸³Öµ
		maxentries = (!maxentries || maxentries < 0)?1:maxentries;
		opts.items_per_page = (!opts.items_per_page || opts.items_per_page < 0)?1:opts.items_per_page;
		
		if(!$.PaginationRenderers[opts.renderer])
		{
			throw new ReferenceError("Pagination renderer '" + opts.renderer + "' was not found in jQuery.PaginationRenderers object.");
		}
		renderer = new $.PaginationRenderers[opts.renderer](maxentries, opts);
		
		// ¸øÏàÓ¦µÄdomÔªËØ°ó¶¨ÊÂ¼þ
		var pc = new $.PaginationCalculator(maxentries, opts);
		var np = pc.numPages();
		containers.bind('setPage', {numPages:np}, function(evt, page_id) { 
				if(page_id >= 0 && page_id < evt.data.numPages) {
					selectPage(page_id); return false;
				}
		});
		containers.bind('prevPage', function(evt){
				var current_page = $(this).data('current_page');
				if (current_page > 0) {
					selectPage(current_page - 1);
				}
				return false;
		});
		containers.bind('nextPage', {numPages:np}, function(evt){
				var current_page = $(this).data('current_page');
				if(current_page < evt.data.numPages - 1) {
					selectPage(current_page + 1);
				}
				return false;
		});
		
		// µ±ËùÓÐµÄ³õÊ¼»¯Íê³Éºó£¬ÊäÈëÁ´½Ó
		links = renderer.getLinks(current_page, paginationClickHandler);
		containers.empty();
		links.appendTo(containers);
		// »Øµ÷º¯Êý
		if(opts.load_first_page) {
			opts.callback(current_page, containers);
		}
	}; // ·ÖÒ³²å¼þ½áÊø
	
})(jQuery);

 
 /**
  * YUWU
  * 2014-08-26
  * 方法用于跳转页面后需要马上初始化分页对象
  * pageId 分页DIV的ID。示例：<div class="page" id="orderPagination"></div>,这里pageId = "orderPagination"
  * callbackFun 回调函数，包含两个参数{page_index:"当前页码", pagination_container,"分页DIV的ID"}。示例：function currecyCallBack(page_index, pagination_container){}
  * totalCount 总共记录
  * currentPage 当前页码
  * countOfCurrentPage 每页多少条记录
  */
function initPagination5(pageId,callbackFun,totalCount,currentPage,countOfCurrentPage,totalPage){
	//少于两页不需要展示分页
	if(totalPage < 2){
		$("#" + pageId).hide();
		return;
	}else{
		$("#" + pageId).show();
	}
	$("#" + pageId).pagination(totalCount, {
 	    next_text:"<",
 	    prev_text:">",
 	    num_display_entries:5,
 	    num_edge_entries:1,
 	    current_page:currentPage-1,
 	    link_to:"javascript:void(0);",
 	    items_per_page:countOfCurrentPage, //pageSize每页最多显示多少条
 	    callback:callbackFun
 	});
 }
  /**
   * YUWU
   * 2014-08-26
   * 方法用于在页面点击按钮，AJAX请求数据后初始化分页对象
   * pageId 分页DIV的ID。示例：<div class="page" id="orderPagination"></div>,这里pageId = "orderPagination"
   * callbackFun 回调函数，包含两个参数{page_index:"当前页码", pagination_container,"分页DIV的ID"}
   * pageInfo 分页对象，后台PageInfoExt对象
   */
function initPagination3(pageId,callbackFun,pageInfo){
	//少于两页不需要展示分页
	if(pageInfo.totalPage < 2){
		$("#" + pageId).hide();
		return;
	}else{
		$("#" + pageId).show();
	}
  	$("#" + pageId).pagination(pageInfo.totalCount, {
  	    next_text:">",
  	    prev_text:"<",
  	    num_display_entries:5,
  	    num_edge_entries:1,
  	    current_page:pageInfo.currentPage-1,
  	    link_to:"javascript:void(0);",
  	    items_per_page:pageInfo.countOfCurrentPage, //pageSize每页最多显示多少条
  	    callback:callbackFun
  	});
 }