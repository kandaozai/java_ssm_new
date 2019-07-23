$(function() {
        $('.ul_1 >li').each(function() {
            $(this).hover(function() {
                $(this).addClass('hover_hot');
                $(this).find('.l_c').show().animate({
                    'bottom': '0px'
                }, 300);
            }, function() {
                $(this).find('.l_c').hide().animate({
                    'bottom': '-38px'
                }, 300);
                $(this).removeClass('hover_hot');
            });
        });
        $('.mall-ul > li').each(function() {
            $(this).hover(function() {
                $(this).animate({
                    paddingLeft: "30px"
                });
            }, function() {
                $(this).animate({
                    paddingLeft: "20px"
                });
            });
        });
    })
    //跳转
function openWindow(std) {
    if (std == 1) {
        window.location.href = '/login/login.html';
        return false;
    } else {
        window.location.href = '/login/reg.html';
        return false;
    }
}
//收货信息
function openduihuan(u_id, g_id) {
    layer.open({
        type: 1,
        move: '.layui-layer-title',
        title: ['收货信息', 'font-size:18px;', 'color:#333;'],
        area: ['400px', '420px'], //宽高
        offset: '120px',
        content: "<div class='dh-w'><table><tr><td colspan='2'><i class='shop_icon s_adress'></i><input type='text' name='s_adress' id='s_adress' class='form-control w300 pl40 mb30 brnone' placeholder='收货地址'><div class='address_error'></div></td></tr><tr><td colspan='2'><i class='shop_icon s_name'></i><input type='text' name='s_name' id='s_name' class='form-control w300 pl40 mb30 brnone' placeholder='收货人姓名'><div class='name_error'></div></td></tr><tr><td colspan='2'><i class='shop_icon s_phone'></i><input type='text' name='s_phone' id='s_phone' class='form-control w300 pl40 mb30 brnone' placeholder='电话'><div class='phone_error'></div></td></tr><tr><td colspan='2'><i class='shop_icon s_qq'></i><input type='text' name='s_qq' id='s_qq' class='form-control w300 pl40 mb30 brnone' placeholder='QQ'><div class='qq_error'></div></td></tr><tr><td colspan='2'><a href='javascript:;' class='s_btn' onclick='check_duihuan(" + u_id + "," + g_id + ")'>立即兑换</a></td></tr></table></div>"
    });
}
//兑换商品
function duihuan(gId) {
    //判断是否登录
    $.ajax({
        type: 'post',
        url: '/checkLogin.html',
        dataType: 'json',
        async: true,
        success: function(data) {
            if (data == "N") {
                layer.alert("请先登录", {
                    icon: 0,
                    title: '温馨提示'
                });
            } else {
                var u_id = data;
                openduihuan(u_id, gId);
            }
        }
    });
}
//验证收货信息  //保存兑换信息 saveOrder
function check_duihuan(u_id, g_id) {
    var user_id = u_id;
    var goods_id = g_id;
    var address = $('#s_adress').val(); //收货地址
    var name = $('#s_name').val(); //收货人姓名
    var phone = $('#s_phone').val(); //手机号码
    var qq = $('#s_qq').val(); //虚拟充值
    var code = $('#s_yanzheng').val(); //验证码
    var meg = /^1[34578]\d{9}$/; //正则验证手机号码
    if (address == '' || address == null) {
        $('.address_error').html("<i class='fa fa-exclamation colorerror error_i'></i>请输入收货地址&nbsp;&nbsp;");
        return false;
    }
    if (name == '' || name == null) {
        $('.name_error').html("<i class='fa fa-exclamation colorerror error_i'></i>&nbsp;请输入姓名&nbsp;&nbsp;");
        return false;
    }
    if (phone == '' || phone == null) {
        $('.phone_error').html("<i class='fa fa-exclamation colorerror error_i'></i>&nbsp;请输入手机号码&nbsp;&nbsp;");
        return false;
    } else if (!meg.test(phone)) {
        $('.phone_error').html("<i class='fa fa-exclamation colorerror error_i'></i>&nbsp;手机号码格式错误&nbsp;&nbsp;");
        return false;
    }
    if (qq == '' || qq == null) {
        $('.qq_error').html("<i class='fa fa-exclamation colorerror error_i'></i>&nbsp;请输入QQ号码&nbsp;&nbsp;");
        return false;
    }
    $.ajax({
        type: 'post',
        url: '/saveOrder.html',
        dataType: 'json',
        data: {
            user_id: u_id,
            goods_id: goods_id,
            address: address,
            realname: name,
            phone: phone,
            qq: qq,
            code: code
        },
        async: true,
        beforeSend: function() {
            loading = top.layer.load(2, {
                shade: [0.3, '#eee'] //0.1透明度的白色背景
            });
        },
        success: function(data) {
            console.log(data);
            if (data == "Y") {
                top.layer.close(loading);
                top.layer.msg('提交成功', {
                    icon: 1,
                    time: 2000
                }, function() {
                    top.layer.closeAll();
                });
                setTimeout("location=location;", 2000);
            } else {
                top.layer.close(loading);
                top.layer.msg(data, {
                    icon: 2,
                    time: 2000
                }, function() {
                    top.layer.closeAll();
                });
            }
        }
    });
}
//查询条件
var more = 1;
//
function getDate() {
    var info_G = $("#info_G").val();
    var url = "/market/prolist.html";
    var param = {
        more: more,
        sort: sort,
        option: info_G,
    };
    $.ajax({
        type: 'post',
        url: url,
        dataType: 'json',
        async: true,
        data: param,
        success: function(data) {
            successfn(data);
        }
    });
}

