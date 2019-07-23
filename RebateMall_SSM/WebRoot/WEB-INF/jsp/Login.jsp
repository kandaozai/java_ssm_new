<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head>
    <title>用户登录-返利网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">

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
  
    <%-- <link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css" id="LayDateSkin"></link> --%>
    <link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css" id="layui_layer_skinlayercss"></link>
    <style type="text/css">
    	.form_box .form .form-group .input_text{
			width:120px;
			height:33px;
			border:1px solid #d9d9d9;
			color:#000;
			margin:0 auto;
			margin-bottom:20px;
/* 			outline:none;/*去掉文本框的边框颜色点击样式*/
			font-size:16px;
			font-family:"楷体";
			padding-left:5px;
/* 			box-shadow:1px 1px 2px #000;/*阴影效果*/
		}
		.form_box .form .form-group .code{
			/* width:25%; */
		}
		.form_box .form .form-group img{
			vertical-align:middle;
			margin-left:15px;
			cursor:pointer;
		}
		
		.zxlisty1{
		padding-bottom: 10px;
		}
		.spanone{
		font-size: 18px;
		color: #f30000;
		} 
		.aone{
		float: right;
		font-size: 1px;
		margin-top: 8px;
		} 
		.divone{
		width: 300px;
		height: 320px;
		border: 1px solid #bbbaba;
		border: 1px solid #bbbaba;
		padding: 20px;
		background-color: #ffffff66;
		position: absolute;
		top: 240px;
		z-index: 100;
		} 
		.divtow{
		border-bottom: 1px solid #bbbaba;
		padding-top: 5px;
		} 
		
    </style>
  </head>
  
  <body>
    <header>
        <div class="placeholder"></div>
        <div class="header_top">
            <div class="header_center clearfix">
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
            <div class="bottom_center">
                <a href="${ctx}/servlet/mainServlet?fun=Main"><img class="bot_left" src="${ctx}/CQW/image/LOGO.png"></a>
                <div class="nav_list">
                    <ul>
                       <li><a href="${ctx}/mainsy/MainIndex.do">首页</a></li>
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
                       <%--  <li><a href="javascript:;" onclick="layer.msg('未登录！')" ><i class="account mr15"><img src="${ctx}/CQW/image/user-o.png"></i>我的账户</a></li> --%>
                    </ul>
                </div>
            </div>
        </div>
    </header>
    <content>
	    <div class="login_main ">
	        <div class="banner_list clearfix">
			    <div style="opacity: 0; z-index: 0; background-image: url(&quot;${ctx}/CQW/image/login_bg1.jpg&quot;); background-color: rgb(34, 213, 213);"></div>
			    <div style="opacity: 1; z-index: 10; background-image: url(&quot;${ctx}/CQW/image/login_bg2.jpg&quot;); background-color: rgb(254, 241, 102);"></div>
		    </div>
		    
		    <!--用户登录框-->
		    <div class="form_box clearfix">
			    <div class="form">
				    <form id="loginform" action="${ctx}/loginweb/userLogin.do" method="post">
	                    <table>
					        <tbody>
	                            <tr>
						            <td height="30px" class="text_thseven">用户登录</td>
					            </tr>
					            <tr>
						            <td height="26px" id="validateid" style="position:relative;"></td>
					            </tr>
					            <tr>
						            <td style="position: relative;">
							            <i class="icon phone"></i>
							            <div class="form-group field-login-mobile  required">
	                                        <input type="text" id="signUpName" class="form-control" name="signupname" placeholder="请输入用户名" style="border-radius: 0px;box-shadow: unset;text-indent: 20px;" aria-required="true">
	                                    	<div class="help-block"></div>
	                                    </div>
	                                </td>
					            </tr>
					            <tr>
						            <td style="position: relative;">
							            <i class="icon lock"></i>
							            <div class="form-group field-login-password  required">
	                                        <input type="password" id="password" class="form-control" name="password" placeholder="请输入密码" style="border-radius: 0px;box-shadow: unset;text-indent: 20px;" aria-required="true">
	                                    	<div class="help-block"></div>
	                                    </div>
	                                </td>
					            </tr>
					            
					          <!--   <tr>
						            <td style="position: relative;">
							            <div class="form-group field-login-password  required">
	                                        <input id="code" class="input_text code" type="text" placeholder="请输入验证码" />
  											<img src="valcode.action" onclick="this.src='valcode.action?'+Math.random();">
	                                    </div>
	                                </td>
					            </tr> -->
					            
					            <tr>
						            <td height="60px">
						            	<input type="button" class="login_btn" onClick="login()" value="立即登录">
						            </td>
					            </tr>
					            <tr>
						            <td height="30px" class="text_one">
							                               马上开始赚钱，<a href="${ctx}/servlet/registerServlet?fun=Register" class="text_thirty">免费注册</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							            <a href="" class="text_thirty">忘记密码</a>
						            </td>
					            </tr>
				            </tbody>
	                    </table>
				    </form>
	            </div>
		    </div>
			<!--用户登录框结束-->
			
	    </div>
    </content>
    <footer>
        <div style="background:#333!important;" class="clearfix">
            <div class="footer_center clearfix">
                <div class="footer_left">
                    <dl>
                        <dt><i class="icon icon_about mr12"></i>关于我们</dt>
                        <dd><a href="">了解我们</a></dd>
                        <dd><a href="">加入我们</a></dd>
                        <dd><a href="">联系我们</a></dd>
                        <dd><a href="">意见反馈</a></dd>
                    </dl>
                    <dl>
                        <dt><i class="icon icon_help mr12"></i>帮助中心</dt>
                        <dd><a href="">新手上路</a></dd>
                        <dd><a href="">注册登录</a></dd>
                        <dd><a href="">名词解释</a></dd>
                        <dd><a href="">提现申请</a></dd>
                    </dl>
                    <dl>
                        <dt><i class="icon icon_pro mr12"></i>广告主服务</dt>
                        <dd><a href="">广告主登录</a></dd>
                        <dd><a href="${ctx}/RenwuT/tongjt.do">广告主注册</a></dd>
                    </dl>
                    <dl style="margin-right: 20px;">
                        <dt><i class="icon icon_see mr12"></i>关注我们</dt>
                        <dd style="height:88px; padding-left: 25px;">
                            <img src="${ctx}/CQW/image/weixin.png">
                            <img src="${ctx}/CQW/image/weikefu.jpg" style="margin-left:10px;width:88px;height:88px;">
                        </dd>
                        <dd><a href="javascript:;">微信公众号</a><a href="javascript:;" style="margin-left:40px;">微信客服</a></dd>
                    </dl>
                </div>
                <div class="footer_rig">
                    <dl>
                        <dt><i class="icon icon_service"></i>服务支持</dt>
                        <dd class="fz30 color3">000-000-0000</dd>
                        <dd class="mt10">服务时间：<strong>9:00-18:00</strong></dd>
                        <dd class="mt12">投资有风险 理财需谨慎</dd>
                    </dl>
                </div>
            </div>
            <div class="footer_copyright">
                <div class="copyright">
                   	 版权所有：头号（北京）科技有限公司 © CopyRight 2014-2016 www..com .All Rights Reserved. 京ICP备00000000
                    &nbsp;&nbsp;
                 
                </div>
                <div class="copyright_tags">
                    <span><img src="${ctx}/CQW/image/copy1.png"></span>
                    <span><img src="${ctx}/CQW/image/copy2.png"></span>
                    <span><img src="${ctx}/CQW/image/copy3.png"></span>
                </div>
            </div>
        </div>
        
    <!-- 百度新闻热点  -->
    <div class="divone"  >
     <div class='zxlisty1' ><span class='spanone' >热点新闻</span><a  href='javascript:;' class='aone'  onclick='xwrd()'>刷新</a></div>
     <div id="ul_hotspot">
       <h4>玩命加载中...</h4>
     </div>
   
    </div>
    
    </footer>
    <script type="text/javascript" src="${ctx}/CQW/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/yii.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/yii.validation.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/yii.activeForm.js"></script> 
    <script type="text/javascript" src="${ctx}/CQW/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/style.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/banner.js"></script>	
    <script type="text/javascript" src="${ctx}/CQW/scale.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/scaleA.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/scaleB.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/personal.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/bootstrap-slider.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.cookie.js"></script> 
    
    <script type="text/javascript" src="${ctx}/CQW/uaredirect.js"></script>
    
    <script type="text/javascript" src="${ctx}/CQW/jquery.SuperSlide.js"></script>
