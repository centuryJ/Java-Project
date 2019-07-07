(function (a) {
    loayLoad = function () {
        var bg = $('.jq_bg').find('p');
        var leng = bg.find('a img').length;
        for (var i = 0; i < leng; i++) {
            $('.jq_bg').find('p').eq(i).css({ 'background-image': 'url(' + bg.eq(i).find('a img').attr('src') + ')' }).hide();
        }
    }

    var nbs, index = 0;
    autoPlay = function (para) {
        var liCnt = $('.jq_list ul').find('li').length;
        var imgMaxLen = $('.jq_list ul').find('li').length; //banner图片总数
        var index = para % imgMaxLen; //自动播放的下标
        var listUl = $('.jq_list ul');
        var bg = $('.jq_bg').find('p');

        listUl.find('li').eq(index).addClass('on').siblings('li').removeClass('on');

        if ($.support.opacity && !$.support.style) {
            bg.eq(index).show().siblings('p').hide();
        } else {
            bg.eq(index).stop(true, true).fadeIn(600).siblings('p').stop(true, true).fadeOut(600);
        }

        index++;


        nbs = setTimeout("autoPlay('" + index + "')", 7000);
    }

    a.fn.banner = function () {
        var liLen = $('.jq_list ul').length;
        var uWidth = liLen * 240;
        var c = $('.jq_list ul'), bg = $('.jq_bg');
        var o = bg.find('p:eq(0)').find('a img').attr('src');
        var noAut;
        c.width(uWidth);

        loayLoad();
        autoPlay(index);


        bg.find('p:eq(0)').show().siblings('p').hide();

    

        c.find('li:eq(0)').addClass('on');

        c.find('li').mouseenter(function (e) {
            index = $(this).index();
            var url = bg.find('p').eq(index).find('a img').attr('src');

            $(this).addClass('on').siblings('li').removeClass('on');

            if ($.support.opacity  && !$.support.style) {
                bg.find('p').eq(index).show().siblings('p').hide();
            } else {
                bg.find('p').eq(index).stop(true, true).fadeIn(600).siblings('p').stop(true, true).fadeOut(600);
            }
            clearTimeout(nbs);
        });


        $('.idx_zt_box').mouseenter(function (e) {
            clearTimeout(nbs);
        });

        //离开盒子自动播放
        $('.idx_zt_box').mouseleave(function (e) {
            clearTimeout(nbs);
            nbs = setTimeout("autoPlay(" + index + ")", 7000);
        });

    }
    imgLoaded = function () { }
})(jQuery);