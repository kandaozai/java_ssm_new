<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head>
  	<title>用户签到-返利网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
    <meta property="og:type" content="image">
	<link rel="stylesheet" href="${ctx}/CQW/bootstrap.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/personal.css" type="text/css"></link>
	<%-- <link rel="stylesheet" href="${ctx}/CQW/font-awesome.min.css" type="text/css"></link> --%>
	<link rel="stylesheet" href="${ctx}/CQW/site.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/forum.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/cropbox.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/dropload.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/bootstrap-slider.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/toastr.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/guide.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/liMarquee.css" type="text/css"></link>
	<%-- <link rel="stylesheet" href="${ctx}/CQW/laydate.css" type="text/css"></link> --%>
	<%-- <link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css" id="LayDateSkin"></link> --%>
	<link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css" id="layui_layer_skinlayercss"></link>
 
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
                       <li>
                         <c:choose><c:when test="${not empty SignUpIdCS}"> <a href="${ctx}/personalWeb/wdzl.do"> </c:when> <c:otherwise> <a href="javascript:;" onclick="layer.msg('请先登录')">   </c:otherwise> </c:choose>
                         <c:choose><c:when test="${not empty HeadportraitCS}"> <i class="account mr15"><img src="${ctx}/mainsy/getUserPicture.do?file=${HeadportraitCS}" onerror="this.onerror=null;this.src='${ctx}/CQW/image/user-o.png'"></i> </c:when> <c:otherwise><i class="account mr15"><img src="${ctx}/CQW/image/user-o.png"></i></c:otherwise> </c:choose>
                                                                                         我的账户</a>
                       </li>
					</ul>
				</div>
				
			</div>
		</div>
		</header><div class="shop mb30 clearfix">
	    <div class="sign_banner">
	    	<div class="sign_box">
	    		<div class="sign_user">
	    			<div class="sign_user_head">
	    			    <img <c:choose><c:when test="${signuptable.headportrait != null}">src="${ctx}/mainsy/getUserPicture.do?file=${signuptable.headportrait}" onerror="this.onerror=null;this.src='${ctx}/image/WT.png'" </c:when> <c:otherwise> src="${ctx}/CQW/image/user-o.png"  </c:otherwise> </c:choose>    >
	    			</div>
	    			<div class="sign_user_info">尊敬的${signuptable.signupname}，欢迎回来！</div>
	                    <div class="sign_user_btn" id="butnqdaodiv" > ${PDQD==true?"<a href='javascript:;' onclick='yqd()'>已签到   </a>":"<a style='cursor: pointer' onclick='ingz();'>未签到   </a>"}    </div>
	                    <div class="sign_tongji">
	    				<span><em><i class="oo"></i>本月累计签到</em><em class="_right">${signtable1.signdate}天</em></span>
	    				<span><em><i class="cc"></i>用户累计积分</em><em class="_right">${signtable1.integral + signtable1.signintegral}分</em></span>
	    			</div>
	    		</div>
	    	</div>
	    </div>
	    <div class="sign_rules mt20">
	    	<div class="top" >
	    		<h3>我的本月签到</h3>
	    		<div class="buqian" style="display: none;"><a href="javascript:resign(0);" >补签×0</a></div>
	    	</div>
	    	<div class="center clearfix"  id="moonday" >
	    	
	    	
	        </div>	
	     
  
	    </div>
	    <div class="sign_rules_desc mt20">
	    	<h3>签到规则</h3>
	    	<div class="txt">
	    	<p>1.签到达到相应累计天数可获得对应奖励，如红包卷为两元。</p>
	    	<p>2.签到信息按月清除。</p>
			<!-- <p>2.签到当月累计投资满5W元获赠3次补签机会，确认投资成功后可在当月使用</p> -->
	        <p>3.在法律允许范围内，最终解释权归返利网所有。</p>
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
          function JZ(){
       // $("#moonday")  天数${intmaxDate}    签到天数${signtable1.signdate}
		   var content="";
		  for(var A=0;A<${intmaxDate};A++){
		      if((A+1) !=1 && (A+1) %5!=0 && A!=0){
		      if((A+1)<=${signtable1.signdate}){
		      content += "<span><i class='j-f'> <b>1</b><p>积分</p></i><i class='y-q'></i><i class='red'>累计"+(A+1)+"天</i></span>"
		      }else{
		      content += "<span><i class='j-d'><b>1</b><p>积分</p></i><i class='y-d'></i><i class='gray'>累计"+(A+1)+"天</i></span>"
		      }
		      }else{
		        if(((A+1) ==1 || (A+1) %5 == 0)&& A<${signtable1.signdate}){
		      content += "<span><i class='j-r' style='padding-top: 30px;'></i><i class='y-q'></i><i class='red'>累计"+(A+1)+"天</i></span>"
		      }else{
		      content += "<span><i class='j-r-c' style='padding-top: 30px;'></i><i class='y-d'></i><i class='gray'>累计"+(A+1)+"天</i></span>"
              }
		      }
		  }
		 $("#moonday").html(content);
    }
		 window.onload = JZ;//加载完页面执行
        
        function ingz(){//进行判断发送红包
       // int ID=${signtable1.signid};//签到ID
       // window.location.href="${ctx}/servlet/loginServlet?fun=intsign&ID="+ID;
          $.ajax(
            {
                url:"${ctx}/loginweb/intsign.do",
                data: {},
                dataType:"json",
                type:"GET",
               success:function(data)
               {
               //1.成功的处理
                if (data.state == true) {
                   layer.msg("签到成功！");
                   setTimeout('location.reload()',2000); //指定后 2秒刷新
			      
			                } else {
                    layer.msg("签到失败！");
                             }
                }
              });
        
        
        };
        
        function yqd(){
           layer.msg("已签到");
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
        
        </script>
    </body>
</html>