<%--     <script type="text/javascript" src="${ctx}/CQW/laydate.js"></script> --%>
    <script type="text/javascript" src="${ctx}/CQW/layer.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/toastr.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.qqFace.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/awardRotate.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.liMarquee.js"></script>
    <script type="text/javascript" src="${ctx}/CCSS/jquery.form.js"></script>
	<script type="text/javascript">
	$(function() {
//显示百度热点新闻
xwrd();

})
  function xwrd(){
     
      $.getJSON("${ctx}/RenwuT/hotspotAPI.do", function(datas){
      $("#ul_hotspot").html("");
      if (datas != null) {
        var ulcontent = "<div><div class='zxlisty2'><ul>";
        for (var i = 0; i < 10; i++) {
    	    ulcontent += "<li><div class='divtow' ><span>" + (i + 1) + "</span><a target='_blank' href='https://www.baidu.com/s?wd="+datas.data[i].keyword+"&tn='>" + datas.data[i].keyword + "</a><p style='float:right;'>" + datas.data[i].index + "</p></li></div>";
        }
        ulcontent += "</ul></div></div>";
        $("#ul_hotspot").append(ulcontent);
          }
         }); 
     
     }
    
     
     
     
		
    	//登录
    	function login(){			
			$("#loginform").ajaxSubmit(function(data){
				if((typeof data)=="string"){
					data=JSON.parse(data);
				}
				layer.msg(data.msg);
				if(data.state){
				setTimeout('tzaa()', 2000);
					
				};
			})
		}
		
		//跳转首页
		function  tzaa(){
		window.location.href="${ctx}/mainsy/MainIndex.do";
		}
		
		$(document).keydown(function () {
            if (event.which == 13) {
                login();
            }
        })
        
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
        
    </script>
</body>
</html>
