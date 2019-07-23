$(function() {
    uaredirect("http://m.caiqi.com/");

    $('#weibo').hover(function() {
        $(this).addClass('weibo_h');
        $('.show_weibo').fadeIn(300);
    }, function() {
        $('.show_weibo').fadeOut(300);
        $(this).removeClass('weibo_h');
    });
    $('#qq').hover(function() {
        $(this).addClass('qq_h');
        $('.show_qq').fadeIn(300);
    }, function() {
        $('.show_qq').fadeOut(300);
        $(this).removeClass('qq_h');
    });
    $('#weixin').hover(function() {
        $(this).addClass('weixin_h');
        $('.show_weixin').fadeIn(300);
    }, function() {
        $('.show_weixin').fadeOut(300);
        $(this).removeClass('weixin_h');
    });
    $('.novice_list .clear-fix').each(function() {
        $(this).hover(function() {
            $(this).addClass('popo');
        }, function() {
            $(this).removeClass('popo');
        });
    });
    $('.novice_list1 .clear-fix1').each(function() {
        $(this).hover(function() {
            $(this).addClass('popo');
        }, function() {
            $(this).removeClass('popo');
        });
    });
    $('.spro_list .spro_box').each(function() {
        $(this).hover(function() {
            $(this).addClass('popo');
        }, function() {
            $(this).removeClass('popo');
        });
    });
    $('.view_wap').hover(function() {
        $('.web_wap').fadeIn(300);
    }, function() {
        $('.web_wap').fadeOut(300);
    });

    $('.hour_nr img').on('click',function(){
        var _url = $(this).attr('src');
        layer.open({
          type: 1,
          shade: false,
          title: false, //不显示标题
          area: ['750px', '350px'], //宽高
          content: "<div class='shows'><img src ='"+_url+"' width='700px' height='350px' /></div>", 
        });
    });

    /**
     * 登录界面背景轮换
     * @param url
     */
    var curDiv = $('.banner_list > div');
    index = 0;
    timer = null;
    timer = setInterval(starFocus, 5000);

    function starFocus() {
        index++;
        index = index > curDiv.size() - 1 ? 0 : index;
        curDiv.eq(index).stop().animate({
            'opacity': 1
        }, 500).css({
            'z-index': 10
        }).siblings().stop().animate({
            'opacity': 0
        }, 500).css({
            'z-index': 0
        })
    }

    function stopFocus() {
        clearInterval();
    }
    $('.futou_list > .futou_pro').hover(function() {
        $(this).addClass('hover_list').siblings().removeClass('hover_list');
    });
    opentop();
    kefu();
    shangwu();
    /**
     * 当前菜单高亮
     * @param url
     */
    var curHref = window.location.href.split('/').pop();
    $('.nav_list >ul >li a').each(function() {
        var _thisHref = $(this).attr('href');
        if (_thisHref.split('/').pop() === curHref) {
            $(this).parent('li').addClass('navCur');
        }
    });
});
/**
 * 打开url方式
 * @param url
 */
function openwin(url) {
    var a = document.createElement("a");
    a.setAttribute("href", url);
    a.setAttribute("target", "_blank");
    a.setAttribute("id", "openwin");
    document.body.appendChild(a);
    a.click();
}
/**
 *  在本页打开
 * @param url
 */
function openwin_self(url) {
    var a = document.createElement("a");
    a.setAttribute("href", url);
    a.setAttribute("target", "_self");
    a.setAttribute("id", "openwin");
    document.body.appendChild(a);
    a.click();
}
/**
 * 用户登录验证
 * @param 
 */
function login() {
    var input_user = $('#loginuser').val();
    var input_pwd = $('#loginpwd').val();
    var rule = /^1[34578]\d{9}$/;
    var params = $('input').serialize();
    if (input_user == '' || input_user == null) {
        $('#validateid').append("<div class='icon error'>请输入用户名！<div>");
        return false;
    }
    if (!(rule.test(input_user))) {
        $('#validateid').append("<div class='icon error'>请输入正确的手机号码！<div>");
        return false;
    }
    if (input_pwd == '' || input_pwd == null) {
        $('#validateid').append("<div class='icon error'>请输入密码！<div>");
        return false;
    }
    $.ajax({
        type: 'GET',
        url: '/login/check-login.html',
        dataType: 'json',
        async: true,
        data: params,
        success: function(msg) {
            if (msg == 0) {
                window.location.reload();
            } else {
                $('#validateid').append("<div class='icon error'>" + msg + "<div>");
            }
        }
    });
}

