<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head> 
    <title>投资详情-返利网</title>
    
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
		<!-- 滚动条变小 -->
	<style type="text/css">
		::-webkit-scrollbar {
			width: 14px;
			height: 14px;
		}
		
		::-webkit-scrollbar-track,::-webkit-scrollbar-thumb {
			border-radius: 999px;
			border: 5px solid transparent;
		}
		
		::-webkit-scrollbar-track {
			box-shadow: 1px 1px 5px rgba(0, 0, 0, .2) inset;
		}
		
		::-webkit-scrollbar-thumb {
			min-height: 20px;
			background-clip: content-box;
			box-shadow: 0 0 0 5px rgba(0, 0, 0, .2) inset;
		}
		
		::-webkit-scrollbar-corner {
			background: transparent;
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
				<a href=""><img class="bot_left" src="${ctx}/CQW/image/LOGO.png"></a>	
				<div class="nav_list">
					 <ul>
						   <li class="navCur"><a href="${ctx}/servlet/loginServlet?fun=MainIndex">首页</a></li>
	                       <li><a href="${ctx}/servlet/renwuServlet?fun=renwu">任务大厅</a><i class="hot" style="top: 25px; right: -8px;"><img src="${ctx}/CQW/image/bgicon.gif"></i></li>
	                       <li>
	                           <a href="${ctx}/servlet/zFStoreServlet?fun=JFmain">积分商城</a>
	                           <i class="hot" style="top: 25px; right: -8px;"><img src="${ctx}/CQW/image/u_new.gif"></i>
	                       </li>
	                       <li><a href="">理财返利</a></li>
	                       <li><a href="">网贷资讯</a></li>
	                       <li><a href="">新手指南</a></li>
	                       <li>
	                         <c:choose><c:when test="${not empty SignUpIdCS}"> <a href="${ctx}/servlet/personalServlet?fun=wdzl"> </c:when> <c:otherwise> <a onclick="layer.msg('请先登录')">   </c:otherwise> </c:choose>
	                       <i class="account mr15"><img src="${ctx}/CQW/image/user-o.png"></i>我的账户</a></li>
	                 </ul>
				</div>			
			</div>
		</div>
	</header>
        <div class="plat_main mb30">
	    <!--位置导航-->
	    <div class="content_menu">
		    <div class="content_menu_cen text_shisan">
			    您的位置： <a href="${ctx}/servlet/loginServlet?fun=MainIndex">首页</a><i class="fa fa-angle-right fz16 m4"></i>
			    平台<i class="fa fa-angle-right fz16 m4"></i>${conpanytable.website}</div>
	        </div>
	    <!--位置导航结束-->
	    <div class="plat_t"></div>
	    <div class="plat_top">
		    <div class="ll">
			    <img src="${ctx}/mainsy/getUserPicturecon.do?file=${conpanytable.picture}">
			    <div class="plat_u">
				    <span> ${conpanytable.servicelife}老平台  ${conpanytable.safeguardmode}  ${conpanytable.projecttype}</span>
			    </div>
			     <a  onclick="tzsb()" target="_self">投资申报</a> 
		    </div>
		    <div class="rr">
			    <div class="rr_top">
				    <h3>${conpanytable.website}</h3>
				    <span><em>${conpanytable.companyname}</em><em>信用评级：<i style="color:red;">A级</i></em></span>
			    </div>
			    <div class="rr_bottom">
				    <span>
					    <em>综合年化最高</em>
					    <em class="fz22">${conpanytable.platformyear}</em>
				    </span>
				    <span>
					    <em>注册资本</em>
					    <em class="fz22">${conpanytable.registeredcapital}<i class="fz12">万元</i></em>
				    </span>
				    <span>
					    <em style="margin-bottom: 35px;">运营年限</em>
					    <em>${conpanytable.servicelife}</em>
				    </span>
				    <span>
					    <em style="margin-bottom: 35px;">平台地址</em>
					    <em>${conpanytable.address}</em>
				    </span>
				    <a   href="javascript:;" onclick="qtz('${conpanytable.companyid}')"  class="go_to" target="_self">去投资</a>
			    </div>
		    </div>
	    </div>
	    <div id="platlist" class="plat_product">
		    <div class="hd">
	            <ul>
	        	    <li class="on"><i></i>大额返利奖励</li>
	            </ul>
	        </div>
	        <div class="bd">
	    	    <div>
	        	    <ul class="plat-li">
	        		    <li>
	            		    <span class="t">
	            			    <em><i>投资金额</i><i class="fz24 color11">10000<font class="fz14 color11">元</font></i></em>
	            			    <em><i>投资期限</i><i class="fz24 color11">1<font class="fz14 color11">个月</font></i></em>
	            		    </span>
	            		    <span class="m">
	            			    <div>
	            				    <em><i class="fz20">120.00<font class="fz14">元</font></i></em>
	            				    <em>返利返利</em>
	            			    </div>
	            			    <div>
	            				    <em class="add">+</em>
	            			    </div>
	            			    <div>
	            			        <em><i class="fz20">75.00<font class="fz14">元</font></i></em>
	            			        <em>平台利息</em>
	            			    </div>
	            			    <div>
	            			        <em class="add">+</em>
	            			    </div>
	            			    <div>
	            			        <em><i class="fz20">15<font class="fz14">元</font></i></em>
	            			        <em>平台活动</em>
	            			    </div>
	            			    <div>
	            			        <em class="add">=</em>
	            			    </div>
	            			    <div>
	            			        <em><i class="fz20 color11">210.00 <font class="fz14 color11">元</font></i></em>
	            			        <em class="color11">总收益</em>
	            			    </div>
	            		    </span>
	            		    <span class="n">
	            			    <div>
	            				    <em><i class="fz20">${conpanytable.platformyear}</i></em>
	            				    <em>平台年化</em>
	            			    </div>
	            			    <div>
	            				    <em class="addimg"><img src="${ctx}/CQW/image/jiantou.png"></em>
	            			    </div>
	            			    <div>
	            			        <em><i class="fz20 color11">${conpanytable.reward}</i></em>
	            			        <em class="color11">返利后综合年化</em>
	            			    </div>
	            		    </span>
	            	    </li>
	            	    <li>
	            		    <span class="t">
	            			    <em><i>投资金额</i><i class="fz24 color11">10000<font class="fz14 color11">元</font></i></em>
	            			    <em><i>投资期限</i><i class="fz24 color11">3<font class="fz14 color11">个月</font></i></em>
	            		    </span>
	            		    <span class="m">
	            			    <div>
	            				    <em><i class="fz20">200.00<font class="fz14">元</font></i></em>
	            				    <em>返利返利</em>
	            			    </div>
	            			    <div>
	            				    <em class="add">+</em>
	            			    </div>
	            			    <div>
	            			        <em><i class="fz20">275.00<font class="fz14">元</font></i></em>
	            			        <em>平台利息</em>
	            			    </div>
	            			    <div>
	            			        <em class="add">+</em>
	            			    </div>
	            			    <div>
	            			        <em><i class="fz20">30<font class="fz14">元</font></i></em>
	            			        <em>平台活动</em>
	            			    </div>
	            			    <div>
	            			        <em class="add">=</em>
	            			    </div>
	            			    <div>
	            			        <em><i class="fz20 color11">505.00 <font class="fz14 color11">元</font></i></em>
	            			        <em class="color11">总收益</em>
	            			    </div>
	            		    </span>
	            		    <span class="n">
	            			    <div>
	            				    <em><i class="fz20">${conpanytable.platformyear}</i></em>
	            				    <em>平台年化</em>
	            			    </div>
	            			    <div>
	            				    <em class="addimg"><img src="${ctx}/CQW/image/jiantou.png"></em>
	            			    </div>
	            			    <div>
	            			    <em><i class="fz20 color11">${conpanytable.reward}</i></em>
	            			    <em class="color11">返利后综合年化</em>
	            			    </div>
	            		    </span>
	            	    </li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <div class="plat_tishi">
		    <p>注：以上只是部分投资方案，实际返利金额请根据下面投资规则计算</p>
	    </div>
	    <div id="platrule" class="plat_product">
		    <div class="hd">
	            <ul>
	        	    <li style="width:231px" class="on"><i style="width:215px"></i>投资攻略</li>
	        	    <li style="width:231px"><i style="width:215px"></i>平台介绍</li>
	            </ul>
	        </div>
	        <div class="bd" style="padding:20px 30px;">
	            <div>
	        	    <div class="platstep">
	        		    <h4><img src="${ctx}/CQW/image/p1.png" alt="">投资流程</h4>
	        		    <div class="del">
	        			    <p style="box-sizing: border-box; font-family: 微软雅黑; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255); line-height: 2em;"><strong style="box-sizing: border-box; margin: 0px auto; padding: 0px;"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(255, 0, 0);">1、通过返利网【前去投资】进入注册；</span></strong></p><p line="aea5" style="box-sizing: border-box; font-family: 微软雅黑; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="box-sizing: border-box; margin: 0px auto; padding: 0px;"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(255, 0, 0);">2、一般情况下任意时刻都有标，如果没有的话请咨询平台客服；</span></strong></p><p line="ngWG" style="box-sizing: border-box; font-family: 微软雅黑; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="box-sizing: border-box; margin: 0px auto; padding: 0px;"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(255, 0, 0);">3、投资完毕后，在返利网本页面填写<strong style="color: rgb(102, 102, 102); font-family: 微软雅黑; font-size: 14px; white-space: normal; box-sizing: border-box; margin: 0px auto; padding: 0px;"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(255, 0, 0);"><strong style="color: rgb(102, 102, 102); box-sizing: border-box; margin: 0px auto; padding: 0px;"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(255, 0, 0);">投资申报</span></strong></span></strong>，等待银行卡返现；</span></strong></p><p line="nN8d" style="box-sizing: border-box; font-family: 微软雅黑; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><strong style="box-sizing: border-box; margin: 0px auto; padding: 0px;"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(255, 0, 0);"><span class="ql-author-8494955" style="box-sizing: border-box; margin: 0px auto; padding: 0px;">4、每次提交回单后，</span><strong class="ql-author-8494955" style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(77, 168, 238);">1</strong><strong class="ql-author-8135040" style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(77, 168, 238);">-3</strong><strong class="ql-author-8494955" style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(77, 168, 238);">个工作日处理返现</strong><strong class="ql-author-8135040" style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(77, 168, 238);">，节假日顺延</strong><span class="ql-author-8494955" style="box-sizing: border-box; margin: 0px auto; padding: 0px;">；</span></span></strong></p><p><strong style="box-sizing: border-box; margin: 0px auto; padding: 0px;"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(255, 0, 0);"><span class="ql-author-8494955" style="box-sizing: border-box; margin: 0px auto; padding: 0px;"><br></span></span></strong></p><p><br></p>
                        </div>
	        	    </div>
	        	    <div class="platstep">
	        		    <h4><img src="${ctx}/CQW/image/p2.png" alt="">投资规则</h4>
	        		    <div class="del">
	        			    <p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;"><strong><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(227, 108, 9);">1、1月标定额10000元，3月标定额10000元，只限首投；</span></strong></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;"><strong><span style="font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(227, 108, 9);">2、以上投资方案为举例，实际返利按有效投资金额*1.2%（1月），投资金额*2%（3月）；</span></strong></span></p><p><span style="font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; font-size: 14px;"><strong><span style="font-size: 14px; font-family: 微软雅黑, &quot;Microsoft YaHei&quot;; color: rgb(227, 108, 9);">3、投资有返利的标的是【新手标、普通项目1月标、3月标】;标的只允许【首投】(第一次投资标的有返利),复投、续投无效。</span></strong></span></p><p><br></p>
                        </div>
	        	    </div>
	        	    <div class="platstep">
	        		    <h4><img src="${ctx}/CQW/image/p3.png" alt="">特别注意</h4>
	        		    <div class="del">
	        			    <p style="box-sizing: border-box; font-family: 微软雅黑; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(227, 108, 9);">1、为了您的投资有返利,首次注册理财平台时,保持手机号码、身份信息和返利网一致（注册信息错误，不可获得返利）。</span></p><p style="box-sizing: border-box; font-family: 微软雅黑; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(227, 108, 9);">2、跳转后投资人必须核查标的信息是否正确，如果投错了标的或超出标的限额部分的不计算返利。</span></p><p style="box-sizing: border-box; font-family: 微软雅黑; margin-top: 0px; margin-bottom: 0px; padding: 0px; color: rgb(102, 102, 102); font-size: 14px; white-space: normal; background-color: rgb(255, 255, 255);"><span style="box-sizing: border-box; margin: 0px auto; padding: 0px; color: rgb(227, 108, 9);">3、风险提示：理财有风险,投资需谨慎。请根据自身投资目的、投资期限、投资经验、资产状况等判断是否投资。</span></p><p><br></p>
                        </div>
	        	    </div>
	        	    <div class="platstep">
	        		    <h4><img src="${ctx}/CQW/image/p5.png" alt="">免责声明</h4>
	        		    <div class="del">
	        			    返利网仅为信息平台，合作平台不保证100%安全。
	        			    投资人根据自身资金和风险承受情况，进行分散投资，返利网不对用户投资平台承担本息或本金的全额保障！
	        			    温馨提示：投资有风险，理财需谨慎！
	        		    </div>
	        	    </div>
	            </div>
	            <div style="display: none;">	               
	               <table cellspadding="0" cellspacing="0">
					    <tbody>
						    <tr class="text_two">
							    <td width="346px">公司名称：
								    <span class="text_one">${conpanytable.companyname}</span>
							    </td>
							    <td width="346px">公司简称：
							    	<span class="text_one">${conpanytable.website}</span></td>
							    <td>资金托管：
							    	<span class="text_one">${conpanytable.safeguardmode}</span></td>
						    </tr>
						    <tr class="text_two">
							    <td>充值费用： <span class="text_one"> 无 </span> </td>
							    <td>提现费用： <span class="text_one"> 无 </span> </td>
							    <td>债权转让： <span class="text_one"> 无 </span> </td>
						    </tr>
						    <tr class="text_two">
							    <td colspan="2">公司地址：<span class="text_one">${conpanytable.address}</span></td>
						    </tr>
					    </tbody>
				    </table>
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
					<dd class="mt10">服务时间：<strong>9:00-18:00</strong></dd>
					<dd class="mt12">投资有风险 理财需谨慎</dd>
				</dl>
			</div>
		</div>
		<div class="footer_copyright">
			<div class="copyright"> 版权所有：头号（北京）科技有限公司 © CopyRight 2014-2016 www..com .All Rights Reserved. 京ICP备00000000		
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
   <%--  <script type="text/javascript" src="${ctx}/CQW/laydate.js"></script> --%>
    <script type="text/javascript" src="${ctx}/CQW/layer.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/toastr.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.qqFace.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/awardRotate.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.liMarquee.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {

            $(function(){
               jQuery('#platlist,#platrule').slide({trigger:'click'});
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
        
        //投资申报
        function tzsb(){
        var hyID="${SignUpIdCS}";
        if(hyID !=""){
        window.location.href="${ctx}/perInvestmentweb/PerInvestCX.do";
        }else{
          layer.msg("请先登录！");
        }
        
        }
        
        //去投资
        function qtz(strint){
       var hyID="${SignUpIdCS}";
      
        if(hyID !=""){
        window.location.href="${ctx}/detailsweb/Investment.do?Deta="+strint;
        }else{
          layer.msg("请先登录！");
        }
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
