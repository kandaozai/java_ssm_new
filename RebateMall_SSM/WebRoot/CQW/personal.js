/**
 *查询平台标的
 */
function platChange() {
    var platId = $("#investrepair-plat_id").val();
    $.ajax({
        type: 'post',
        url: 'product-select.html',
        dataType: 'json',
        async: true,
        data: { plat_id: platId },
        success: function(data) {
            var product_arr = eval(data);
            var html = "";
            if (product_arr.length == 0) {
                layer.msg("<i class='fa fa-close'></i>该平台没有在线标的");
                return;
            }
            for (var i = 0; i < product_arr.length; i++) {
                html += '<option value="' + product_arr[i]["PLAN_ID"] + '">' + product_arr[i]["PLAN_NAME"] + '</option>';
            }
            $("#plan").html(html);
        }
    });
    selectCoupon();
}

/*选择加息券*/
function selectCoupon() {
    var plat_id = $('#investrepair-plat_id').val();
    var invest_amount = $('#invest_amount').val();
    $('#coupon').html('');
    for (var i = 0; i < coupon.length; i++) {
        var platArray = coupon[i]['COUPON_PLAT'].split(',');
        if ( $.inArray(plat_id,platArray) > -1) {
            var option = "<option value="+coupon[i]['COUPON_ID']+">"+coupon[i]['COUPON_NAME']+"-"+coupon[i]['COUPON_TIME']+"</option>"
            $('#coupon').append(option);
        }
        if ( coupon[i]['COUPON_PLAT'] == 0 || coupon[i]['COUPON_PLAT'] == '') {
            var option = "<option value="+coupon[i]['COUPON_ID']+">"+coupon[i]['COUPON_NAME']+"-"+coupon[i]['COUPON_TIME']+"</option>"
            $('#coupon').append(option);
        }
    };
}

/**
 *设置昵称
 */
function saveNickName() {
    var nick_name = $("#accountEditNickName").val();
    if (nick_name == '') {
        layer.msg("<i class='fa fa-close'></i> 请填写昵称");
        return;
    }
    $.ajax({
        type: 'post',
        url: 'edit-user.html',
        dataType: 'json',
        data: { NICK_NAME: nick_name },
        success: function(data) {
            if (data) {
                window.location.reload();
            } else {
                layer.msg("<i class='fa fa-close'></i> 设置失败，请稍后重试");
            }
        }
    })
}
/**
 *设置昵称
 */
function saveUserbrief() {
    var userbrief = $("#userbriefs").val();
    if (userbrief == '') {
        layer.msg("<i class='fa fa-close'></i> 请填写简介");
        return;
    }
    $.ajax({
        type: 'post',
        url: 'user-brief.html',
        dataType: 'json',
        data: { BRIEF: userbrief },
        success: function(data) {
            if (data) {
                window.location.reload();
            } else {
                layer.msg("<i class='fa fa-close'></i> 设置失败，请稍后重试");
            }
        }
    })
}
/**
 *绑定邮箱
 */
function saveEmail() {
    var email = $("#email").val();
    if (email.length < 5) {
        layer.msg("<i class='fa fa-close'></i> 请填写正确邮箱");
        return;
    }
    $.ajax({
        type: 'post',
        url: 'edit-user.html',
        dataType: 'json',
        data: { EMAIL: email },
        success: function(data) {
            if (data) {
                window.location.reload();
            } else {
                layer.msg("<i class='fa fa-close'></i> 设置失败，请填写正确邮箱或稍后重试");
            }
        }
    })
}
/**
 *地址
 */
function saveAddress() {
    var address = $("#address").val();
    if (address == '') {
        layer.msg("<i class='fa fa-close'></i> 请填写地址");
        return;
    }
    $.ajax({
        type: 'post',
        url: 'edit-user.html',
        dataType: 'json',
        data: { ADDRESS: address },
        success: function(data) {
            if (data) {
                window.location.reload();
            } else {
                layer.msg("<i class='fa fa-close'></i> 设置失败，请稍后重试");
            }
        }
    })
}
/**
 *实名
 */