function phoneCheck() {
    var phone_num = $('#loginuser').val();
    var rule = /^1[34578]\d{9}$/;
    if (!(rule.test(phone_num))) {
        $('#validateid').append("<div class='icon error'>请输入正确的手机号码！<div>");
        return false;
    }
}
/**
 * 加入收藏
 * @param 
 */
function addBookmark() {
    var url = window.location;
    var title = document.title;
    var ua = navigator.userAgent.toLowerCase();
    if (ua.indexOf("360se") > -1) {
        alert("由于360浏览器功能限制，请按 Ctrl+D 手动收藏！");
    } else if (ua.indexOf("msie 8") > -1) {
        window.external.AddToFavoritesBar(url, title); //IE8
    } else if (document.all) {
        try {
            window.external.addFavorite(url, title);
        } catch (e) {
            alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
        }
    } else if (window.sidebar) {
        window.sidebar.addPanel(title, url, "");
    } else {
        alert('您的浏览器不支持,请按 Ctrl+D 手动收藏!');
    }
}
/**
 * qq好友
 * @param 
 */
function qq(url) {
    var p = {
        url: url,
        /*获取URL，可加上来自分享到QQ标识，方便统计*/
        desc: '财气网 理财返利第一站！网贷返利,p2p返利,国内首家金融返利平台！',
        /*分享理由(风格应模拟用户对话),支持多分享语随机展现（使用|分隔）*/
        title: '邀请好友获取返利',
        /*分享标题(可选)*/
        summary: '财气网',
        /*分享摘要(可选)*/
        pics: 'http://www.caiqi.com/favicon.ico',
        /*分享图片(可选)*/
        flash: '',
        /*视频地址(可选)*/
        site: '财气网',
        /*分享来源(可选) 如：QQ分享*/
        style: '201',
        width: 32,
        height: 32
    };
    var s = [];
    for (var i in p) {
        s.push(i + '=' + encodeURIComponent(p[i] || ''));
    }
    openwin(['http://connect.qq.com/widget/shareqq/index.html?', s.join('&'), ].join(''));
};
/**
 * qq空间
 * @param 
 */
function qzone(url) {
    var p = {
        url: url,
        showcount: '1',
        /*是否显示分享总数,显示：'1'，不显示：'0' */
        desc: '',
        /*默认分享理由(可选)*/
        summary: '',
        /*分享摘要(可选)*/
        title: '邀请好友获取返利--财气网 理财返利第一站！网贷返利,p2p返利,国内首家金融返利平台！',
        /*分享标题(可选)*/
        site: '财气网',
        /*分享来源 如：腾讯网(可选)*/
        pics: 'http://www.caiqi.com/favicon.ico',
        /*分享图片的路径(可选)*/
        style: '203',
        width: 98,
        height: 22
    };
    var s = [];
    for (var i in p) {
        s.push(i + '=' + encodeURIComponent(p[i] || ''));
    }
    openwin(['http://sns.qzone.qq.com/cgi-bin/qzshare/cgi_qzshare_onekey?', s.join('&'), ].join(''));
};
/**
 * 新浪微博
 * @param 
 */
function xinlang(url) {
    var p = {
        url: url,
        count: '',
        /* 表示是否显示当前页面被分享数量(1显示)(可选，允许为空) */
        appkey: '',
        /* 用于发布微博的来源显示，为空则分享的内容来源会显示来自互联网。(可选，允许为空) */
        title: '邀请好友获取返利--财气网 理财返利第一站！网贷返利,p2p返利,国内首家金融返利平台！',
        /* 分享时所示的文字内容，为空则自动抓取分享页面的title值(可选，允许为空) */
        pic: 'http://www.caiqi.com/favicon.ico',
        /* 自定义图片地址，作为微博配图(可选，允许为空) */
        ralateUid: '',
        /* 转发时会@相关的微博账号(可选，允许为空) */
        language: '',
        /* 语言设置(zh_cn|zh_tw)(可选) */
    };
    var s = [];
    for (var i in p) {
        s.push(i + '=' + encodeURIComponent(p[i] || ''));
    }
    openwin(['http://service.weibo.com/share/share.php?url=', s.join('&'), ].join(''));
};
/**
 * 微信
 * @param
 */
