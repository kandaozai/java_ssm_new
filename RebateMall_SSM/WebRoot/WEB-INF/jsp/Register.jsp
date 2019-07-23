<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head>
    <title>用户注册-返利网</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="${ctx}/CCSS/bootstrap.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CCSS/common.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CCSS/main.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CCSS/Y-top.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CCSS/Y-common.css" type="text/css"></link>

    <link rel="stylesheet" href="${ctx}/CQW/bootstrap.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/personal.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/font-awesome.min.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/site.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/forum.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/cropbox.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/dropload.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/bootstrap-slider.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/toastr.min.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/guide.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/liMarquee.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/laydate.css" type="text/css"></link>
    <link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css" id="LayDateSkin"></link>
    <link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css" id="layui_layer_skinlayercss"></link>
    <style type="text/css">
    	.form-contrl .form-inp .passStrength{
			width:98%;
			margin:0 auto;
			
		}
		.form-contrl .form-inp .passStrength .info{
			text-align:center;/*文本居中*/
			width:25%;
			background:gray;
			float:left;
			margin-top:5px;
			margin-bottom:5px;
			color:white;
			box-shadow:1px 1px 2px #000;/*阴影效果*/
		}
    </style>
    
    
  

    </head>
  <body>
	<header>
        <div class="header_top">
            <div class="header_center clearfix" style="margin:auto;">
                <div class="header_lef">
                    <span class="mr15"><i class="glyphicon glyphicon-earphone"></i>欢迎致电：400-000-0000</span>
                    <span><i class="glyphicon glyphicon-time"></i>服务时间：9:00-18:00</span>
                    <span id="weibo" class="ml20 mr4" style="display: none;">
                        <i class="icon icon_weibo"></i>
                        <em class="show_weibo" style="display: none;">
                            <p>点击关注返利网微博</p>
                            <p><a href="javascript:;" target="_blank">caiqi@weibo</a></p>
                        </em>
                    </span>
                    <span id="qq" style="margin-left: 10px;">
                        <i class="icon icon_qq"></i>
                        <em class="show_qq" style="display: none;">
                            <p>返利网官方客服</p>
                             <p><a href="javascript:;" target="_blank"></a><a  href="http://wpa.qq.com/msgrd?v=3&uin=2569461773&site=qq&menu=yes" target="_blank">2569461773</a></p>
                        </em>
                    </span>
                    <span id="weixin" style="margin-left: 1px;">
                        <i class="icon icon_weixin"></i>
                        <em class="show_weixin" style="display: none;">
                            <p>返利网官方微信</p>
                            <p><a href="javascript:;" target="_blank"><img src="${ctx}/CQW/image/weikefu.jpg" width="130" alt=""></a></p>
                        </em>
                    </span>
                </div>
                <div class="header_rig">
                    <ul>
                       <li><a href="">帮助中心</a></li>
						<li>
						  <c:choose><c:when test="${not empty SignUpNameCS}"> <a  onclick="" href='javascript:;'>${SignUpNameCS}</a> </c:when> <c:otherwise><a href="${ctx}/mainsy/Register.do">注册</a></c:otherwise> </c:choose>
						</li>
						<li>
						  <c:choose><c:when test="${not empty SignUpIdCS}"> <a  onclick="SCsession()" href='javascript:;'>退出</a> </c:when> <c:otherwise><a href='${ctx}/loginweb/login.do'>登录</a></c:otherwise> </c:choose>
						</li>	
						<li>
						 <c:choose><c:when test="${not empty SignUpIdCS}"> <a href="${ctx}/loginweb/signin.do" style="color: red; font-weight: bold;">签到</a> </c:when> <c:otherwise><a href="javascript:;" onclick="layer.msg('请先登录')" style="color: red; font-weight: bold;">签到</a></c:otherwise> </c:choose>
						  
						</li>
                    </ul>
                </div>
            </div>
        </div>
        <div class="header_bottom">
		<div class="bottom_center" style="margin: auto;">
			<a href=""><img class="bot_left" src="${ctx}/CQW/image/LOGO.png"></a>	
			<div class="nav_list">
				 <ul>
					    <li class="navCur"><a href="${ctx}/mainsy/MainIndex.do">首页</a></li>
                       <li><a href="${ctx}/RenwuT/renwu.do">任务大厅</a></li>
                       <li>
                           <a href="${ctx}/zFStore/JFmain.do">积分商城</a>
                           <i class="hot" style="top: 25px; right: -8px;"><img src="${ctx}/CQW/image/u_new.gif"></i>
                       </li>
                       <!-- <li><a href="">理财返利</a></li> -->
                       <li><a href="">理财资讯</a></li>
                       <li><a href="">新手指南</a></li>
                       <li>
                         <c:choose><c:when test="${not empty SignUpIdCS}"> <a href="${ctx}/personalWeb/wdzl.do"> </c:when> <c:otherwise> <a href="javascript:;" onclick="layer.msg('请先登录')">   </c:otherwise> </c:choose>
                         <c:choose><c:when test="${not empty HeadportraitCS}"> <i class="account mr15"><img src="${ctx}/mainsy/getUserPicture.do?file=${HeadportraitCS}" onerror="this.onerror=null;this.src='${ctx}/CQW/image/user-o.png'"></i> </c:when> <c:otherwise><i class="account mr15"><img src="${ctx}/CQW/image/user-o.png"></i></c:otherwise> </c:choose>
                                                                                         我的账户</a>
                       </li>
                 </ul>
			</div>			
		</div>
	</div>
    </header>

    <!--头部结束-->
    <!--内容开始-->

    <div class="wrapper">
        <div class="m-reg reg-per">
            <div class="tit">
                <h2 style="margin-top: 0px;"  >会员注册<span class="t-small">投资人帐号注册页面</span></h2>
                <span class="more">已有会员帐号，<a href="${ctx}/loginweb/login.do">请登录</a></span>
            </div>
            <div class="con cl">
                <div class="fl">
                    <form class="form-horizontal" method="post" id="registerform" action="${ctx}/mainsy/doInsert.do">
                        <input type="hidden" name="type" value="1">
                        <font color=red></font>
                        <div class="reg-form">
                            <div class="form-contrl">
                                <label for="">会员名称</label>
                                <div class="form-inp">
                                    <input type="text" class="form-control" id="signUpName" name="signupname" placeholder="请输入会员名称">
                                    <span id="phoneexist"></span>
                                </div>
                            </div>
                            <div class="form-contrl">
                                <label for="">密码</label>
                                <div class="form-inp">
                                    <input type="password" class="form-control" id="password" name="password" onkeyup="checkStrong(this.value)" placeholder="6~16位数字或英文符号" onKeyUp="value=value.replace(/[\u4E00-\u9FA5]/g,'')" onafterpaste="value=value.replace(/[\u4E00-\u9FA5]/g,'')" maxlength="16">                                    
                                    <!-- 密码强度检测 -->
					  				<div class="passStrength">
						  				<div class="info" id="info0">弱</div>
						  				<div class="info" id="info1">中</div>
						  				<div class="info" id="info2">强</div>
						  				<div class="info" id="info3">超强</div>
					  				</div>
                                    <span id="passwdmsg"></span>
                                </div>
                            </div>
                            <div class="form-contrl">
                                <label for="">确认密码</label>
                                <div class="form-inp">
                                    <input type="password" class="form-control" id="conpassword"  placeholder="请再次输入密码"  onKeyUp="value=value.replace(/[\u4E00-\u9FA5]/g,'')" onafterpaste="value=value.replace(/[\u4E00-\u9FA5]/g,'')" maxlength="16">
                                    <span id="checkpassword"></span>
                                </div>
                            </div>
                            <div class="form-contrl">
                                <label for="">手机号码</label>
                                <div class="form-inp">
                                    <input type="text" class="form-control" id="phoneNumber" name="phonenumber" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  maxlength="11"  placeholder="请输入手机号码">
                                    <span id="phoneexist"></span>
                                </div>
                            </div>
                            <div class="form-contrl">
                                <label for="">手机验证码</label>
                                <div class="form-inp inp-yanzheng" style="width:319px;">
                                    <input type="text" class="form-control" id="phoneCode" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  maxlength="4" name="phonecode">
                                    <input type="button" class="" id="yanzheng"  value="发送验证码">
                                    <span id="checkphonecode" style="position: relative;"></span>
                                </div>
                                <div id="popup-captcha"></div>
                            </div>
                            <div class="form-contrl">
                                <label for="">数字ID</label>
                                <div class="form-inp inp-yanzheng" style="width:319px;">
                                    <input type="text" readonly="readonly" class="form-control" id="digital" name="digital">
                                    <input type="button" class="" id="huoqu"  value="生成数字ID">
                                    <span id="checkdigital" style="position: relative;"></span>
                                </div>
                                <div id="popup-captcha"></div>
                            </div>
                            <div class="form-contrl">
                                <label for="">邮箱</label>
                                <div class="form-inp">
                                    <input type="text" class="form-control" id="mailbox" name="mailbox" placeholder="请输入邮箱:如123@qq.com" maxlength="40"/>
                                </div>
                            </div>
                            <div class="form-contrl">
                                <label for="">推荐人</label>
                                <div class="form-inp">
                                    <input type="text" class="form-control" id="refer" name="refer" placeholder="选填（手机号，邀请越多好友，得到越多红包）" maxlength="40"/>
                                </div>
                            </div>
                            <div class="form-contrl">
                                <label for=""></label>
                                <div class="form-inp form-btn">
                                    <button type="button" class="btn btn-block" onclick="check()">提交</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="fr"></div><div class="fr"></div>
            </div>
        </div>
    </div>
    <!--内容结束-->
    <!--尾部开始-->
    <!--foot start-->
    <div class="foot">
        <div class="Y_f1">
            <div class="Y_f1_l">

                <ul class="Y_ul_txt fl">
                    <a href=""><li>关于我们</li></a>
                    <a href="" target="_blank"><li>公司简介</li></a>
                    <a href="" target="_blank"><li>媒体报道</li></a>
                    <a href="" target="_blank"><li>联系我们</li></a>
                </ul>
                <ul class="Y_ul_txt fl">
                    <a href="#"><li>帮助中心</li></a>
                    <a href="/platform_newhand.htm" target="_blank"><li>新手指引</li></a>
                    <a href="/platform_fanligl.htm" target="_blank"><li>返利攻略</li></a>
                    <a href="/news/tnews.htm?id=48"><li>免责申明</li></a>

                </ul>

            </div>
            <div class="Y_f1_c">
                <div class="Y_f1_cl"><span><img src="${ctx}/CCSS/img/ewm_t.jpg"></span><p>关注返利网</p></div>
                <div class="Y_f1_cl"><span><img src="${ctx}/CCSS/img/ewm_w.jpg"></span><p>关注网贷返利</p></div>
            </div>
            <div class="Y_f1_r">
                <div class="Y_f1_r1">
                    <span class="Y_phone"></span>
                    <em>热线电话(9:00~18:00)</em>
                    <p>0571-28999315 15558172053</p>

                </div>
                <div class="Y_f1_r2">
                    <span class="Y_qq"></span>
                    <em>在线客服(9:00~18:00)</em>
                    <p>交流群：518910447 QQ：945726470</p>

                </div>
            </div>
        </div>

        <div class="Y_f2">
            <p>
                Copyright © 2016 杭州虎睛科技有限公司 &nbsp;&nbsp;&nbsp;&nbsp;浙ICP备16018921号-1&nbsp;&nbsp;&nbsp;&nbsp;地址：浙江省杭州市拱墅区天行国际1703 <br />友情提示：返利网仅提供信息服务，投资有风险，购买需谨慎。
            </p>
            <span><img src="${ctx}/CCSS/img/foot_i1.png"></span><span><img src="${ctx}/CCSS/img/foot_i2.png">
        </div>
    </div>
    <!--foot end-->
    <div class="systemmag"><div id="systemmag"><a href="javascript:void(0);" title="关闭" class="layerModel_closeBtn" onclick="$('#systemmag').close();">×</a></div></div>
    <!--尾部结束-->
    <script type="text/javascript" src="${ctx}/CCSS/jquery-1.12.3.min.js"></script>
    <script type="text/javascript" src="${ctx}/CCSS/bootstrap.min.js"></script>
    <script type="text/javascript" src="${ctx}/CCSS/platform.js"></script>
    <script type="text/javascript" src="${ctx}/CCSS/gt.js"></script>
    <script type="text/javascript" src="${ctx}/CCSS/jquery.form.js"></script>
    
    <script type="text/javascript" src="${ctx}/CQW/uaredirect.js"></script>  
    <script type="text/javascript" src="${ctx}/assets/plugins/layer/layer.js" ></script>
    <script>
        $(".r_list").hover(function(){
		    $(this).children(".text").toggle();
		    $(this).children(".text").animate({left:'-150px'},500);
	    })
	    
	    function checkStrong(pass){
			var level = -1;//密码强度的级别
			var colors = ["red","orange","blue","green"];
			for ( var i = 0; i < 4; i++) {				
				document.getElementById("info"+i).style.background="gray";
			}
			//长度
			if(pass.length < 6){
				return false;
			}
			//1.包含数字
			//正则表达 在js中的应用
			if(/\d/.test(pass)){
				level++;//有数字记录级别+1
			}
			//2.包含小写字母
			if(/[a-z]/.test(pass)){
				level++;
			}
			//3.包含大写字母
			if(/[A-Z]/.test(pass)){
				level++;
			}
			//4.包含特殊字符
			if(/\W/.test(pass)){
				level++;
			}
			for ( var i = 0; i <= level; i++) {
				var info = document.getElementById("info"+i);
				info.style.background=colors[i];
			}
		}
    </script>   
    
    
    <!-- 生成数字ID（随机生成字符串） -->
    <script type="text/javascript">
        $("#huoqu").click(function () {
            var Num = "";
            for (var i = 0; i < 6; i++) {
                Num += Math.floor(Math.random() * 6);
            }
            $("#digital").val(Num);
        })
        
        //注册保存
        function check() {			
			if ($("#signUpName").val() == "") {
				alert("请输入会员名!")
				return false;
			}
			if ($("#signUpName").val() != "") {
			      var  ZHI= $("#signUpName").val();
				  $.getJSON("${ctx}/mainsy/PDGLYMC.do?ZHI=" + ZHI, function (data) {
					 if(data.state == true){
					 layer.msg("已存在");	
					 return false;
					}
				});
			}
			
			if ($("#password").val() == "") {
				alert("请输入密码！")
				return false;
			}
			if ($("#conpassword").val() == "") {
				alert("请输入确认密码！")
				return false;
			}
			if ($("#conpassword").val() != $("#password").val()) {
				alert("确认密码不一致！")
				return false;
			}
			
			
			if ($("#phoneNumber").val() == "") {
				alert("请输入手机号!")
				return false;
			}			
			if ($("#phoneCode").val() == "") {
				alert("请输入手机验证码！")
				return false;
			}
			if ($("#digital").val() == "") {
				alert("请输入数字ID！")
				return false;
			}
			if ($("#mailbox").val() == "") {
				alert("请输入邮箱!")
				return false;
			}			
			$("#registerform").ajaxSubmit(function(data){
				if((typeof data)=="string"){
					data=JSON.parse(data);
				}
				if(data.state){
				document.getElementById("registerform").reset();//重置form表单
				layer.msg("注册成功,4秒后跳转...");
				setTimeout('tisss()',4000); //指定后 2秒刷新
				
				};				
			})
		}
		
		//跳转到登录
		function  tisss(){
			window.location.href="${ctx}/loginweb/login.do";
		} 
			   //退出
        function SCsession(){
        var varstr = "${SignUpNameCS}";
       if( varstr !=null  && varstr !="" ){
        $.getJSON("${ctx}/mainsy/SCsessiom.do", function (data) {
	      
	       if(data.state == true){
             layer.msg("退出成功");
             setTimeout('souye()',2000); //指定后 2秒刷新
		       }else{
		      layer.msg("退出失败！");
		       }
			}); 
       }else{
        layer.msg("未登录！");
       }
     
    }
    
    function souye(){
    window.location.href="${ctx}/mainsy/MainIndex.do";
    }
    
         $("#phoneNumber").change(function(){
            var phone=$("#phoneNumber").val();
            if(!/^1[3|4|5|8][0-9]\d{8}$/.test(phone)  && phone != phone>1){
            layer.alert($("#phoneNumber").val(),{icon:5,title:"电话号码不正确！"});
            $("#phoneNumber").val("")
            }
            
            })
    
         //会员名 
            $("#signUpName").change(function () {
                var phone = $("#signUpName").val();
                if (phone == null || phone =="") {
                      layer.msg("不能为空");
                }else {
                //判断数据是否存在相同
                var  ZHI= $("#signUpName").val();
                $.getJSON("${ctx}/mainsy/PDGLYMC.do?ZHI=" + ZHI, function (data) {
					 if(data.state == true){
					 layer.msg("已存在");
					}else{
					layer.msg("正确");
					    
							}
						});
                }
            })
            
            // 去数字强行输入的字母
            $("#phoneNumber,#phoneCode").on('blur', function () {
                var $asdfg = $(this);
                  $asdfg.val(($asdfg.val().replace(/[^\d]/g, '')))//去除匹配值 去除非数字
            })
            
             //密码  [a-zA-Z0-9~!@#$%^&*()_+-=;':",./<>?`]{6,16}   
            $("#password").change(function () {
                var phone = $("#password").val();
                if (!/^[a-zA-Z0-9~!@#$%^&*()_+-=;':",.\/<>?`]{6,16}$/.test(phone) && phone != phone > 1 ) {
                     layer.msg("格式有误！");
                     $("#password").val("");
                } else{
                   layer.msg("正确");
                }
            })
            
             //确认密码  [a-zA-Z0-9~!@#$%^&*()_+-=;':",./<>?`]{6,16}   
            $("#conpassword").change(function () {
                var phone = $("#conpassword").val();
                if (!/^[a-zA-Z0-9~!@#$%^&*()_+-=;':",.\/<>?`]{6,16}$/.test(phone) && phone != phone > 1 ) {
                     layer.msg("格式有误！");
                     $("#conpassword").val("");
                } else{
                   layer.msg("正确");
                }
            })
    
    </script>
  </body>
</html>