function successfn(rows) {
    var count = rows.count;
    rows = eval(rows.rows);
    newPages = Math.ceil(count / 8);
    if (pages != newPages) {
        pages = newPages;
        paginate(1);
    }
    if (rows.length > 0) {
        $("#goodsSel").html("");
        var str = '';
        for (var i = 0; i < rows.length; i++) {
            var e = rows[i];
            str = "<li> <a href='/index.php/market/proinfo/" + e.goods_id + ".html' target='_blank' class='img img_1'> <img src='" + e.goods_image + "' /> </a> <span class='l_c' style='display:none;'> <a class='a_1 mr30' onclick='duihuan(" + e.goods_id + ")'>立即兑换</a> <a class='a_2' href='/index.php/market/proinfo/" + e.goods_id + ".html' target='_blank'>查看详情</a> </span><div class='prd-des'><a href='" + e.goods_id + "' target='_blank'><p class='prd-name'>" + e.goods_name + "</p></a><p class='orange fz12 clearfix'> <span>积分：" + e.goods_price + "<i class='zuanshi'></i></span> <span>已兑换：" + e.buy_number + "个</span> </p></div></li>";
            if (((i + 1) % 4 != 0)) {
                str = "<li> <a href='/index.php/market/proinfo/" + e.goods_id + ".html' target='_blank' class='img img_1'> <img src='" + e.goods_image + "' /> </a> <span class='l_c' style='display:none;'> <a class='a_1 mr30' onclick='duihuan(" + e.goods_id + ")'>立即兑换</a> <a class='a_2' href='/index.php/market/proinfo/" + e.goods_id + ".html' target='_blank'>查看详情</a> </span><div class='prd-des'><a href='" + e.goods_id + "' target='_blank'><p class='prd-name'>" + e.goods_name + "</p></a><p class='orange fz12 clearfix'> <span>积分：" + e.goods_price + "<i class='zuanshi'></i></span> <span>已兑换：" + e.buy_number + "个</span> </p></div></li>";
            } else {
                str = "<li style='margin-right:0px;'> <a href='/index.php/market/proinfo/" + e.goods_id + ".html' target='_blank' class='img img_1'> <img src='" + e.goods_image + "' /> </a> <span class='l_c' style='display:none;'> <a class='a_1 mr30' onclick='duihuan(" + e.goods_id + ")'>立即兑换</a> <a class='a_2' href='/index.php/market/proinfo/" + e.goods_id + ".html' target='_blank'>查看详情</a> </span><div class='prd-des'><a href='" + e.goods_id + "' target='_blank'><p class='prd-name'>" + e.goods_name + "</p></a><p class='orange fz12 clearfix'> <span>积分：" + e.goods_price + "<i class='zuanshi'></i></span> <span>已兑换：" + e.buy_number + "个</span> </p></div></li>";
            }
            $("#goodsSel").append(str);
        }
        $('#goodsSel >li').each(function() {
            $(this).hover(function() {
                $(this).addClass('hover_hot');
                $(this).find('.l_c').show().animate({
                    'bottom': '0px'
                }, 300);
            }, function() {
                $(this).find('.l_c').hide().animate({
                    'bottom': '-38px'
                }, 300);
                $(this).removeClass('hover_hot');
            });
        });
    } else {
        $("#goodsSel").html('<div style="text-align:center;margin-top:10px;height:100%">暂无数据</div>');
    }
}