function weixin() {
    layer.open({
        type: 1,
        area: ['500px', '300px'],
        title: '分享到微信朋友圈',
        area: ['300px', '300px'],
        content: '<div style="text-align:center;padding-top:50px;"><img src="/frontend/web/static/img/fenxiang.png"/></div>'
    });

}
/**
 * 右侧浮动
 * @param 
 */
function opentop() {
    var topTop = "<li id = 'addtotop'><a class = 'flo_6' href='javascript:;'>返回顶部</a></li>"
    $(window).bind('scroll', function(event) {
        var topHeight = $(document).scrollTop();
        if (topHeight >= 200) {
            if ($("#toTopUl").find("#addtotop").length == 0) {
                $("#toTopUl").append(topTop);
                addtotop();
            } else {
                return;
            }
        } else {
            $("#toTopUl li:eq(5)").remove();
        }
    });
}
/**
 * 返回顶部
 * @param 
 */
function addtotop() {
    $("#addtotop").bind('click', function() {
        $("#toTopUl li:eq(5)").remove();
        $('html, body').animate({
            scrollTop: 0
        }, '1000');
        setTimeout('opentop()', 1000);
    });
}
/**
 * 显示二维码
 * @param 
 */
function showCode() {
    $(".erweima").show();
    $(".erweima").css("background", "url('/frontend/web/static/img/float_9.png') no-repeat");
}
/**
 * 隐藏二维码
 * @param 
 */
function hideCode() {
    $(".erweima").hide();
    $(".erweima").css("background", "");
}
/**
 * 客服
 * @param 
 */
function kefu() {
    $("#toTopUl li:eq(1),#kefu").bind("mouseover", function() {
        $("#kefu").css("display", "block");
    });
    $("#toTopUl li:eq(1),#kefu").bind("mouseout", function() {
        $("#kefu").css("display", "none");
    });
}

/**
 * 商务
 * @param 
 */
function shangwu() {
    $("#toTopUl li:eq(2),#shangwu").bind("mouseover", function() {
        $("#shangwu").css("display", "block");
    });
    $("#toTopUl li:eq(2),#shangwu").bind("mouseout", function() {
        $("#shangwu").css("display", "none");
    });
}
/**
 * 显示隐藏DIV
 * @param 
 */
function accoutChangeDiv(id) {
    if (!(id == "nickNameli")) {
        $("#nickNameli").fadeOut();
    }
    if (!(id == "userpasswordli")) {
        $("#userpasswordli").fadeOut();
    }
    if (!(id == "userEmailli")) {
        $("#userEmailli").fadeOut();
    }
    if (!(id == "userRenzhengli")) {
        $("#userRenzhengli").fadeOut();
    }
    if (!(id == "tradePasli")) {
        $("#tradePasli").fadeOut();
    }
    if (!(id == "userAddressli")) {
        $("#userAddressli").fadeOut();
    }
    $("#" + id).fadeToggle();
}
/**
 * 隐藏DIV
 * @param 
 */
function accoutShowDiv(id) {
    $("#" + id).fadeOut();
}



/**
 * 保存头像
 * @param 
 */
var image ="";