function saveRealInfo() {
    var user_name = $("#user_name").val();
    var identity = $("#identity").val();
    if (user_name == '') {
        layer.msg("<i class='fa fa-close'></i> 请填写姓名");
        return;
    } else {
        user_name = user_name.replace(/[^\u4e00-\u9fa5|,]+/g, '');
    }
    if (identity == '') {
        layer.msg("<i class='fa fa-close'></i> 请填写身份证号");
        return;
    }
    if (checkCard() === false) {
        return false;
    }
    $.ajax({
        type: 'post',
        url: 'edit-user.html',
        dataType: 'json',
        data: { USER_NAME: user_name, IDENTITY: identity },
        success: function(data) {
            if (data) {
                window.location.reload();
            } else {
                layer.msg("<i class='fa fa-close'></i> 设置失败，请稍后重试");
            }
        }
    })

}
var vcity = {
    11: "北京",
    12: "天津",
    13: "河北",
    14: "山西",
    15: "内蒙古",
    21: "辽宁",
    22: "吉林",
    23: "黑龙江",
    31: "上海",
    32: "江苏",
    33: "浙江",
    34: "安徽",
    35: "福建",
    36: "江西",
    37: "山东",
    41: "河南",
    42: "湖北",
    43: "湖南",
    44: "广东",
    45: "广西",
    46: "海南",
    50: "重庆",
    51: "四川",
    52: "贵州",
    53: "云南",
    54: "西藏",
    61: "陕西",
    62: "甘肃",
    63: "青海",
    64: "宁夏",
    65: "新疆",
    71: "台湾",
    81: "香港",
    82: "澳门",
    91: "国外"
};
checkCard = function() {
    var card = $("#identity").val();
    //是否为空
    if (card === '') {
        layer.alert("身份证号不能为空", { icon: 2, time: 1000 });
        return false;
    }
    //校验长度，类型
    if (isCardNo(card) === false) {
        layer.alert("身份证号码不正确", { icon: 2, time: 1000 });
        return false;
    }
    //检查省份
    if (checkProvince(card) === false) {
        layer.alert("身份证号码不正确", { icon: 2, time: 1000 });
        return false;
    }
    //校验生日
    if (checkBirthday(card) === false) {
        layer.alert("身份证号码不正确", { icon: 2, time: 1000 });
        return false;
    }
    //检验位的检测
    if (checkParity(card) === false) {
        layer.alert("身份证号码不正确", { icon: 2, time: 1000 });
        return false;
    }
    return true;
};


//检查号码是否符合规范，包括长度，类型
isCardNo = function(card) {
    //身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X
    var reg = /(^\d{15}$)|(^\d{17}(\d|X)$)/;
    if (reg.test(card) === false) {
        return false;
    }

    return true;
};

//取身份证前两位,校验省份
checkProvince = function(card) {
    var province = card.substr(0, 2);
    if (vcity[province] == undefined) {
        return false;
    }
    return true;
};

//检查生日是否正确
checkBirthday = function(card) {
    var len = card.length;
    //身份证15位时，次序为省（3位）市（3位）年（2位）月（2位）日（2位）校验位（3位），皆为数字
    if (len == '15') {
        var re_fifteen = /^(\d{6})(\d{2})(\d{2})(\d{2})(\d{3})$/;
        var arr_data = card.match(re_fifteen);
        var year = arr_data[2];
        var month = arr_data[3];
        var day = arr_data[4];
        var birthday = new Date('19' + year + '/' + month + '/' + day);
        return verifyBirthday('19' + year, month, day, birthday);
    }
    //身份证18位时，次序为省（3位）市（3位）年（4位）月（2位）日（2位）校验位（4位），校验位末尾可能为X
    if (len == '18') {
        var re_eighteen = /^(\d{6})(\d{4})(\d{2})(\d{2})(\d{3})([0-9]|X)$/;
        var arr_data = card.match(re_eighteen);
        var year = arr_data[2];
        var month = arr_data[3];
        var day = arr_data[4];
        var birthday = new Date(year + '/' + month + '/' + day);
        return verifyBirthday(year, month, day, birthday);
    }
    return false;
};

//校验日期
verifyBirthday = function(year, month, day, birthday) {
    var now = new Date();
    var now_year = now.getFullYear();
    //年月日是否合理
    if (birthday.getFullYear() == year && (birthday.getMonth() + 1) == month && birthday.getDate() == day) {
        //判断年份的范围（3岁到100岁之间)
        var time = now_year - year;
        if (time >= 3 && time <= 100) {
            return true;
        }
        return false;
    }
    return false;
};

