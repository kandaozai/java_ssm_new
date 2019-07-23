<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
   
   //尝试获取高亮
    String strpj =null;//String strpj = request.getParameter("intpj");
     try{
       strpj = (String)session.getAttribute("IDIDAgao");//尝试获取session 高亮值
     }catch(Exception e){
       strpj=null;
     }
     
      if(strpj==null){  
       intpj=4;  
      }else{
      intpj = Integer.parseInt(strpj);//首页
      }
      
    String usID=(String)(session.getAttribute("usID"));//用户ID
     
    // int stran = intpj;//高亮  //根本没用到
    //request.setAttribute("stran",stran);//写给后后台  没必要写  路径已写
     
    Newstable typebean=new Newstable();
     //获取表数据
    List<Newstable> list=(List<Newstable>)request.getAttribute("listweb"); //获取request 查询的值 
    
    ArrayList<Newstable>  listone =(ArrayList<Newstable>)list;//区别ArrayList索引从1开始
    pageContext.setAttribute("listone", listone);
   
    int count=0; //总行数
    int page_count=1;  //开始条数   每一页的结束行数   end即结尾数
    int page_total=1;  //，总页码
    int page_current= 1;  //首页
   
    int page_size=10;//一页的行数   
    int page_kscount=0;//每一页的开始行数
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
							 <p><a href="javascript:;" target="_blank"></a><a  href="http://wpa.qq.com/msgrd?v=3&uin=2569461773&site=qq&menu=yes" target="_blank">2569461773</a></p> </em> </span> <span id="weixin" style="margin-left: 1px;"> <i
						class="icon icon_weixin"></i> <em class="show_weixin"
						style="display: none;">
							<p>返利网官方微信</p>
							<p>
								<a href="javascript:;" target="_blank"><img
									src="${ctx}/CQW/image/weikefu.jpg" width="130" alt=""> </a>
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
					src="${ctx}/CQW/image/LOGO.png"> </a>
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
	<div class="member_header"></div>
	<!--用户中心main-->
	<div class="member_main clearfix">
		<div class="member_left">
			  <dl class="dl clearfix">
            <dd class="dl_dd">
                <a class="text_fifteen" href="${ctx}/personalWeb/wdzl.do">
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
            </dd>
         
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
                <a class="text_fifteen curin" href="${ctx}/personaINewsweb/news.do">
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
					<li><a href="" target="_blank"><img
							src="${ctx}/CQW/image/2018070208541043.jpg"> </a>
					</li>
					<li><a href="" target="_blank"><img
							src="${ctx}/CQW/image/2018060210183175.jpg"> </a>
					</li>
				</ul>
			</div>
		</div>
		<!--右侧内容-->
		<div class="account_rig">
			<div class="account_rig_top">
				<div class="account_rig_top">
					<h3>消息中心</h3>
				</div>
				<div class="account_rig_nr" style="height: 560px;">
					<div class="readed clearfix">
						<ul>

							<li ${IDIDAgao==4? "class='current' ":"class=''"}  ><a
								href="${ctx}/personaINewsweb/news.do?intpjgg=4">全部</a></li>
							<li ${IDIDAgao==0? "class='current' ":"class=''"} ><a
								href="${ctx}/personaINewsweb/news.do?intpjgg=0">未读</a></li>
							<li ${IDIDAgao==1? "class='current' ":"class=''"} ><a
								href="${ctx}/personaINewsweb/news.do?intpjgg=1">已读</a></li>
						</ul>
					</div>
					<div class="message_list1">
						<table align="center" class="table">
							<thead>
								<th>序号</th>
								<th>内容</th>
								<th>发送时间</th>
								<th>操作</th>
							</thead>
							<tbody>

								<c:forEach items="${listone}" var="typebean" step="1"
									varStatus="i" begin="<%=page_kscount%>" end="<%=page_count%>">
									<tr>

										<td
											onclick="oncztgb(${typebean.newsid},${typebean.status},'${typebean.content}')"
											${typebean.status?"":"style='color:black;font-weight: 600;'"}>
											${i.count}</td>
										<td
											onclick="oncztgb(${typebean.newsid},${typebean.status},'${typebean.content}')"
											${typebean.status?"":"style='color:black;font-weight: 600;'"}>${typebean.content}</td>
										<td
											onclick="oncztgb(${typebean.newsid},${typebean.status},'${typebean.content}')"
											${typebean.status?"":"style='color:black;font-weight: 600;'"}>
											<fmt:formatDate value="${typebean.sendingtime}"
												pattern="yyyy-MM-dd HH:mm:ss" />
										</td>
										<td><a href="javascript:;"
											onclick="toDelete(${typebean.newsid})">删除</a></td>
										<%
											count++;
										%>
									</tr>
								</c:forEach>
								<tr>


								</tr>


							</tbody>
						</table>
						<div style="margin-top: 10px;float:right;">
							<div style="display:inline-block;margin-right:20px;">
								本页总共<%=count%>条 &nbsp; &nbsp; &nbsp; &nbsp; 总共<%=listone.size()%>条
							</div>


							<%
								page_total = ((listone.size())%10==0)?((listone.size())/10):((listone.size())/10+1);  
							                   pageContext.setAttribute("zm", page_total);//sy zm
							                    
							                     int ling=0;
							                     pageContext.setAttribute("ling", ling);//pageContext作用域（最大的）
							%>
							<div style="display:inline-block;margin-right:20px;">

								<a href="${ctx}/personaINewsweb/news.do?page_current=1">首页</a>
								<c:choose>
									<c:when test="${(sy-1) > ling}">
										<a
											href="${ctx}/personaINewsweb/news.do?page_current=<%=page_current-1%>">上一页
										</a>
									</c:when>
									<c:otherwise>
										<a style="cursor: pointer" onclick="alert('没有上一页了！')">上一页
										</a>
									</c:otherwise>
								</c:choose>

								<c:choose>
									<c:when test="${sy < zm}">
										<a
											href="${ctx}/personaINewsweb/news.do?page_current=<%=page_current+1%>">下一页
										</a>
									</c:when>
									<c:otherwise>
										<a style="cursor: pointer" onclick="alert('没有下一页了！')">下一页
										</a>
									</c:otherwise>
								</c:choose>

								<a
									href="${ctx}/personaINewsweb/news.do?page_current=<%=page_total%>">尾页</a>
								第<%=page_current%>
								页/共
								<%=page_total%>页

							</div>


						</div>



					</div>
				</div>

			</div>

		</div>
		<!--右侧内容结束-->
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
					<span><img src="${ctx}/CQW/image/copy1.png"> </span> <span><img
						src="${ctx}/CQW/image/copy2.png"> </span> <span><img
						src="${ctx}/CQW/image/copy3.png"> </span>
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
	<%--  <script type="text/javascript" src="${ctx}/CQW/style.js"></script> --%>
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
    
    //删除
    function toDelete(id){//注意id1  为空值  有问题
    layer.confirm('是否删除该数据？', { icon: 3, title: '提示' }, function (index) {
						layer.close(index);
						$.getJSON("${ctx}/personaINewsweb/delete.do?ID=" + id, function (data) {
							
							layer.msg(data.msg);
							if(data.State=true){
							setTimeout('sxym()',2000); //指定后 2秒刷新
							
							}
						});
					});	
    }
    
   //table 信息状态改变
     function  oncztgb(id,boon,content) {
     var intid=id;
     if(boon==false){//再进行 修改状态  （之后刷新）
        //layer.alert(content,{title: "读取信息" });
         $.ajax(
            {
                url:"${ctx}/personaINewsweb/ztgb.do",
                data: {id:intid},
                dataType:"json",
                type:"GET",
               success:function(data)
               {
               //1.成功的处理
                if (data.state == true) {
                   layer.msg(content);//样式书写
                   $("#ID_SX").click();
                   setTimeout('sxym()',2000); //指定后 2秒刷新
			                } else {
                   layer.msg("失败！");
                             }
                }
              });
        
     }else{
        //layer.alert("该信息已读");//样式书写
        layer.msg("该信息已读");//样式书写
        
     }
     
	
     } 
     
     //刷新页面
     function sxym(){
      window.location.href="${ctx}/personaINewsweb/news.do";
     
     }
     
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
</body>
</html>