$(window).load(function() {
    var options = {
        thumbBox: '.thumbBox',
        spinner: '.spinner',
        imgSrc: ''
    }
    var cropper = $('.imageBox').cropbox(options);
    var img = "";
    $('#upload-file').on('change', function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            options.imgSrc = e.target.result;
            cropper = $('.imageBox').cropbox(options);
            //getImg();
        }
        reader.readAsDataURL(this.files[0]);
        this.files = [];
        getImg();
    })
    
    
    $('#btnCrop').on('click', function() {
    	/*alert("cs");*/
         image = cropper.getDataURL();
     
         $.ajax(
                 {
                     url:"/RebateMall_SSM/securityXXweb/cesss.do?",
                     data: {imagea:image},
                     dataType:"json",
                     type:"POST",
                    success:function(data)
                    {
                    //1.成功的处理
                     if (data.state == true) {
                        layer.msg("上传成功！");
                        //setTimeout('location.reload()',2000); //指定后 2秒刷新
        			                } else {
                         layer.msg("上传失败！");
                                  }
                     }
                   });
         
         
       
    })
    
  
    function getImg() {
        img = cropper.getDataURL();
        $('.cropped').html('');
        $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
        $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:128px;margin-top:4px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
        $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
    }
    $(".imageBox").on("mouseup", function() {
        getImg();
    });
    $('#btnZoomIn').on('click', function() {
        cropper.zoomIn();
    })
    $('#btnZoomOut').on('click', function() {
        cropper.zoomOut();
    })
});







/**
 * 消息中心-标记为已读
 * @param 
 */
function updateLook() {
    var item = $('.message_item')
}
/** 
 * 帮助中心-展开信息
 * @param
 */
function accoutHideDiv(id, le) {
    for (var i = 0; i < le; i++) {
        if (id != i) {
            $("#_bot_li" + i).find("i").attr("class", "fa fa-angle-down");
        }
    }
    if (document.getElementById("nickNameli" + id).style.display == 'none') {
        $("#_bot_li" + id).find("i").attr("class", "fa fa-angle-up");
    } else {
        document.getElementById("nickNameli" + id).style.display == 'list-item';
        $("#_bot_li" + id).find("i").attr("class", "fa fa-angle-down");
    }
    $("#nickNameli" + id).fadeToggle();
}

/**
 * 发帖前判断用户是否登录
 * @param
 */
function sendForum(id) {
    if (!id) {
        layer.open({
            title: "用户登录",
            type: 1,
            area: ['380px', '340px'], //宽高
            fix: false, //不固定
            maxmin: false,
            offset: 'auto',
            scrollbar: false,
            content: "<div class='up-w'>" +
                "<table style='margin: 0 auto;' align='center'><tr><td height='30px' class='text_seventeen' id='validateid'></td></tr>" +
                "<tr><td><i class='icon phone'></i><input class='in_15' type='text' placeholder='请输入手机号码' id='loginuser' name='loginuser' onblur='phoneCheck(this.value);'></td>	</tr>" +
                "<tr><td><i class='icon lock'></i><input class='in_15' type='password' id='loginpwd' name='loginpwd' placeholder='请输入密码'>	</td></tr>" +
                "<tr height='30px'><td class='rem-pass'><div style='float: left;'>	<input type='checkbox' onclick=''>记住账号	</div><div style='float: right;'><a target='_blank' href='/login/passwords.html' class='rem-pass'>忘记密码？</a>	</div></td>	</tr>" +
                "<tr><td height='60px'><a href='javascript:void(0);' onclick='login();' id='loginbtn' class='a24' style='padding: 10px 96px;'>立即登录</a>	</td></tr>" +
                "<tr><td height='15px'><div style='float: right;font-size:14px;'>	还没有注册<a target='_blank' href='/login/reg.html' class='flo-reg'>立即注册</a></div></td></tr></table></div>",
        });
    } else {
        window.location.href = '/forum/create.html';
    }
}
/**
 *我的投资组合
 * @param
 */
function myForumShare(id) {
    if (!id) {
        layer.open({
            title: "用户登录",
            type: 1,
            area: ['380px', '340px'], //宽高
            fix: false, //不固定
            maxmin: false,
            offset: 'auto',
            scrollbar: false,
            content: "<div class='up-w'>" +
                "<table style='margin: 0 auto;' align='center'><tr><td height='30px' class='text_seventeen' id='validateid'></td></tr>" +
                "<tr><td><i class='icon phone'></i><input class='in_15' type='text' placeholder='请输入手机号码' id='loginuser' name='loginuser' onblur='phoneCheck(this.value);'></td>    </tr>" +
                "<tr><td><i class='icon lock'></i><input class='in_15' type='password' id='loginpwd' name='loginpwd' placeholder='请输入密码'>   </td></tr>" +
                "<tr height='30px'><td class='rem-pass'><div style='float: left;'>  <input type='checkbox' onclick=''>记住账号  </div><div style='float: right;'><a target='_blank' href='/login/passwords.html' class='rem-pass'>忘记密码？</a> </div></td> </tr>" +
                "<tr><td height='60px'><a href='javascript:void(0);' onclick='login();' id='loginbtn' class='a24' style='padding: 10px 96px;'>立即登录</a>  </td></tr>" +
                "<tr><td height='15px'><div style='float: right;font-size:14px;'>   还没有注册<a target='_blank' href='/login/reg.html' class='flo-reg'>立即注册</a></div></td></tr></table></div>",
        });
    } else {
        window.location.href = '/forum/my-forum/'+id+'.html';
    }
}
/**
 * 我要投稿
 * @param
 */