//校验位的检测
checkParity = function(card) {
    //15位转18位
    card = changeFivteenToEighteen(card);
    var len = card.length;
    if (len == '18') {
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
        var cardTemp = 0,
            i, valnum;
        for (i = 0; i < 17; i++) {
            cardTemp += card.substr(i, 1) * arrInt[i];
        }
        valnum = arrCh[cardTemp % 11];
        if (valnum == card.substr(17, 1)) {
            return true;
        }
        return false;
    }
    return false;
};

//15位转18位身份证号
changeFivteenToEighteen = function(card) {
    if (card.length == '15') {
        var arrInt = new Array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);
        var arrCh = new Array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');
        var cardTemp = 0,
            i;
        card = card.substr(0, 6) + '19' + card.substr(6, card.length - 6);
        for (i = 0; i < 17; i++) {
            cardTemp += card.substr(i, 1) * arrInt[i];
        }
        card += arrCh[cardTemp % 11];
        return card;
    }
    return card;
};

/**
 *更改信息查看状态
 */
function messageLooked(id) {
    $.ajax({
        type: 'post',
        url: 'message-looked.html',
        dataType: 'json',
        data: { MES_ID: id },
        success: function(data) {
            layer.msg('更新成功');
            window.location.reload()
        }
    })
}

/**
 *发送验证码
 */
function sendMsg(mobile, type) {
    var randcode = $("#incode").val();
    if (randcode.length != 4) {
        layer.msg("输入有误");
        return false;
    }
    $.ajax({
        type: 'get',
        url: '/login/send-message.html',
        dataType: 'json',
        data: { mobile: mobile, type: type ,incode:randcode},
        success: function(data) {
            if (data['code'] == "success") {
                layer.closeAll();
                layer.msg("<i class='fa fa-check'></i>  验证码已发送");
                return;
            } else {
                layer.msg("<i class='fa fa-close'></i> "+data['msg']);
                return;
            }
        }
    });
}

/**
 *发送验证码
 */
function sendMobileCode(type) {
    var mobile = $("#user-mobile").val();
    if (!isEqualMobile(mobile)) {
        return false;
    }
    $("#addBox-modal").removeAttr('tabindex');
    var randcode = $("#randcode").val();
    layer.open({
            title: "发送验证码",
            type: 1,
            area: ['480px', '260px'], //宽高
            fix: false, //不固定
            maxmin: false,
            offset: 'auto',
            scrollbar: false,
            content: "<div class='up-w'>" +
                "<table style='margin: 0 auto;' align='center'><tr><td height='30px' class='text_seventeen' id='validateid'></td></tr><tr><td><span>"+randcode+"</span><br>请将上方标记出来的数字依次填入</td></tr><tr><td><i class='icon lock'></i><input class='in_15' type='text' id='incode'></td></tr><tr><td height='60px'><a href='javascript:void(0);' onclick='sendMsg("+mobile+","+type+");' id='loginbtn' class='a24' style='padding: 10px 96px;'>发送验证码</a>  </td></tr></table></div>",
        });
}

//验证手机号
function isEqualMobile(str) {
    if (!(/^1\d{10}$/.test(str))) {
        layer.msg('手机号不正确', { icon: 2, time: 2000 });
        $("#user-mobile").val("");
        return false;
    }
    return true;
}

//获取开户地区
function getDistrict() {
    var province = $("#bankProvince").val();
    if (province == 0) {
        layer.msg('请选择省份', { icon: 2, time: 2000 });
        return false;
    }
    $.ajax({
        type: 'get',
        url: 'get-area.html',
        dataType: 'json',
        data: { area_id: province },
        success: function(data) {
            var html = "";
            var area = data;
            for (var i = 0; i < area.length; i++) {
                html += "<option value='" + area[i]['AREA_ID'] + "'>" + area[i]['AREA_NAME'] + "</option>";
            }
            $("#bankCity").html(html);
        }
    });
}

