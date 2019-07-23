<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!-- 应用本地包 -->

<%@ page language="java" import="com.zgx.dao.*"%>
<%@ page language="java" import="com.zgx.service.*"%>

<%@ page language="java" import="com.zgx.po.*"%>
<%@ page language="java" import="java.io.*"%>
<%@ page language="java" import="java.util.*"%>




<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>



<%
	//查询语句值的判断
      String PJ="";//全部           
     int intpj=0; 
     String strpj = request.getParameter("intpj");//没用到
     String usID=(String)(session.getAttribute("usID"));//用户ID  没用到
    // servlet服务   写法
    //IRenWuService renWuServiceImpl =new RenWuServiceImpl();//任务
	
    RenWutable typebean=new RenWutable();
    //List<RenWutable> list = renWuServiceImpl.findPage(null, 0,10);
    List<RenWutable> list=(List<RenWutable>)request.getAttribute("listC");
    ArrayList<RenWutable>  listone =(ArrayList<RenWutable>)list;//区别ArrayList索引从1开始
    pageContext.setAttribute("listone", listone);
   
    int count=0; //总行数
    int page_count=1;  //开始条数   每一页的结束行数   end即结尾数
    int page_total=1;  //，总页码
  
  
    
	
    int page_current= 1;  //首页 通过session
   
    int page_size=10;//一页的行数   
    int page_kscount=0;//每一页的开始行数
    
   try{
   int sessint=(Integer)session.getAttribute("IDIDA");
   page_current=sessint;
   } catch(Exception e){
    page_current=1;
   }
%>

<%
	String page_cu = request.getParameter("page_current");  
    if(page_cu==null){  
       page_cu="1";  
    }  
    page_current = Integer.parseInt(page_cu);//首页
    if(page_current<0){//首页小于0
       page_current = 1;  
    } 
    page_count= page_current*page_size-1;//开始条数     end结束 值  
    
    
    if(page_current>1){
    page_kscount= (page_current-1)*page_size;//begin开始值  开始条数
    if(page_kscount<0){
    page_kscount=0;
    }
    }
   
     pageContext.setAttribute("sy", page_current);//pageContext作用域（最大的）
%>

<!DOCTYPE HTML>
<html>
<head>
<title>个人中心-返利网-消息中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
<meta name="renderer" content="webkit">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
<link rel="stylesheet" href="${ctx}/CQW/bootstrap.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/personal.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/font-awesome.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/site.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/forum.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/cropbox.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/dropload.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/bootstrap-slider.css"
	type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/toastr.min.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/guide.css" type="text/css"></link>
<link rel="stylesheet" href="${ctx}/CQW/liMarquee.css" type="text/css"></link>

<link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css"
	id="LayDateSkin"></link>
<link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css"
	id="layui_layer_skinlayercss"></link>
</head>

