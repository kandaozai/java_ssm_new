<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head>    
    <title>个人中心-返利网</title>    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
    <meta name="viewport" content="width=device-width, initial-scale=1">
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
	<%-- <link rel="stylesheet" href="${ctx}/CQW/laydate.css" type="text/css"></link> --%>
	<link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css" id="LayDateSkin"></link>
	<link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css" id="layui_layer_skinlayercss"></link>
   <style type="text/css">
    a:hover{
         color:#fe7171;}
   
   </style>
  </head>
  
  <body>
  	<header>
	    <div class="placeholder"></div>
	    <div class="header_top" style="">
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
			    <a href=""><img class="bot_left" src="${ctx}/CQW/image/LOGO.png"></a>	
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
                       <li  class="navCur">
                         <c:choose><c:when test="${not empty SignUpIdCS}"> <a href="${ctx}/personalWeb/wdzl.do"> </c:when> <c:otherwise> <a href="javascript:;" onclick="layer.msg('请先登录')">   </c:otherwise> </c:choose>
                         <c:choose><c:when test="${not empty HeadportraitCS}"> <i class="account mr15"><img src="${ctx}/mainsy/getUserPicture.do?file=${HeadportraitCS}" onerror="this.onerror=null;this.src='${ctx}/CQW/image/user-o.png'"></i> </c:when> <c:otherwise><i class="account mr15"><img src="${ctx}/CQW/image/user-o.png"></i></c:otherwise> </c:choose>
                                                                                         我的账户</a>
                       </li>
	                 </ul>
			    </div>			
		    </div>
	    </div>
	</header>
    <!--用户中心header-->
     <div class="member_header">
    </div>
    <!--用户中心main-->
    <div class="member_main clearfix">
        <div class="member_left">
        <dl class="dl clearfix">
            <dd class="dl_dd">
                <a class="text_fifteen curin" href="${ctx}/personalWeb/wdzl.do">
                    <i class="member_icon me_user"></i>
                    <span>我的资料</span>
                </a>
            </dd>
            <dd class="dl_dd">
                <a class="text_fifteen" href="${ctx}/personalWeb/statisticaljt.do">
                    <i class="member_icon me_task"></i>
                    <span>金额统计</span>
                </a>
            </dd>
            <dd class="dl_dd">
            <a id="member_invest" class="text_fifteen" href="${ctx}/perInvestmentweb/PerInvestCX.do">
                    <i class="member_icon me_touzi"></i>
                    <span>投资管理</span>
                </a> 
               <%--  <a id="member_invest " class="text_fifteen" href="${ctx}/perInvestmentweb/PerInvestment.do">
                    <i class="member_icon me_touzi"></i>
                    <span>投资管理</span>
                </a> 
                 <ul class="member_touzis">
                    <li><a href="${ctx}/perInvestmentweb/PerInvestment.do">投资申报</a></li>
                    <li><a href="">资金记录</a></li>
                    <li><a href="">提现账户</a></li>
                </ul> --%>
            </dd>
          <!--   <dd class="dl_dd">
                <a class="text_fifteen" href="">
                    <i class="member_icon me_jizhang"></i>
                    <span>我的记账</span>
                </a>
            </dd> -->
            <dd class="dl_dd">
                <a class="text_fifteen" href="${ctx}/securityXXweb/Account.do">
                    <i class="member_icon me_info"></i>
                    <span>账户安全</span>
                </a>
            </dd>
            
            
            <dd class="dl_dd">
                <a class="text_fifteen" href="${ctx}/RenwuT/urljDT.do">
                    <i class="member_icon me_task"></i>
                    <span>我的任务</span>
                </a>
            </dd>
            
            
            <dd class="dl_dd">
                <a class="text_fifteen" href="${ctx}/personaINewsweb/news.do">
                    <i class="member_icon me_message"></i>
                    <span>我的消息</span>
                </a>
            </dd>
            <dd class="dl_dd">
                <a class="text_fifteen" href="${ctx}/personaIWdjfweb/wdjf.do">
                    <i class="member_icon me_jifen"></i>
                    <span>我的积分</span>
                </a>
            </dd>
        </dl>
        <div class="left_active">
            <ul class="clearfix">
                <li><a href="" target="_blank"><img src="${ctx}/CQW/image/2018070208541043.jpg"></a></li>
                <li><a href="" target="_blank"><img src="${ctx}/CQW/image/2018060210183175.jpg"></a></li>
            </ul>
        </div>
        </div>
        <!--右侧内容-->
        <div class="invest_rig">
            <div class="invest_rig_top">
                <div class="user clearfix">
                    <div class="user_inner _left">
                        <div class="pic">
                            
                            <c:choose>
                              <c:when test="${not empty HeadportraitCS}">
                                <img src="${ctx}/mainsy/getUserPicture.do?file=${HeadportraitCS}" style="box-shadow: 1px 1px 1px #949364;" onerror="this.onerror=null;this.src='${ctx}/CQW/image/user-o.png'">
                              </c:when> 
                              <c:otherwise>
                                <img src="${ctx}/CQW/image/user-o.png" style="box-shadow: 1px 1px 1px #949364;">
                              </c:otherwise>
                            </c:choose>
                         
                            
                            
                        </div>
                        <ul class="about" style="width: 60%">
                            <li class="name">
                                	你好,<cite>${SignUpNameCS}</cite>
                                <cite style="color: #999;font-size: 14px; margin-left: 15px;">欢迎登录！</cite>
                            </li>
                            <li class="tools clearfix">
                                <span class="r_item">
                                <!-- inBind 已完成        onBind 未完成 -->
                                    <a href="${ctx}/securityXXweb/Account.do">
                                     <c:choose><c:when test="${not empty PhonenumberCS}"> <i class="m-mobile inBind fz18" style="box-shadow: 2px 2px 8px #000;" title="手机已绑定"></i> </c:when> <c:otherwise> <i class="m-mobile onBind fz18" style="box-shadow: 2px 2px 8px #000;" title="手机未绑定"></i>   </c:otherwise> </c:choose>
                                    </a>
                                    <a href="${ctx}/securityXXweb/Account.do">
                                     <c:choose><c:when test="${not empty MailboxCS}"> <i class="m-email inBind" style="box-shadow: 2px 2px 8px #000;" title="邮箱已绑定"></i> </c:when> <c:otherwise> <i class="m-email onBind" style="box-shadow: 2px 2px 8px #000;" title="邮箱未绑定"></i> </c:otherwise> </c:choose>
                                    </a>
                                    <a href="${ctx}/securityXXweb/Account.do">
                                     <c:choose><c:when test="${not empty IdnumberCS}"> <i class="m-user inBind" style="box-shadow: 2px 2px 8px #000;" title="身份已认证"></i> </c:when> <c:otherwise> <i class="m-user onBind" style="box-shadow: 2px 2px 8px #000;" title="身份未认证"></i> </c:otherwise> </c:choose>
                                    </a>
                                    <a href="${ctx}/securityXXweb/Account.do">
                                     <c:choose><c:when test="${not empty BankcardCS}"> <i class="m-credit-card inBind" style="box-shadow: 2px 2px 8px #000;" title="银行卡已绑定"></i> </c:when> <c:otherwise> <i class="m-credit-card onBind" style="box-shadow: 2px 2px 8px #000;" title="银行卡未绑定"></i>   </c:otherwise> </c:choose>
                                    </a>
                                </span>
                            </li>
                        </ul>
                    </div>
                    <div class="user_sign _right"> <!--  target="_blank" -->
                        <a class="user_sign_btn" href="${ctx}/loginweb/signin.do" ><i class="member_icon me_sign"></i>签到领积分</a>
                        <span class="user_sign_text">
                                                                       今日
                            <c:choose><c:when test="${not empty qiandao}"> <span class="user_sign_color">已签到</span></c:when> <c:otherwise><span class="user_sign_color">未签到</span></c:otherwise> </c:choose>
                            
                           
                            <i>|</i> 积分
                            <span class="user_sign_color">${wdjfjlb.signintegral+wdjfjlb.integral}</span>
                        </span>
                    </div>
                </div>
                <!---->
                <div class="member_del" style="background:#fff; height: 180px;border-bottom: 1px solid #e5e5e5;">
                    <div class="row">
                    	<div class="col-lg-5"><span style="margin-top:30px;margin-left:30px;"><span class="font-1">性别:</span><span style="margin-left:50px;">${signuptable.sex?'女':'男'}</span></span></div>
                        <div class="col-lg-5"><span style="margin-top:50px;margin-left:10px;"><span class="font-1">出生年月:</span><span style="margin-left:20px;"><fmt:formatDate value="${signuptable.yearofbirth}" pattern="yyyy-MM-dd"/></span></span></div>
                    </div>
                    <div class="row" style="margin-top:20px;">
                    	<div class="col-lg-5"><span style="margin-top:30px;margin-left:30px;"><span class="font-1">情感状态:</span><span style="margin-left:20px;">${signuptable.emotionalstatus}</span></span></div>
                        <div class="col-lg-5"><span style="margin-top:50px;margin-left:10px;"><span class="font-1">所在职业:</span><span style="margin-left:20px;">${signuptable.occupation}</span></span></div>
                    </div>
                    <div class="row" style="margin-top:20px;">
                    	<div class="col-lg-10"><span style="margin-top:30px;margin-left:30px;"><span class="font-1">现居住地:</span><span style="margin-left:20px;">${Livingreq}</span></span></div>
                    </div>
                    <div class="row" style="margin-top:20px;">
                        <div class="col-lg-10"><span style="margin-top:30px;margin-left:30px;"><span class="font-1">家乡地址:</span><span style="margin-left:20px;">${Homeaddressreq}</span></span></div>
                    </div>
                </div>
                <div class="member_del">
                    <ul class="clearfix">
                        <li>
                            <span class="fz18 color3 mb20">总资产</span>
                            <span class="fz24 color1 mb35">${zong}<i class="world">元</i></span>
                            <span class="fz18 color3">投资平台数量：<i class="fz18 color1">${conpanytable}</i><i class="world">个</i></span>
                        </li>
                        <li>
                            <span class="fz18 color3 mb20">返利冻结中</span>
                            <span class="fz24 color1 mb35">${RebateFreezeCS}<i class="world">元</i></span>
                            <span class="fz18 color3">冻结时间为3~5天</span>
                        </li>
                        <li>
                            <span class="fz18 color3 mb20">提现冻结中</span>
                            <span class="fz24 color1 mb35">${TXFreezeCS}<i class="world">元</i></span>
                            <span class="fz18 color3">2个小时之内到账</span>
                        </li>
                        <li>
                            <span class="fz18 color3 mb20">可用余额</span>
                            <span class="fz24 color1 mb35">${SumCS}<i class="world">元</i></span>
                        </li>
                    </ul>
                </div>
                <div class="member_month">
                    <span>
                        <em class="member_icon me_m mr8"></em>
                        <em><font class="fz18">累计投资总额：</font><font class="fz24">${lump}</font><i class="world">元</i></em>
                    </span>
                    <span style="margin-left: 100px;">
                        <em class="member_icon me_c mr8"></em>
                        <em><font class="fz18">累计返利收益：</font><font class="fz24">${sum}</font><i class="world">元</i></em>
                    </span>
                </div>
            </div>
    	</div>
    </div>
    <footer>
   
	    <div style="background:#333!important;" class="clearfix">
	    <div class="footer_center clearfix">
		    <div class="footer_left">
			    <dl>
				    <dt><i class="icon icon_about mr12"></i>关于我们</dt>
				    <dd><a href="">了解返利</a></dd>
				    <dd><a href="">加入返利</a></dd>
				    <dd><a href="">联系返利</a></dd>
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
				    <dd><a href="">广告主注册</a></dd>
			    </dl>
			    <dl style="margin-right: 20px;">
				    <dt><i class="icon icon_see mr12"></i>关注我们</dt>
				    <dd style="height:88px; padding-left: 25px;"><img src="${ctx}/CQW/image/weixin.png">
					    <img src="${ctx}/CQW/image/weikefu.jpg" style="margin-left:10px;width:88px;height:88px;"></dd>
				    <dd><a href="javascript:;">微信公众号</a><a href="javascript:;" style="margin-left:40px;">微信客服</a></dd>
			    </dl>
		    </div>
		    <div class="footer_rig">
			    <dl>
				    <dt><i class="icon icon_service"></i>服务支持</dt>
				    <dd class="fz30 color3">000-000-0000</dd>
				    <!-- <dd class="mt10">返利网QQ群：<strong></strong></dd> -->
				    <dd class="mt10">服务时间：<strong>9:00-18:00</strong></dd>
				    <dd class="mt12">投资有风险 理财需谨慎</dd>
			    </dl>
		    </div>
	    </div>
	    <div class="footer_copyright">
		    <div class="copyright">版权所有：头号（北京）科技有限公司 © CopyRight 2014-2016 www..com .All Rights Reserved. 京ICP备00000000			
            &nbsp;&nbsp;
         
           
		    </div>
		    <div class="copyright_tags">
			    <span><img src="${ctx}/CQW/image/copy1.png"></span>
			    <span><img src="${ctx}/CQW/image/copy2.png"></span>
			    <span><img src="${ctx}/CQW/image/copy3.png"></span>
		    </div>
	    </div>
	    </div>	
	</footer>
	
	<script type="text/javascript" src="${ctx}/CQW/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/yii.js"></script>
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
    <%-- <script type="text/javascript" src="${ctx}/CQW/laydate.js"></script> --%>
    <script type="text/javascript" src="${ctx}/CQW/layer.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/toastr.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.qqFace.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/awardRotate.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.liMarquee.js"></script>
    <script type="text/javascript">
    jQuery(document).ready(function () {

     $(function() {
         
        //当前菜单高亮
        var curHref = window.location.href.split('/').pop();
        if(curHref == 'investRecord.html' || curHref == 'incomeDet.html' || curHref == 'investRepair.html'){
            curHref = 'invest.html';
        }
        if(curHref == 'shopRecode.html' || curHref == 'inforMation.html'){
            curHref = 'accountInfo.html';
        }
        $('.nav >ul >li a').each(function() {
            var _thisHref= $(this).attr('href');
            if (_thisHref.split('/').pop() === curHref) {
                $(this).parent('li').addClass('current');
            }
        });
     });


     $(function() {
        //当前菜单高亮
        var curHref = window.location.href.split('/').pop();

        $('.member_left >dl >dd a').each(function() {

            var _thisHref= $(this).attr('href');

            var _parentDiv = $(this).parents('dd');

            if(curHref === 'investRecord.html' || curHref === 'investRepair.html' || curHref === 'wdApply.html'){
                
                if(_thisHref.split('/').pop() === curHref){
                    $(this).addClass('curin');
                }
                _parentDiv.find('#member_invest').addClass('curin');
                $('.member_touzis').show(300);

            }else if(_thisHref.split('/').pop() === curHref) {
                $(this).addClass('curin');
            }
        });

        $('#member_invest').on('click',function(){
            $('.member_touzis').slideToggle();
        });
     });



	    $(function(){
	        $(window).scroll(function(){
	            offset = $('.placeholder').offset();//不能用自身的div,不然滚动起来会很卡
	            if($(window).scrollTop()>offset.top){
	                $('.header_top').css({
	                'position':'fixed',
	                'top':'0px',
	                'left':offset.left+'px',
	                'width':'100%',
	                'z-index':'9999'
	                });    
	            }else{
	                $('.header_top').removeAttr('style');
	            }
	        });
	        $('.view_wap').hover(function(){
	            $('.web_wap').fadeIn(300);
	        },function(){
	            $('.web_wap').fadeOut(300);
	        });
	    })	
    });
    
    //签到跳转页面
		$("#qiandao2").click(function() {
		window.location.href="${ctx}/servlet/loginServlet?fun=signin";
	  // var varstr = "${SESSION_USERone.signUpName}";
      // if( varstr !=null  && varstr !="" ){
           
      // }else{
      // layer.msg("您还没有登录！请先登录");
	  //location.href="${ctx}/servlet/loginServlet";
      //}
		});
		
		  //弹出修改窗体
    $("#btnUpdate").click(function(){
    	$("#mtUpdate").modal("toggle");
    });
    
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
    
    //账户安全
    function zhaq(){
    window.location.href="${ctx}/securityXXweb/Account.do";
    }
    
</script>
  </body>
</html>