function formatNum1(num) {
    return parseFloat(num).toFixed(1);
}
var pages = {
    pages
};
//分页
function pagination(page) {
    //最多显示多少个页码
    var pageNum = 7;
    //当前页面小于1 则为1
    var page = page < 1 ? 1 : page;
    //加载数据
    more = page;
    getDate();
    //当前页大于总页数 则为总页数
    page = page > pages ? pages : page;
    //页数小当前页 则为当前页
    pages = pages < page ? page : pages;
    //计算开始页
    var start = page - parseInt(pageNum / 2);
    start = start < 1 ? 1 : start;
    //计算结束页
    var end = page + parseInt(pageNum / 2);
    end = end > pages ? pages : end;
    //当前显示的页码个数不够最大页码数，在进行左右调整
    var curPageNum = end - start + 1;
    //左调整
    if (curPageNum < pageNum && start > 1) {
        start = start - (pageNum - curPageNum);
        start = start < 1 ? 1 : start;
        curPageNum = end - start + 1;
    }
    //右边调整
    if (curPageNum < pageNum && end < pages) {
        end = end + (pageNum - curPageNum);
        end = end > pages ? pages : end;
    }
    var pageHtml = '<ul class="pagin">';
    pageHtml += '<li><a  title="首页" href="javascript:pagination(1);">首页</a></li>';
    if (page > 1) {
        var page0 = page - 1;
        pageHtml += '<li><a  title="上一页" href="javascript:pagination(' + page0 + ');">«</a></li>';
    }
    for (var i = start; i <= end; i++) {
        if (i == page) {
            pageHtml += '<li class="active"><a href="javascript:pagination(' + i + ');">' + i + '</a></li>';
        } else {
            pageHtml += '<li><a href="javascript:pagination(' + i + ');">' + i + '</a></li>';
        }
    }
    if (page < end) {
        var page1 = page + 1
        pageHtml += '<li><a  title="下一页" href="javascript:pagination(' + page1 + ');">»</a></li>';
    }
    pageHtml += '<li><a  title="末页" href="javascript:pagination(' + pages + ');">末页</a></li>';
    pageHtml += '</ul>';
    $("#page").html(pageHtml);
}
//
function paginate(page) {
    //最多显示多少个页码
    var pageNum = 7;
    //当前页面小于1 则为1
    var page = page < 1 ? 1 : page;
    //当前页大于总页数 则为总页数
    page = page > pages ? pages : page;
    //页数小当前页 则为当前页
    pages = pages < page ? page : pages;
    //计算开始页
    var start = page - parseInt(pageNum / 2);
    start = start < 1 ? 1 : start;
    //计算结束页
    var end = page + parseInt(pageNum / 2);
    end = end > pages ? pages : end;
    //当前显示的页码个数不够最大页码数，在进行左右调整
    var curPageNum = end - start + 1;
    //左调整
    if (curPageNum < pageNum && start > 1) {
        start = start - (pageNum - curPageNum);
        start = start < 1 ? 1 : start;
        curPageNum = end - start + 1;
    }
    //右边调整
    if (curPageNum < pageNum && end < pages) {
        end = end + (pageNum - curPageNum);
        end = end > pages ? pages : end;
    }
    var pageHtml = '<ul class="pagin">';
    pageHtml += '<li><a  title="首页" href="javascript:pagination(1);">首页</a></li>';
    if (page > 1) {
        var page0 = page - 1;
        pageHtml += '<li><a  title="上一页" href="javascript:pagination(' + page0 + ');">«</a></li>';
    }
    for (var i = start; i <= end; i++) {
        if (i == page) {
            pageHtml += '<li class="active"><a href="javascript:pagination(' + i + ');">' + i + '</a></li>';
        } else {
            pageHtml += '<li><a href="javascript:pagination(' + i + ');">' + i + '</a></li>';
        }
    }
    if (page < end) {
        var page1 = page + 1
        pageHtml += '<li><a  title="下一页" href="javascript:pagination(' + page1 + ');">»</a></li>';
    }
    pageHtml += '<li><a  title="末页" href="javascript:pagination(' + pages + ');">末页</a></li>';
    pageHtml += '</ul>';
    $("#page").html(pageHtml);
}
$(function() {
    var focusBanner = function() {
        var $focusBanner = $("#focus-banner"),
            $bannerList = $("#focus-banner-list li"),
            $focusHandle = $(".focus-handle"),
            $bannerImg = $(".focus-banner-img"),
            $nextBnt = $("#prev-img"),
            $prevBnt = $("#next-img"),
            $focusBubble = $("#focus-bubble"),
            bannerLength = $bannerList.length,
            _index = 0,
            _timer = "";
        var _height = $(".focus-banner-img").find("img").height();
        $focusBanner.height(_height);
        $bannerImg.height(_height);
        // $(window).resize(function(){
        //  window.location.reload()
        // });
        for (var i = 0; i < bannerLength; i++) {
            $bannerList.eq(i).css("zIndex", bannerLength - i);
            $focusBubble.append("<li></li>");
        }
        $focusBubble.find("li").eq(0).addClass("current");
        var bubbleLength = $focusBubble.find("li").length;
        $focusBubble.css({
            "width": bubbleLength * 22,
            "marginLeft": -bubbleLength * 11
        }); //初始化
        $focusBubble.on("click", "li", function() {
            $(this).addClass("current").siblings().removeClass("current");
            _index = $(this).index();
            changeImg(_index);
        }); //点击轮换
        $nextBnt.on("click", function() {
            _index++
            if (_index > bannerLength - 1) {
                _index = 0;
            }
            changeImg(_index);
        }); //下一张
        $prevBnt.on("click", function() {
            _index--
            if (_index < 0) {
                _index = bannerLength - 1;
            }
            changeImg(_index);
        }); //上一张
        function changeImg(_index) {
            $bannerList.eq(_index).fadeIn(250);
            $bannerList.eq(_index).siblings().fadeOut(200);
            $focusBubble.find("li").removeClass("current");
            $focusBubble.find("li").eq(_index).addClass("current");
            clearInterval(_timer);
            _timer = setInterval(function() {
                $nextBnt.click()　　
            }, 5000);
        } //切换主函数
        _timer = setInterval(function() {
            $nextBnt.click()
        }, 5000);
    }();
})
$(function() {
    $('.hot_list li,.tui_list li').each(function() {
        $(this).hover(function() {
            $(this).addClass('hover_hot');
            $(this).find('.l_c').show().animate({
                'bottom': '0px'
            }, 300);
        }, function() {
            $(this).find('.l_c').hide().animate({
                'bottom': '-38px'
            }, 300);
            $(this).removeClass('hover_hot');
        });
    });
    $('.tui_list li').eq(3).css('margin-right', '0px');
    $('.tui_list li').eq(7).css('margin-right', '0px');
});