$(function () {
    var signFun = function () {
        var money = 0.0;
        //        var dateArray = [2, 4, 6] // 假设已经签到的
        $.ajaxSettings.async = false;
        //    	var dateArray= getDatelist();
        var dateMap = getDatelist();
        console.log(dateMap);
        $.ajaxSettings.async = true;
        var $dateBox = $("#js-qiandao-list"),
            $currentDate = $(".current-date"),
            $qiandaoBnt = $("#qiandaoBnt"),
            $qiandaoBnt2 = $("#qiandaoBnt2")
        _html = '',
        _handle = true,
        myDate = new Date();
        var sign = $(".date" + myDate.getDate()).html();
        if (sign != '' && typeof (sign) != 'undefined') _handle = false;
        $currentDate.text(myDate.getFullYear() + '年' + parseInt(myDate.getMonth() + 1) + '月' + myDate.getDate() + '日');

        var monthFirst = new Date(myDate.getFullYear(), parseInt(myDate.getMonth()), 1).getDay();

        var d = new Date(myDate.getFullYear(), parseInt(myDate.getMonth() + 1), 0);
        var totalDay = d.getDate(); //获取当前月的天数

        for (var i = 0; i < 42; i++) {
            _html += ' <li><div class="qiandao-icon"></div><span class="qiandao-money">+0.5元</span></li>'
        }
        $dateBox.html(_html) //生成日历网格

        var $dateLi = $dateBox.find("li");
        for (var i = 0; i < totalDay; i++) {
            $dateLi.eq(i + monthFirst).addClass("date" + parseInt(i + 1));
            for (var key in dateMap) {
                if (i == key) {
                    $dateLi.eq(i + monthFirst).addClass("qiandao");
                    $dateLi.eq(i + monthFirst).html("<div class='qiandao-icon'></div><span class='qiandao-money'>+" + dateMap[key] + "元</span>");
                }
            }
            //            for (var j = 0; j < dateArray.length; j++) {
            //                if (i == dateArray[j]) {
            //                    $dateLi.eq(i + monthFirst).addClass("qiandao");
            //                }
            //            }
        } //生成当月的日历且含已签到
        if (_handle) {
            $(".date" + myDate.getDate()).addClass('able-qiandao');
        }
        $dateBox.on("click", "li", function () {
            if ($(this).hasClass('able-qiandao') && _handle) {
                $(this).addClass('qiandao');
                qiandaoFun();
            }
        }) //签到

        $qiandaoBnt.on("click", function () {
            if (sign != '' && typeof (sign) != 'undefined') {
                _handle = false;
            } else {
                _handle = true;
            }
            if (_handle) {
                signIn();
            }
        }); //签到

        $qiandaoBnt2.on("click", function () {
            if (sign != '' && typeof (sign) != 'undefined') {
                _handle = false;
            } else {
                _handle = true;
            }
            if (_handle) {
                signIn();
            }
        }); //签到
        function signIn() {
            var path = "../wallet/sign_in";
            _handle = false;
            $.ajax({
                cache: true,
                type: "POST",
                url: path,
                async: false,
                success: function (data) {
                    layer.open({
                        type: 3
    			        , area: ['50%', '70%']
    			        , shade: 0.4
    			        , shadeClose: true
    			        , closeBtn: 1
    			        , move: false
    			        , content: '<div class=bgall08><div class=bgblack></div><div class=bgline></div><div class=bgmclose>X</div><div class=money-info><h3>' + data.money + '<span>元</span></h3><p>恭喜您，完成每日签到任务</p></div></div>'
                    });
                    console.log(data);
                    //queryMyInvestTotal();
                    money = data.money;
                    $(".layui-layer-loading-1").css("background", "none");

                    $qiandaoBnt.addClass('actived');
                    $qiandaoBnt.html("已打卡");
                    $qiandaoBnt.attr("disabled", 'disabled');
                    $qiandaoBnt2.addClass('actived');
                    $qiandaoBnt2.html("已打卡");
                    $qiandaoBnt2.attr("disabled", 'disabled');
                    $(".date" + myDate.getDate()).addClass('qiandao');
                    $(".date" + myDate.getDate()).removeClass('able-qiandao');
                    $(".date" + myDate.getDate()).html("<div class='qiandao-icon'></div><span class='qiandao-money'>+" + money + "元</span>");
                    //返回false 去掉默认提交成功刷新
                    $(".bgmclose").click(function () {
                        $(".layui-layer-shade").hide();
                        $(".layui-layer").hide();
                        window.location.href = "/userManager/toUsercenter.htm"
                    })
                    return data.money;

                },
            });
        }



        //        function qiandaoFun() {
        //        	signIn();
        //        	qiandaomoney = money;
        //        	console.log(qiandaomoney);
        ////            $qiandaoBnt.addClass('actived');
        ////            $qiandaoBnt.html("已打卡")
        ////            /*openLayer("qiandao-active", qianDao);*/
        ////            $(".date" + myDate.getDate()).addClass('qiandao');
        ////            $(".date" + myDate.getDate()).html("<div class='qiandao-icon'></div><span class='qiandao-money'>+"+qiandaomoney+"元</span>")
        //            _handle = false;
        //        }

        function qiandaoFun() {
            signIn();
            qiandaomoney = money;
            console.log(qiandaomoney);
            $qiandaoBnt.addClass('actived');
            $qiandaoBnt.html("已打卡")
            /*openLayer("qiandao-active", qianDao);*/
            $(".date" + myDate.getDate()).addClass('qiandao');
            $(".date" + myDate.getDate()).removeClass('able-qiandao');
            $(".date" + myDate.getDate()).html("<div class='qiandao-icon'></div><span class='qiandao-money'>+" + qiandaomoney + "元</span>")

            _handle = false;
        }

        function qianDao() {
            $(".date" + myDate.getDate()).addClass('qiandao');
        }
    }();

    //获取数据
    function getDatelist() {
        var dateArray = [];
        var params = {};
        var path = "../account/get_alldate_list";
        //    	$.ajax({
        //			type:"post",
        //			url:path,
        //			data:params,
        //			asyc:f
        //			success:function(data){
        //				return data;
        //			},
        //		});
        $.getJSON("../account/get_alldate_list", params, function (result) {
            dateArray = result.data;
            console.log(dateArray);
        });
        return dateArray;
    }



    function openLayer(a, Fun) {
        $('.' + a).fadeIn(Fun)
    } //打开弹窗

    var closeLayer = function () {
        $("body").on("click", ".close-qiandao-layer", function () {
            $(this).parents(".qiandao-layer").fadeOut()
        })
    }() //关闭弹窗

    $("#js-qiandao-history").on("click", function () {
        openLayer("qiandao-history-layer", myFun);

        function myFun() {
            console.log(1)
        } //打开弹窗返回函数
    })



})