function submission(userid, isauthor) {
    if (!userid) {
        layer.open({
            title: "用户登录",
            type: 1,
            area: ['380px', '340px'], //宽高
            fix: false, //不固定
            maxmin: false,
            offset: 'auto',
            scrollbar: false,
            content: "<div class='up-w'>" +
                "<table style='margin: 0 auto;' align='center'><tr><td height='30px' class='text_seventeen' id='validateid'></td></tr>" +
                "<tr><td><i class='icon phone'></i><input class='in_15' type='text' placeholder='请输入手机号码' id='loginuser' name='loginuser' onblur='phoneCheck(this.value);'></td>	</tr>" +
                "<tr><td><i class='icon lock'></i><input class='in_15' type='password' id='loginpwd' name='loginpwd' placeholder='请输入密码'>	</td></tr>" +
                "<tr height='30px'><td class='rem-pass'><div style='float: left;'>	<input type='checkbox' onclick=''>记住账号	</div><div style='float: right;'><a target='_blank' href='/login/passwords.html' class='rem-pass'>忘记密码？</a>	</div></td>	</tr>" +
                "<tr><td height='60px'><a href='javascript:void(0);' onclick='login();' id='loginbtn' class='a24' style='padding: 10px 96px;'>立即登录</a>	</td></tr>" +
                "<tr><td height='15px'><div style='float: right;font-size:14px;'>	还没有注册<a target='_blank' href='/login/reg.html' class='flo-reg'>立即注册</a></div></td></tr></table></div>",
        });
    } else {
        if (isauthor == 0) {
            window.location.href = '/forum-writer/apply-writer.html';
        } else {
            window.location.href = '/forum-writer/writer-column.html';
        }
    }
}

/**
 *申请成为专栏作者
 */
function authorApply(uid) {
    if (!uid) {
        layer.open({
            title: "用户登录",
            type: 1,
            area: ['380px', '340px'], //宽高
            fix: false, //不固定
            maxmin: false,
            offset: 'auto',
            scrollbar: false,
            content: "<div class='up-w'>" +
                "<table style='margin: 0 auto;' align='center'><tr><td height='30px' class='text_seventeen' id='validateid'></td></tr>" +
                "<tr><td><i class='icon phone'></i><input class='in_15' type='text' placeholder='请输入手机号码' id='loginuser' name='loginuser' onblur='phoneCheck(this.value);'></td>    </tr>" +
                "<tr><td><i class='icon lock'></i><input class='in_15' type='password' id='loginpwd' name='loginpwd' placeholder='请输入密码'>   </td></tr>" +
                "<tr height='30px'><td class='rem-pass'><div style='float: left;'>  <input type='checkbox' onclick=''>记住账号  </div><div style='float: right;'><a target='_blank' href='/login/passwords.html' class='rem-pass'>忘记密码？</a> </div></td> </tr>" +
                "<tr><td height='60px'><a href='javascript:void(0);' onclick='login();' id='loginbtn' class='a24' style='padding: 10px 96px;'>立即登录</a>  </td></tr>" +
                "<tr><td height='15px'><div style='float: right;font-size:14px;'>   还没有注册<a target='_blank' href='/login/reg.html' class='flo-reg'>立即注册</a></div></td></tr></table></div>",
        });
    } else {
        var val = $("#apply_content").val();
        if (val.length < 20) {
            layer.msg('请填写20字以上个人简介', { time: 2000 });
            return false;
        }
        $("#apply-form").submit();
    }
}