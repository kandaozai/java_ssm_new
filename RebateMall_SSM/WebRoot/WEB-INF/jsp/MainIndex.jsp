<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head>    
    <title>返利网 理财返利第一站！网贷返利,p2p返利,国内首家理财返利平台！</title>
    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
	<link rel="stylesheet" href="${ctx}/CQW/bootstrap.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/personal.css" type="text/css"></link>
<%-- 	 <link rel="stylesheet" href="${ctx}/CQW/font-awesome.min.css" type="text/css"></link>  --%>
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
					<span id="weixin" style="margin-left: 1px;" class="weixin_h">
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
	<%-- <script type="text/javascript" src="${ctx}/CQW/hm.js"></script> --%>
	<script type="text/javascript" src="${ctx}/CQW/echarts.min.js"></script>
	<div class="site">
	    <!--幻灯片-->
	    <div class="banner">
	        <ul class="banner_box">
	            <li ><a href="" style="background:url(${ctx}/image/2018060914564796.jpg) center top no-repeat"></a></li>
	            <li ><a href="" style="background:url(${ctx}/image/2018072516372777.jpg) center top no-repeat"></a></li>
	            <li ><a href="" style="background:url(${ctx}/image/2018080113451743.jpg) center top no-repeat"></a></li>
	        </ul>
		    <div class="lubo_btn" style="display: block;color: white;">
			    <div class="left_btn"><i>&lt;</i></div>
			    <div class="right_btn"><i>&gt;</i></div>
		    </div>
	    </div>
	    <!--幻灯片结束-->
	  
	    <!--网站标识-->
	    <div class="web_tags">
	        <div class="web_tags_nr">
	            <div class="web_tags_nrTop clearfix">
	                <ul>
	                    <li><span class="color6 fb"><font class="fz24">503843.13</font>万</span><span>累计总投资金额</span></li>
	                    <li><span class="color6 fb"><font class="fz24">67120688.64</font>元</span><span>为投资人多赚</span></li>
	                    <li><span class="color6 fb"><font class="fz24">52164</font>人</span><span>累计注册人数</span></li>
	                    <li><span class="color6 fb"><font class="fz24">25.8</font>%</span><span>平均综合收益</span></li>
	                </ul>
	            </div>
	        </div>
	    </div>
	    <!--网站标识结束-->
	
	    <!--大额专区-->
	    <div class="novice">
	        <div class="novice_top mt10 clearfix">
	            <div class="novice_topLeft">
	                <h3>大额专区</h3><cite class="tag_txt">大额投资可以获得返利</cite>
	            </div>
	            <div class="novice_topRig"><a href="" class="color6">更多&nbsp;<i class="fa fa-angle-right fz16"></i></a></div>
	        </div>
	        <div class="novice_list clearfix">
	        
	        
	        <c:forEach items="${conpanytable1}" var="conpanytable1">
	             <div class="clear-fix">
                    <div class="bian"><span>A+级</span></div>
                    <div class="plat_head clearfix">
                        <div class="plat_head_co">
                       <span><img src="${ctx}/mainsy/getUserPicturecon.do?file=${conpanytable1.picture}" width="151px" height="38px"></span> 
                        </div>
                    </div>
                    <div class="plat_bian">
                        <em>${conpanytable1.projecttype}</em>
                        <em>运营时间${conpanytable1.servicelife}</em>
                        <em>${conpanytable1.safeguardmode}保障</em>
                    </div>
                    <div class="pro_nr">
                        <h3>投资10000可得${1000*(conpanytable1.reward + conpanytable1.companyrebate)}</h3>
                        <div class="pro_nrS">
                            <span>
                                <em class="_left"><i class="fz14 color666">${conpanytable1.platformyear}</i><i class="fz12 color3 mt5">平台年化</i></em>
                                <em class="_right"><i class="fz16 color4"><fmt:formatNumber maxFractionDigits="2" value="${conpanytable1.reward*100}"></fmt:formatNumber>%</i><i class="fz12 color4 mt5">平台奖励</i></em>   
                            </span>
                            <span style="margin-top: 36px;">
                                <em class="_left"><i class="fz16 color666">${conpanytable1.registeredcapital}万</i><i class="fz12 color3 mt5">注册资金</i></em>
                                <em class="_right"><i class="fz16 color666"><fmt:formatNumber maxFractionDigits="2" value="${conpanytable1.companyrebate*100}"></fmt:formatNumber>%</i><i class="fz12 color3 mt5">公司返利</i></em>
                            </span>
                        </div>
                        <a target="_blank" class="btn_a1 btn_bg"  href="${ctx}/detailsweb/Details.do?Deta=${conpanytable1.companyid}">立即查看</a>
                    </div>
                </div>
	        <!-- ${ctx}/servlet/detailsServlet?fun=Details -->
	        </c:forEach>
	        
	        
              </div>
	    </div> 
	    <!--大额专区结束-->
	    <!--小额专区-->
	    <div class="spro">
	        <div class="spro_top mt10 clearfix">
	            <div class="spro_topLeft">
	                <h3>小额专区</h3><cite class="tag_txt">小额投资 均可获得返利</cite>
	            </div>
	            <div class="spro_topRig"><a href="" class="color6">更多&nbsp;<i class="fa fa-angle-right fz16"></i></a></div>
	        </div>
	        
	        <div class="spro_list clearfix">
              
                 <c:forEach items="${conpanytable2}" var="conpanytable2">
	             <div class="clear-fix">
                    <div class="bian"><span>A+级</span></div>
                    <div class="plat_head clearfix">
                        <div class="plat_head_co">
                         <span><img src="${ctx}/mainsy/getUserPicturecon.do?file=${conpanytable2.picture}" width="151px" height="38px"></span> 
                       
                        </div>
                    </div>
                    <div class="plat_bian">
                        <em>${conpanytable2.projecttype}</em>
                        <em>运营时间${conpanytable2.servicelife}</em>
                        <em>${conpanytable2.safeguardmode}保障</em>
                    </div>
                    <div class="pro_nr">
                        <h3>投资10000可得${1000*(conpanytable2.reward + conpanytable2.companyrebate)}</h3>
                        <div class="pro_nrS">
                            <span>
                                <em class="_left"><i class="fz14 color666">${conpanytable2.platformyear}</i><i class="fz12 color3 mt5">平台年化</i></em>
                                <em class="_right"><i class="fz16 color4"><fmt:formatNumber maxFractionDigits="2" value="${conpanytable2.reward*100}"></fmt:formatNumber>% </i><i class="fz12 color4 mt5">平台奖励</i></em>   
                            </span>
                            <span style="margin-top: 36px;">
                                <em class="_left"><i class="fz16 color666">${conpanytable2.registeredcapital}万</i><i class="fz12 color3 mt5">注册资金</i></em>
                                <em class="_right"><i class="fz16 color666"><fmt:formatNumber maxFractionDigits="2" value="${conpanytable2.companyrebate*100}"></fmt:formatNumber>%</i><i class="fz12 color3 mt5">公司返利</i></em>
                            </span>
                        </div>
                        <a target="_blank" class="btn_a1 btn_bg" href="${ctx}/detailsweb/Details.do?Deta=${conpanytable2.companyid}">立即查看</a>
                    </div>
                </div>

	        </c:forEach>     
	       </div>
	    </div>
	    <!--小额专区结束-->	    
	    <!--定额专区-->
	    <div class="spro">
	        <div class="spro_top mt10 clearfix">
	            <div class="spro_topLeft">
	                <h3>定额专区</h3><cite class="tag_txt">定额投资 亦可获得返利</cite>
	            </div>
	            <div class="spro_topRig"><a href="" class="color6">更多&nbsp;<i class="fa fa-angle-right fz16"></i></a></div>
	        </div>
	        <div class="spro_list clearfix">
	        
	           <c:forEach items="${conpanytable3}" var="conpanytable3">
	             <div class="clear-fix">
                    <div class="bian"><span>A+级</span></div>
                    <div class="plat_head clearfix">
                        <div class="plat_head_co">
                        <span><img src="${ctx}/mainsy/getUserPicturecon.do?file=${conpanytable3.picture}" width="151px" height="38px"></span> 
                        </div>
                    </div>
                    <div class="plat_bian">
                        <em>${conpanytable3.projecttype}</em>
                        <em>运营时间${conpanytable3.servicelife}</em>
                        <em>${conpanytable3.safeguardmode}保障</em>
                    </div>
                    <div class="pro_nr">
                        <h3>投资50000可得${1000*(conpanytable3.reward + conpanytable3.companyrebate)}</h3>
                        <div class="pro_nrS">
                            <span>
                                <em class="_left"><i class="fz14 color666">${conpanytable3.platformyear}</i><i class="fz12 color3 mt5">平台年化</i></em>
                                <em class="_right"><i class="fz16 color4"><fmt:formatNumber maxFractionDigits="2" value="${conpanytable3.reward*100}"></fmt:formatNumber>%</i><i class="fz12 color4 mt5">平台奖励</i></em>   
                            </span>
                            <span style="margin-top: 36px;">
                                <em class="_left"><i class="fz16 color666">${conpanytable3.registeredcapital}万</i><i class="fz12 color3 mt5">注册资金</i></em>
                                <em class="_right"><i class="fz16 color666"><fmt:formatNumber maxFractionDigits="2" value="${conpanytable3.companyrebate*100}"></fmt:formatNumber>%</i><i class="fz12 color3 mt5">公司返利</i></em>
                            </span>
                        </div>
                        <a target="_blank" class="btn_a1 btn_bg" href="${ctx}/detailsweb/Details.do?Deta=${conpanytable3.companyid}">立即查看</a>
                    </div>
                </div>	        
	        </c:forEach>
	        
	        </div>
	    </div>
	    <!--定额专区结束-->
	    
	    <!--新闻资讯-->
	    <div class="news">
	        <div class="news_main clearfix">
	            <div class="news_type">
	                <div class="hd">
	                    <h3>热门帖子</h3><ul><li class="on">最新</li><li>精华</li></ul>
	                </div>
	                <div class="bd">
	                    <ul>
	                      <li><i>1</i><a href="" target="_blank">蚂蚁借呗怎么开通？如何快速提升借呗额...</a><cite class="count">10</cite></li>
	                      <li><i>2</i><a href="" target="_blank">一年交6000元社保，15年后退休金原来这...</a><cite class="count">6</cite></li>
	                      <li><i>3</i><a href="" target="_blank">P2P网贷是小额借贷吗？P2P网贷和小额借...</a><cite class="count">8</cite></li>
	                      <li><i class="gray">4</i><a href="" target="_blank">信用卡增加额度的方法有哪些速度比较快...</a><cite class="count">6</cite></li>
	                      <li><i class="gray">5</i><a href="" target="_blank">贷款申请技巧，如何100%下款？</a><cite class="count">9</cite></li>
	                      <li><i class="gray">6</i><a href="" target="_blank">在申请网络贷款前不能犯哪些错误？</a><cite class="count">10</cite></li>
	                      <li><i class="gray">7</i><a href="" target="_blank">新手怎样做好P2P网贷？先掌握这些的技...</a><cite class="count">9</cite></li>
	                      <li><i class="gray">8</i><a href="" target="_blank">适合小微企业的贷款平台有哪些，怎样申...</a><cite class="count">8</cite></li>
	                    </ul>
	                    <ul style="display: none;">
	                      <li><i>1</i><a href="" target="_blank">著名风投IDG看好的摇财树到底怎么样？</a><cite class="count">9090</cite></li>
	                      <li><i>2</i><a href="" target="_blank">论第三方p2p返利平台存在的必要性！</a><cite class="count">6642</cite></li>
	                      <li><i>3</i><a href="" target="_blank">返利圈子有奖发帖活动 开始啦！！！</a><cite class="count">4914</cite></li>
	                      <li><i class="gray">4</i><a href="" target="_blank">目前出的租售同权我的理解</a><cite class="count">3628</cite></li>
	                      <li><i class="gray">5</i><a href="" target="_blank">年轻人该如何投资？首次理财怎么选择</a><cite class="count">3598</cite></li>
	                      <li><i class="gray">6</i><a href="" target="_blank">投友们有不错的平台可以推荐吗？</a><cite class="count">3216</cite></li>
	                      <li><i class="gray">7</i><a href="" target="_blank">说说的现在的信用卡行业分析</a><cite class="count">1454</cite></li>
	                      <li><i class="gray">8</i><a href="" target="_blank">微信信用卡还款收费！超实用应对攻略在...</a><cite class="count">1285</cite></li>
	                    </ul>
	                </div>
	            </div>
	            <div class="news_type ml15">
	                <div class="hd">
	                    <h3>最新资讯</h3>
	                    <ul>
	                      <li class="on">P2P</li>
	                      <li>理财</li>
	                      <li>金融</li>
	                    </ul>
	                </div>
	                <div class="bd">
	                   <ul>
						<li><i>1</i><a href="" target="_blank">网贷返利：有些问题P2P平台为何不清盘</a><cite class="count">22</cite></li>
	                    <li><i>2</i><a href="" target="_blank">网贷返利：关于P2P网贷理财的3个问题</a><cite class="count">38</cite></li>
	                    <li><i>3</i><a href="" target="_blank">P2P死里逃生，我们要做好准备迎接行业...</a><cite class="count">58</cite></li>
	                    <li><i class="gray">4</i><a href="" target="_blank">监管火速出手整改，P2P能否走出“至暗...</a><cite class="count">95</cite></li>
	                    <li><i class="gray">5</i><a href="" target="_blank">怎么判断一个p2p平台靠谱？</a><cite class="count">42</cite></li>
	                    <li><i class="gray">6</i><a href="" target="_blank">如何鉴别可能涉及自融的P2P平台呢？</a><cite class="count">49</cite></li>
	                    <li><i class="gray">7</i><a href="" target="_blank">这轮兑付危机落幕后，P2P行业将走向何...</a><cite class="count">41</cite></li>
	                    <li><i class="gray">8</i><a href="" target="_blank">理财返利返利网为什么深受p2p理财者喜...</a><cite class="count">54</cite></li>
	                  </ul>
	                  <ul style="display: none;">
	                    <li><i>1</i><a href="" target="_blank">理财返利：p2p网贷未来将全面合规健康...</a><cite class="count">15</cite></li>
	                    <li><i>2</i><a href="" target="_blank">互联网理财需要养成哪些好习惯？</a><cite class="count">19</cite></li>
	                    <li><i>3</i><a href="" target="_blank">P2P雷潮不断，返利网凭什么“裸奔”？</a><cite class="count">35</cite></li>
	                    <li><i class="gray">4</i><a href="" target="_blank">没有理财基础不知道从何下手怎么办？</a><cite class="count">39</cite></li>
	                    <li><i class="gray">5</i><a href="" target="_blank">网贷返利：资金问题才是P2P理财行业问...</a><cite class="count">36</cite></li>
	                    <li><i class="gray">6</i><a href="" target="_blank">理财返利：最靠谱的避雷方式是分散投资</a><cite class="count">39</cite></li>
	                    <li><i class="gray">7</i><a href="" target="_blank">女性投资理财可以选择哪几种产品？</a><cite class="count">37</cite></li>
	                    <li><i class="gray">8</i><a href="" target="_blank">60%以上的家庭女性，更注重教育投资</a><cite class="count">63</cite></li>
	                  </ul>
	                  <ul style="display: none;">
	                    <li><i>1</i><a href="" target="_blank">流动保卫战拉开：高管“弯下腰”主动去...</a><cite class="count">13</cite></li>
	                    <li><i>2</i><a href="" target="_blank">理财返利：大雷潮并非行业危机，而是问...</a><cite class="count">34</cite></li>
	                    <li><i>3</i><a href="" target="_blank">理财返利：全面整治P2P网贷行业的问题...</a><cite class="count">29</cite></li>
	                    <li><i class="gray">4</i><a href="" target="_blank">理财返利：P2P行业爆雷并非商业模式出...</a><cite class="count">42</cite></li>
	                    <li><i class="gray">5</i><a href="" target="_blank">了解这些问题即可大幅度降低踩雷频率</a><cite class="count">35</cite></li>
	                    <li><i class="gray">6</i><a href="" target="_blank">中国互金协会公布网贷信息情况</a><cite class="count">37</cite></li>
	                    <li><i class="gray">7</i><a href="" target="_blank">2018究竟为何p2p频频暴雷</a><cite class="count">163</cite></li>
	                    <li><i class="gray">8</i><a href="" target="_blank">金银猫清盘雷 法人自首警方立案</a><cite class="count">51</cite></li>
	                  </ul>
	              </div>
	            </div>
	            <div class="news_type ml15">
	                <div class="hd">
	                    <h3>投资热点</h3>
	                </div>
	                <div class="bd">
	                   <div class="dowebok str_wrap str_vertical">
		                   <div class="str_move str_origin" style="top: -421.85px;">
		                        <ul class="tzrd-list">                              
		                           <li class="tzrd-item">139****606<span></span><span class="span">投资了(10000)元</span></li>
		                           <li class="tzrd-item">189****755<span></span><span class="span">投资了(2000)元</span></li>
		                           <li class="tzrd-item">135****696<span></span><span class="span">投资了(10000)元</span></li>
		                           <li class="tzrd-item">180****132<span></span><span class="span">投资了(10000)元</span></li>
		                           <li class="tzrd-item">159****616<span></span><span class="span">投资了(44950)元</span></li>
		                           <li class="tzrd-item">130****147<span></span><span class="span">投资了(77700)元</span></li>
		                           <li class="tzrd-item">136****610<span></span><span class="span">投资了(40000)元</span></li>
		                           <li class="tzrd-item">151****137<span></span><span class="span">投资了(30000)元</span></li>                              
		                           <li class="tzrd-item">130****147<span></span><span class="span">投资了(5000)元</span></li>
		                        </ul>
		                    </div>
	                  </div>
	               </div>
	            </div>
	        </div>
	    </div>
	    <!--新闻资讯结束-->
	    <!--合作伙伴-->
	    <div class="hezuo">
	        <div class="hezuo_main clearfix">
	            <div class="spro_top mt10 clearfix">
	                <div class="spro_topLeft">
	                    <h3>合作伙伴</h3>
	                </div>
	            </div>
	            <div class="hezuo_list clearfix">
	                <ul>                     
	                    <li><a href="" target="view_window" title="点牛金融"><img src="${ctx}/CQW/image/201807310914285.jpg"><i>综合年化<font class="color6">21.33%</font></i></a></li>                     
	                    <li><a href="" target="view_window" title="米庄理财"><img src="${ctx}/CQW/image/2018073110410677.jpg"><i>综合年化<font class="color6">17.19%</font></i></a></li>
	                    <li><a href="" target="view_window" title="温商贷"><img src="${ctx}/CQW/image/2017121313305648.png"><i>综合年化<font class="color6">21.60%</font></i></a></li>
	                    <li><a href="" target="view_window" title="宝象金融"><img src="${ctx}/CQW/image/2017110216482910.png"><i>综合年化<font class="color6">21.92%</font></i></a></li>
	                    <li><a href="" target="view_window" title="泰然金融"><img src="${ctx}/CQW/image/2018051717580399.jpg"><i>综合年化<font class="color6">23.56%</font></i></a></li>
	                    <li><a href="" target="view_window" title="鼎信贷"><img src="${ctx}/CQW/image/2018051718000664.jpg"><i>综合年化<font class="color6">19.20%</font></i></a></li>
	                    <li><a href="" target="view_window" title="网信"><img src="${ctx}/CQW/image/2017110216502250.png"><i>综合年化<font class="color6">99.99%</font></i></a></li>
	                    <li><a href="" target="view_window" title="团贷网"><img src="${ctx}/CQW/image/19ad642f1463042709543.png"><i>综合年化<font class="color6">11.50%</font></i></a></li>
	                    <li><a href="" target="view_window" title="摇财树"><img src="${ctx}/CQW/image/2018051718081324.jpg"><i>综合年化<font class="color6">23.44%</font></i></a></li>
	                    <li><a href="" target="view_window" title="你我贷"><img src="${ctx}/CQW/image/2018051718120891.jpg"><i>综合年化<font class="color6">16.12%</font></i></a></li>
	                    <li><a href="" target="view_window" title="向上金服"><img src="${ctx}/CQW/image/201807310916566.jpg"><i>综合年化<font class="color6">16.16%</font></i></a></li>
	                    <li><a href="" target="view_window" title="广信贷"><img src="${ctx}/CQW/image/2017110216504665.png"><i>综合年化<font class="color6">25.20%</font></i></a></li>
	               </ul>
	            </div>
	        </div>
	    </div>
	    <!--合作伙伴结束-->
	    <!--友情链接-->
	    <div class="friendLink mt30 mb30">
	        <div class="friendLink_main clearfix">
	            <ul>
	                <li class="links_first">友情链接：</li>
	                <li><a href="" title="绿麻雀返利系统" target="_blank">绿麻雀返利系统</a></li>
	                <li><a href="" title="P2P理财" target="_blank">P2P理财</a></li>
	                <li><a href="" title="小狗钱钱" target="_blank">小狗钱钱</a></li>
	                <li><a href="" title="理财返利平台" target="_blank">理财返利平台</a></li>
	                <li><a href="" title="互联网金融" target="_blank">互联网金融</a></li>
	                <li><a href="" title="网贷100" target="_blank">网贷100</a></li>
	                <li><a href="" title="网贷返利平台" target="_blank">网贷返利平台</a></li>
	                <li><a href="" title="网贷返利" target="_blank">网贷返利</a></li>
	                <li><a href="" title="支付接口" target="_blank">支付接口</a></li>
	                <li><a href="" title="股票配资" target="_blank">股票配资</a></li>
	                <li><a href="" title="配资门户" target="_blank">配资门户</a></li>
	                <li><a href="" title="股票配资" target="_blank">股票配资</a></li>
	                <li><a href="" title="配资平台" target="_blank">配资平台</a></li>
	                <li><a href="" title="汽车金融系统" target="_blank">汽车金融系统</a></li>
	                <li><a href="" title="项目融资" target="_blank">项目融资</a></li>
	                <li><a href="" title="财大师" target="_blank">财大师</a></li>
	                <li><a href="" title="众易贷" target="_blank">众易贷</a></li>
	                <li><a href="" title="财税咨询" target="_blank">财税咨询</a></li>
	                <li><a href="" title="借贷平台" target="_blank">借贷平台</a></li>
	                <li><a href="" title="网贷港湾" target="_blank">网贷港湾</a></li>
	                <li><a href="" title="股票直播" target="_blank">股票直播</a></li>
	                <li><a href="" title="网贷平台" target="_blank">网贷平台</a></li>
	                <li><a href="" title="营销软件" target="_blank">营销软件</a></li>
	                <li><a href="" title="上海贷款" target="_blank">上海贷款</a></li>
	                <li><a href="" title="深圳贷款公司" target="_blank">深圳贷款公司</a></li>
	                <li><a href="" title="黄金投资" target="_blank">黄金投资</a></li>
	                <li><a href="" title="股票配资" target="_blank">股票配资</a></li>
	                <li><a href="" title="上海黄金交易所" target="_blank">上海黄金交易所</a></li>
	                <li><a href="" title="网贷" target="_blank">网贷</a></li>
	                <li><a href="" title="网贷专家" target="_blank">网贷专家</a></li>
	                <li><a href="" title="P2P理财平台" target="_blank">P2P理财平台</a></li>
	                <li><a href="" title="外汇交易" target="_blank">外汇交易</a></li>
	                <li><a href="" title="如何投资理财" target="_blank">如何投资理财</a></li>
	                <li><a href="" title="p2p投资理财" target="_blank">p2p投资理财</a></li>
	                <li><a href="" title="区块链" target="_blank">区块链</a></li>
	                <li><a href="" title="理财问答" target="_blank">理财问答</a></li>
	                <li><a href="" title="量财富基金" target="_blank">量财富基金</a></li>
	                <li><a href="" title="绿化贷理财" target="_blank">绿化贷理财</a></li>
	                <li><a href="" title="网贷之家" target="_blank">网贷之家</a></li>
	                <li><a href="" title="期货之家" target="_blank">期货之家</a></li>
	                <li><a href="" title="找冷链" target="_blank">找冷链</a></li>                        
	            </ul>
	        </div>
	     </div>
	    <!--友情链接结束-->
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
					<dd><a href="${ctx}/securityXXweb/lissss.do">广告主注册</a></dd>
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
    <%-- <script type="text/javascript" src="${ctx}/CQW/style.js"></script> --%>
	<script type="text/javascript" src="${ctx}/CQW/banner.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/scale.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/scaleA.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/scaleB.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/personal.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/bootstrap-slider.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.cookie.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/uaredirect.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.SuperSlide.js"></script>
    <%--  <script type="text/javascript" src="${ctx}/CQW/laydate.js"></script>  --%>
    <script type="text/javascript" src="${ctx}/CQW/layer.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/toastr.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.qqFace.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/awardRotate.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.liMarquee.js"></script>
    <script type="text/javascript">
        jQuery(document).ready(function () {
            $(function() {
                $('.banner').lubo({});
            })
        
            var time = 0;
            timer(time, 'task_70');
                
            var time = 0;
            timer(time, 'task_69');
                
            var time = 0;
            timer(time, 'task_60');
                
            var time = 0;
            timer(time, 'task_57');
                
            var time = 0;
            timer(time, 'task_55');
                
            var runderColor = [{'color':'#2DB6EF'},{'color':'#FFAD64'},{'color':'#FF9595'},{'color':'#AC7DEC'},{'color':'#42bdf6'},{'color':'#ec357a'},{'color':'#f32551'},{'color':'#36e4e5'}];
                var Obj_tit = $('.task_lists > ul >li >.task_plats');
                Obj_tit.each(function(index,element){
                    $(this).css('background-color',runderColor[index]['color']);
                });      
            function timer(intDiff, id){
                window.setInterval(function(){
                    var day=0,
                        hour=0,
                        minute=0,
                        second=0;//时间默认值        
                    if(intDiff > 0){
                        day = Math.floor(intDiff / (60 * 60 * 24));
                        hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
                        minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
                        second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
                    }
                    if (minute <= 9) minute = '0' + minute;
                    if (second <= 9) second = '0' + second;
                    $('#'+id+' #day_show').html(day);
                    $('#'+id+' #hour_show').html(hour);
                    $('#'+id+' #minute_show').html(minute);
                    $('#'+id+' #second_show').html(second);
                    intDiff--;
                }, 1000);
            }
    
            jQuery('.txtMarquee-left').slide({titCell:'.hd ul',mainCell:'.bd ul',autoPage:true,effect:'left',autoPlay:true,scroll:1,vis:5});
            
                var _index5=0;
                $("#four_flash .but_right img").click(function(){
                    _index5++;
                    var len=$(".flashBg ul.record_ss li").length;
                    if(_index5+5>len){
                        $("#four_flash .flashBg ul.record_ss").stop().append($("ul.record_ss").html());
                    }
                    $("#four_flash .flashBg ul.record_ss").stop().animate({left:-_index5*225},1000);
                    });

                $("#four_flash .but_left img").click(function(){
                    if(_index5==0){
                        $("ul.record_ss").prepend($("ul.record_ss").html());
                        $("ul.record_ss").css("left","-1380px");
                        _index5=6
                    }
                    _index5--;
                    $("#four_flash .flashBg ul.record_ss").stop().animate({left:-_index5*225},1000);
                    });
        
                    if(document.getElementById('pie0')){
                        var myChart = echarts.init(document.getElementById('pie0'));
                        option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: '{a} <br/>{b}'
                            },

                            series: [
                                {
                                    name:'年化收益',
                                    type:'pie',
                                    radius: ['50%', '80%'],
                                    avoidLabelOverlap: true,
                                    data:[{"value":"5000.00","name":"\u4eba\u4f17\u91d1\u670d"},{"value":"10000.00","name":"\u805a\u4f18\u8d22"}],
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);           
                    }
                        
                    if(document.getElementById('pie1')){
                        var myChart = echarts.init(document.getElementById('pie1'));
                        option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: '{a} <br/>{b}'
                            },

                            series: [
                                {
                                    name:'年化收益',
                                    type:'pie',
                                    radius: ['50%', '80%'],
                                    avoidLabelOverlap: true,
                                    data:[{"value":"30000.00","name":"\u6c47\u94f6\u5bcc\u901a "},{"value":"10000.00","name":"\u5fae\u91d1\u5728\u7ebf"}],
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);           
                    }
                        
                    if(document.getElementById('pie2')){
                        var myChart = echarts.init(document.getElementById('pie2'));
                        option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: '{a} <br/>{b}'
                            },

                            series: [
                                {
                                    name:'年化收益',
                                    type:'pie',
                                    radius: ['50%', '80%'],
                                    avoidLabelOverlap: true,
                                    data:[{"value":"5000.00","name":"\u4eba\u4f17\u91d1\u670d"},{"value":"50000.00","name":"\u6cf0\u7136\u91d1\u878d"}],
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);           
                    }
                        
                    if(document.getElementById('pie3')){
                        var myChart = echarts.init(document.getElementById('pie3'));
                        option = {
                            tooltip: {
                                trigger: 'item',
                                formatter: '{a} <br/>{b}'
                            },

                            series: [
                                {
                                    name:'年化收益',
                                    type:'pie',
                                    radius: ['50%', '80%'],
                                    avoidLabelOverlap: true,
                                    data:[{"value":"5000.00","name":"\u4eba\u4f17\u91d1\u670d"},{"value":"20000.00","name":"\u94b1\u4fdd\u59c6"},{"value":"20000.00","name":"\u6cf0\u7136\u91d1\u878d"},{"value":"20000.00","name":"\u8f66\u8d37\u5b9d"},{"value":"20000.00","name":"\u5174\u6613\u8d37"}],
                                }
                            ]
                        };
                        // 使用刚指定的配置项和数据显示图表。
                        myChart.setOption(option);           
                    }
                        
            jQuery('.hour_show').slide({mainCell:'.bd ul',trigger:'click'});
    
            $('.dowebok').liMarquee({direction: 'up'});
                
            jQuery('.news_type').slide({trigger:'click'});
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
        
        //签到  ${ctx}/servlet/loginServlet
		$("#qiandao2").click(function () {
            window.location.href="${ctx}/loginweb/signin.do";
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
        
    </script>
    
    <script type="text/javascript">
   $(function(){
   //${CDX} 是什么类型  设string
     console.log('${CDX}');
     if('${CDX}' == '1'){
        layer.msg("登录失效！（有人登录该账号）");
     }
   
   })
    
    
    
    </script>
</body>
</html>