//检测银行卡号
function luhmCheck(str) {
    var bankno = str;
    if (bankno.length < 16 || bankno.length > 19) {
        $("#bankNumber_id").focus();
        layer.msg('银行卡号长度必须在16到19之间', { icon: 2, time: 1000 });
        return false;
    }
    var num = /^\d*$/;  //全数字
    if (!num.exec(bankno)) {
        $("#bankNumber_id").focus();
        layer.msg('银行卡号必须全为数字', { icon: 2, time: 1000 });
        return false;
    }
    //开头6位
    var strBin = "10,18,30,35,37,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,58,60,62,65,68,69,84,87,88,94,95,98,99";  
    if (strBin.indexOf(bankno.substring(0, 2)) == -1) {
        $("#bankNumber_id").focus();
        layer.msg('银行卡号开头6位不符合规范', { icon: 2, time: 1000 });
        return false;
    }    
    var lastNum = bankno.substr(bankno.length - 1, 1); //取出最后一位（与luhm进行比较）
           
    var first15Num = bankno.substr(0, bankno.length - 1); //前15或18位
        
    var newArr = new Array();    
    for (var i = first15Num.length - 1; i > -1; i--) {   //前15或18位倒序存进数组
               newArr.push(first15Num.substr(i, 1));     }    
    var arrJiShu = new Array();  //奇数位*2的积 <9
        
    var arrJiShu2 = new Array(); //奇数位*2的积 >9
             
    var arrOuShu = new Array();  //偶数位数组
        
    for (var j = 0; j < newArr.length; j++) {      
        if ((j + 1) % 2 == 1) {        
            if (parseInt(newArr[j]) * 2 < 9) {
                arrJiShu.push(parseInt(newArr[j]) * 2);
            } else {
                arrJiShu2.push(parseInt(newArr[j]) * 2);
            }              
        } else {      
            arrOuShu.push(newArr[j]);
        }    
    }         
    var jishu_child1 = new Array(); //奇数位*2 >9 的分割之后的数组个位数
        
    var jishu_child2 = new Array(); //奇数位*2 >9 的分割之后的数组十位数
        
    for (var h = 0; h < arrJiShu2.length; h++) {      
        jishu_child1.push(parseInt(arrJiShu2[h]) % 10);      
        jishu_child2.push(parseInt(arrJiShu2[h]) / 10);    
    }             
    var sumJiShu = 0; //奇数位*2 < 9 的数组之和
        
    var sumOuShu = 0; //偶数位数组之和
        
    var sumJiShuChild1 = 0; //奇数位*2 >9 的分割之后的数组个位数之和
        
    var sumJiShuChild2 = 0; //奇数位*2 >9 的分割之后的数组十位数之和
        
    var sumTotal = 0;    
    for (var m = 0; m < arrJiShu.length; m++) {       sumJiShu = sumJiShu + parseInt(arrJiShu[m]);     }         
    for (var n = 0; n < arrOuShu.length; n++) {       sumOuShu = sumOuShu + parseInt(arrOuShu[n]);     }         
    for (var p = 0; p < jishu_child1.length; p++) {      
        sumJiShuChild1 = sumJiShuChild1 + parseInt(jishu_child1[p]);      
        sumJiShuChild2 = sumJiShuChild2 + parseInt(jishu_child2[p]);    
    }        //计算总和
        
    sumTotal = parseInt(sumJiShu) + parseInt(sumOuShu) + parseInt(sumJiShuChild1) + parseInt(sumJiShuChild2);          //计算Luhm值
        
    var k = parseInt(sumTotal) % 10 == 0 ? 10 : parseInt(sumTotal) % 10;        
    var luhm = 10 - k;         
    if (lastNum == luhm) {     return true;     } else {
        $("#bankNumber_id").focus();    
        layer.msg('银行卡号不正确', { icon: 2, time: 1500 });    
        return false;    
    }  
}


/***/
function toMobile() {
    $("#mobile").val($("#user-mobile").val());
}

function showAgreement() {
    layer.open({
        title: "财气网站用户协议",
        type: 2,
        skin: 'layui-layer-rim', //加上边框
        area: ['650px', '540px'], //宽高
        maxmin: false,
        offset: 'auto',
        content: '/login/agreement.html',
    });
}

/**
 * 删除账单
 * @param id
 * @param _this
 */
function delAsset(id, type, _this) {
    var url = $(_this).attr('data-url');
    layer.confirm('确定要删除该账单？', function() {
        $.post(url, { id: id, type: type }, function(msg) {
            if (msg.status == 1) {
                layer.closeAll();
                setTimeout(function() {
                    window.location.reload();
                }, 1500);
            } else {
                layer.msg('删除失败');
            }
        }, 'json');
    });
}

/**
 *删除银行卡
 */
function saveDeleteBank() {

}