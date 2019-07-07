/***
 * 标题：Tab切换插件
 * 编写时间：2015年3月27号
 * 作者：斯迈欧
 * 邮箱：hhloyyhhl@qq.com
 * 工作室网站：http://www.agevisual.com/
 * version:jquery.TabSwitch.1.0
***/

(function ($) {
    $.fn.myTab = function (options) {
        return this.each(function () {
            var defaults = {
                operate: 'click',
                auto: true,
                time: 5000,
                delay: true,
                delayTime: 500
            }

            var opts = $.extend(defaults, options),
            self = $(this),
            items = self.children('.tabs_title').children('span'),
            tabBox = self.children('.tabs_con'),
            tabBoxItems = tabBox.children('.tab'),
            timer;

            var tabHandle = function (index) {
                items.siblings('span').removeClass('on').end().eq(index).addClass('on');
                tabBoxItems.siblings().hide().end().eq(index).fadeIn("slow")
            },

            delay = function (elem) {
                opts.delay ? setTimeout(function () { tabHandle(elem); }, opts.delayTime) : tabHandle(elem);
            },

            start = function () {
                if (!opts.auto) return;
                timer = setInterval(autoRun, opts.time);
            },

            autoRun = function () {
                var on = self.find('span.on'),
                    firstItem = items.eq(0),
                    len = items.length,
                    index = on.index() + 0,
                    item = index === len ? firstItem : on.next('span'),
                    i = index === len ? 0 : index;

                on.removeClass('on');
                item.addClass('on');
                tabBoxItems.siblings().hide().end().eq(i).fadeIn("slow")
            };

            items.bind(opts.operate, function () {
                var index = items.index($(this));
                delay(index)
            });

            if (opts.auto) {
                start();
                self.hover(function () {
                    clearInterval(timer);
                    timer = undefined;
                }, function () {
                    start();
                })
            }

        })
    }
})(jQuery)