<body>
	<header>
		<div class="placeholder"></div>
		<div class="header_top" style="">
			<div class="header_center clearfix">
				<div class="header_lef">
					<span class="mr15"><i class="glyphicon glyphicon-earphone"></i>欢迎致电：400-000-0000</span>
					<span><i class="glyphicon glyphicon-time"></i>服务时间：9:00-18:00</span>
					<span id="weibo" class="ml20 mr4" style="display: none;"> <i
						class="icon icon_weibo"></i> <em class="show_weibo"
						style="display: none;">
							<p>点击关注返利网微博</p>
							<p>
								<a href="javascript:;" target="_blank">caiqi@weibo</a>
							</p> </em> </span> <span id="qq" style="margin-left: 10px;"> <i
						class="icon icon_qq"></i> <em class="show_qq"
						style="display: none;">
							<p>返利网官方客服</p>
							<p>
								 <p><a href="javascript:;" target="_blank"></a><a  href="http://wpa.qq.com/msgrd?v=3&uin=2569461773&site=qq&menu=yes" target="_blank">2569461773</a></p>
								 </em> </span> <span id="weixin" style="margin-left: 1px;"> <i
						class="icon icon_weixin"></i> <em class="show_weixin"
						style="display: none;">
							<p>返利网官方微信</p>
							<p>
								<a href="javascript:;" target="_blank"><img
									src="${ctx}/CQW/image/weikefu.jpg" width="130" alt="">
								</a>
							</p> </em> </span>
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
				<a href=""><img class="bot_left"
					src="${ctx}/CQW/image/LOGO.png">
				</a>
				<div class="nav_list">
					<ul>
					   <li><a href="${ctx}/mainsy/MainIndex.do">首页</a></li>
                       <li  class="navCur"><a href="${ctx}/RenwuT/renwu.do">任务大厅</a></li>
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
	<!--header-->
	<div class="task mb30">
		<h3>温馨提示：在任务大厅领取任务后，即开始任务进度倒计时，期间内完成任务即可直接领取现金奖励！</h3>
		<div class="task_list">
			<ul class="mt30 clearfix">

				<c:forEach items="${listone}" var="typebean" step="1" varStatus="i"
					begin="<%=page_kscount%>" end="<%=page_count%>">
					<% int colse_r = (int)(Math.floor(Math.random() * 256)); 
                       int colse_g = (int)(Math.floor(Math.random() * 256)); 
                       int colse_b = (int)(Math.floor(Math.random() * 256));
                     %>
					<li id="task_">
						<div class="task_plat" style="background-color: rgb(<%=colse_r%>, <%=colse_g%>, <%=colse_b%>);"  >
							
							<div class="task_plat_title">
								<p>[${typebean.content}]</p>
								<p>反利网</p>
								
							</div>
							<div  style="height: 50px;
							   background: url(${ctx}/image/task_bg.png) center no-repeat;
							line-height: 50px;text-align: center;color: #fff;">
							结束期限：
							<%-- <c:choose><c:when test="${typebean.term != null}">${typebean.term} </c:when> <c:otherwise> 无  </c:otherwise> </c:choose>  --%>
							<c:choose><c:when test="${typebean.term != null}"><fmt:formatDate value="${typebean.term}" pattern="yyyy-MM-dd"/>   </c:when> <c:otherwise> 无  </c:otherwise> </c:choose> 
							
							</div>

						</div>
						<div class="task_nr" style="border-color: rgb(<%=colse_r%>, <%=colse_g%>, <%=colse_b%>);">
							<span class="task_num">任务数量：<i>8/10</i></span>
							<span>奖励：<i>${typebean.reward}</i></span>
							<div style="height: 70px;">	
							<span style="line-height: 30px;">要求：${typebean.requirement}</span>
							</div>
							
							<c:choose><c:when test="${typebean.stateywx == 0}"><span  class="get_task" style="cursor: pointer;" onclick="rwlog(${typebean.taskid})">领取任务</span>  </c:when> 
							  <c:otherwise><span  onclick="layer.msg('已结束！');" class="get_task" style="background-color:#d8d5d5;cursor: pointer;">任务结束</span>  </c:otherwise> 
							</c:choose> 
							 

						</div></li>
					<%count++;%>
				</c:forEach>

			

			</ul>

		</div>
		<div>
		<%
		
						page_total = ((listone.size())%10==0)?((listone.size())/10):((listone.size())/10+1);  
					                   pageContext.setAttribute("zm", page_total);//sy zm
					                     int ling=0;
					                     pageContext.setAttribute("ling", ling);//pageContext作用域（最大的）
					%> <a
					href="${ctx}/RenwuT/urlj.do?page_current=1">首页</a> <c:choose>
						<c:when test="${(sy-1) > ling}">
							<a href="${ctx}/RenwuT/urlj.do?page_current=<%=page_current-1%>">上一页
							</a>
							
						</c:when>
						<c:otherwise>
							<a style="cursor: pointer" onclick="layer.msg('没有上一页了！')">上一页 </a>
						</c:otherwise>
					</c:choose> <c:choose>
						<c:when test="${sy < zm}">
							<a
								href="${ctx}/RenwuT/urlj.do?page_current=<%=page_current+1%>">下一页
							</a>
						</c:when>
						<c:otherwise>
							<a style="cursor: pointer" onclick="layer.msg('没有下一页了！')">下一页 </a>
						</c:otherwise>
					</c:choose> <a href="${ctx}/RenwuT/urlj.do?page_current=<%=page_total%>">尾页</a>
					第<%=page_current%> 页/共 <%=page_total%>页
		
		</div>


	</div>


	<footer>
		<div style="background:#333!important;" class="clearfix">
			<div class="footer_center clearfix">
				<div class="footer_left">
					<dl>
						<dt>
							<i class="icon icon_about mr12"></i>关于我们
						</dt>
						<dd>
							<a href="">了解返利</a>
						</dd>
						<dd>
							<a href="">加入返利</a>
						</dd>
						<dd>
							<a href="">联系返利</a>
						</dd>
						<dd>
							<a href="">意见反馈</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<i class="icon icon_help mr12"></i>帮助中心
						</dt>
						<dd>
							<a href="">新手上路</a>
						</dd>
						<dd>
							<a href="">注册登录</a>
						</dd>
						<dd>
							<a href="">名词解释</a>
						</dd>
						<dd>
							<a href="">提现申请</a>
						</dd>
					</dl>
					<dl>
						<dt>
							<i class="icon icon_pro mr12"></i>广告主服务
						</dt>
						<dd>
							<a href="">广告主登录</a>
						</dd>
						<dd>
							<a href="">广告主注册</a>
						</dd>
					</dl>
					<dl style="margin-right: 20px;">
						<dt>
							<i class="icon icon_see mr12"></i>关注我们
						</dt>
						<dd style="height:88px; padding-left: 25px;">
							<img src="${ctx}/CQW/image/weixin.png"> <img
								src="${ctx}/CQW/image/weikefu.jpg"
								style="margin-left:10px;width:88px;height:88px;">
						</dd>
						<dd>
							<a href="javascript:;">微信公众号</a><a href="javascript:;"
								style="margin-left:40px;">微信客服</a>
						</dd>
					</dl>
				</div>
				<div class="footer_rig">
					<dl>
						<dt>
							<i class="icon icon_service"></i>服务支持
						</dt>
						<dd class="fz30 color3">000-000-0000</dd>
						
						<dd class="mt10">
							服务时间：<strong>9:00-18:00</strong>
						</dd>
						<dd class="mt12">投资有风险 理财需谨慎</dd>
					</dl>
				</div>
			</div>
			<div class="footer_copyright">
				<div class="copyright">版权所有：头号（北京）科技有限公司 © CopyRight 2014-2016 www..com .All Rights Reserved. 京ICP备00000000	
					&nbsp;&nbsp;</div>
				<div class="copyright_tags">
					<span><img src="${ctx}/CQW/image/copy1.png">
					</span> <span><img src="${ctx}/CQW/image/copy2.png">
					</span> <span><img src="${ctx}/CQW/image/copy3.png">
					</span>
				</div>
			</div>
		</div>
	</footer>

	<script
		src="${ctx}/assets/bootstrap-3.3.7-dist/js/jquery-1.11.3.min.js"></script>
	<!-- 包含click -->
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
	<script type="text/javascript" src="${ctx}/CQW/layer.min.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/toastr.min.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/jquery.qqFace.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/awardRotate.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/jquery.liMarquee.js"></script>
	<script type="text/javascript">
		jQuery(document)
				.ready(
						function() {

							$(function() {

								//当前菜单高亮
								var curHref = window.location.href.split('/')
										.pop();
								if (curHref == 'investRecord.html'
										|| curHref == 'incomeDet.html'
										|| curHref == 'investRepair.html') {
									curHref = 'invest.html';
								}
								if (curHref == 'shopRecode.html'
										|| curHref == 'inforMation.html') {
									curHref = 'accountInfo.html';
								}
								$('.nav >ul >li a')
										.each(
												function() {
													var _thisHref = $(this)
															.attr('href');
													if (_thisHref.split('/')
															.pop() === curHref) {
														$(this)
																.parent('li')
																.addClass(
																		'current');
													}
												});
							});

							$(function() {
								//当前菜单高亮
								var curHref = window.location.href.split('/')
										.pop();

								$('.member_left >dl >dd a')
										.each(
												function() {

													var _thisHref = $(this)
															.attr('href');

													var _parentDiv = $(this)
															.parents('dd');

													if (curHref === 'investRecord.html'
															|| curHref === 'investRepair.html'
															|| curHref === 'wdApply.html') {

														if (_thisHref
																.split('/')
																.pop() === curHref) {
															$(this).addClass(
																	'curin');
														}
														_parentDiv
																.find(
																		'#member_invest')
																.addClass(
																		'curin');
														$('.member_touzis')
																.show(300);

													} else if (_thisHref.split(
															'/').pop() === curHref) {
														$(this).addClass(
																'curin');
													}
												});

								$('#member_invest').on('click', function() {
									$('.member_touzis').slideToggle();
								});
							});

							$(function() {
								$(window).scroll(function() {
									offset = $('.placeholder').offset();//不能用自身的div,不然滚动起来会很卡
									if ($(window).scrollTop() > offset.top) {
										$('.header_top').css({
											'position' : 'fixed',
											'top' : '0px',
											'left' : offset.left + 'px',
											'width' : '100%',
											'z-index' : '9999'
										});
									} else {
										$('.header_top').removeAttr('style');
									}
								});
								$('.view_wap').hover(function() {
									$('.web_wap').fadeIn(300);
								}, function() {
									$('.web_wap').fadeOut(300);
								});
							})
						});


		//签到  ${ctx}/servlet/loginServlet
		$("#qiandao2").click(function() {
			window.location.href = "${ctx}/loginweb/signin.do";
		});
		
		//判断是否存在任务   
		function rwlog(rwID) { 
		var  ID= "${SESSION_USERone.signupId}";
		var  rwIDone=rwID;
		if(ID!=null && ID!=""){
		    $.ajax(
            {
                url:"${ctx}/RenwuT/renwulog_pd.do",
                data: {huiyuanID:ID,rwID:rwID},
                dataType:"json",
                type:"GET",
               success:function(data)
               {//1.成功的处理
                if (data.state == true) { layer.msg("领取成功！"); // setTimeout('location.reload()',2000); //指定后 2秒刷新            
			       } else {layer.msg("已领取！"); }
                }
              });
		
		}else{
		layer.msg("请登录！");
		
		}
             
         }
         
         
               //退出
        function SCsession(){
        var varstr = "${SignUpNameCS}";
       if( varstr !=null  && varstr !="" ){
        $.getJSON("${ctx}/mainsy/SCsessiom.do", function (data) {
	      
	       if(data.state == true){
             layer.msg("退出成功");
             //location.reload();
             setTimeout('Mainy()',2000); //指定后 2秒刷新
            
		       }else{
		      layer.msg("退出失败！");
		       }
			}); 
       }else{
        layer.msg("未登录！");
       }
     
    }
    
    //跳转主页
      function Mainy(){
       location.href="${ctx}/mainsy/Main.do";
      }
      
      	   //退出
        function SCsession(){
        var varstr = "${SignUpNameCS}";
       if( varstr !=null  && varstr !="" ){
        $.getJSON("${ctx}/mainsy/SCsessiom.do", function (data) {
	      
	       if(data.state == true){
             layer.msg("退出成功");
             setTimeout('location.reload()',2000); //指定后 2秒刷新
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
