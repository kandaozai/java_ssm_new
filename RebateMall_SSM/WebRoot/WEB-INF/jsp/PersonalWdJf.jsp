<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
   

<!DOCTYPE HTML>
<html>
  <head>    
    <title>个人中心-返利网-我的积分</title>    
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	 <link rel="stylesheet" href="${ctx}/CQW/bootstrap.css" type="text/css"></link> 
	
	<link rel="stylesheet" href="${ctx}/CQW/personal.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/font-awesome.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/site.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/forum.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/cropbox.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/dropload.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/bootstrap-slider.css" type="text/css"></link>
	
	
	 <!--插件css-->
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/plugins/toastr/toastr.min.css">
    
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/plugins/jquery.bsgrid-1.37/merged/bsgrid.all.min.css">
    <link rel="stylesheet" type="text/css" href="${ctx}/assets/plugins/jquery.bsgrid-1.37/css/skins/grid_bootstrap.min.css">
	<style type="text/css">
	 .font-1{
    font-size: 15px;
    font-weight:bolder;
    margin-right: 5px;
    }
    
     a:hover{
         color:#fe7171;}
	</style>
	
	
	
	<%-- <link rel="stylesheet" href="${ctx}/CQW/toastr.min.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/guide.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/liMarquee.css" type="text/css"></link>

	<link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css" id="LayDateSkin"></link>
	<link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css" id="layui_layer_skinlayercss"></link> --%>
	
	
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
                <a class="text_fifteen" href="${ctx}/personaINewsweb/news.do">
                    <i class="member_icon me_message"></i>
                    <span>我的消息</span>
                </a>
            </dd>
            <dd class="dl_dd">
                <a class="text_fifteen curin" href="${ctx}/personaIWdjfweb/wdjf.do">
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
        <div class="account_rig">
                <div class="account_rig_top">
                <h3>我的积分</h3>
                 <ul class="clearfix">
                        <li style="width: 33%;">  
                          <span class="code_tip">签到积分</span>
                          <span class="num">${wdjfjlb.signintegral}
                            <i class="world">分</i>
                          </span>
                        
                        </li>
                        
                        <li style="width: 33%;">  
                          <span class="code_tip">签到外积分</span>
                          <span class="num">${wdjfjlb.integral}
                            <i class="world">分</i>
                          </span>
                        
                        </li>
                         <li style="width: 33%;">
                          <span class="code_tip">当前可用积分</span>
                          <span class="num">${wdjfjlb.signintegral+wdjfjlb.integral}
                            <i class="world">分</i>
                          </span>
                        
                        </li>
                      </ul>
                </div>
                
                
                <div class="account_rig_nr" style="height: 500px;">
                   
                  <!--  <div class="message_list1"></div> -->
                   <div class="account_box">
                     <div class="hd">
                       <ul>
                        <li class="on" id="jfjl" >积分记录</li>
                        <li class="" id="dhjl" >兑换记录</li>
                       
                       </ul>
                     </div>
                     <div class="bd">
                       <div id="ID_one" class="account_cordbox" style="display: block;padding: 3px;">
                          <table id="tableone" >
                                <tr>
                                    <th w_num="total_line">序号</th>
                                    <th w_index="getintegral">积分获得</th>
                                    <th w_render="SJ">获得时间</th>               
                                    <th w_index="integralexplain">积分说明</th> 
                                </tr>
                          </table> 
                              
                       </div>
                       <div id="ID_two" class="account_cordbox" style="display: none;padding: 3px;">
                         <table id="tabletwo" >
                                <tr>
                                    <th w_num="total_line">序号</th>
                                    <th w_index="commodityexchangeid" w_hidden="true">商品兑换ID</th>
                                    <th w_index="storemc">商品名称</th>  
                                    <th w_index="integral">兑换积分</th>    
                                    <th w_render="bsgrdOpDatetime">兑换时间</th>
                                    <th w_render="xianqin"></th>  
                                    <!-- 收货地址   收货人姓名 电话  QQ -->
                                </tr>
                              </table>
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
	
	  <!-- 信息提示modal -->
    <div class="modal fade" data-backdrop="static" id="modservice_room_message">
        <div class="modal-dialog" style="width: 800px; padding: 10px;">
            <div class="modal-content" style="padding:8px;margin-top: 100px;background-color: #3344;">
                <div class="" style="margin-bottom:0;color: #000;">
                    <label style="font-size:14px; margin: 10px 0px 0px 10px;/* float:left; */">公司信息</label>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true" style="color: black;">&times;</span><span class="sr-only">Close</span>
                    </button><br />
                </div>
                <!-- header -->
                <div class="" style="background-color:#f9f9f9;border: 1px solid #cac6c6;margin-top: 10px;padding-bottom: 30px;background-color: #989898;color: #000;border-radius: 10px;">
                	
                
                    <div class="row" style="margin-top:20px;">
                        <div class="col-lg-6"><span style="margin-top:50px;margin-left:100px;"><span class="font-1">商品名称:</span><span id="storeMC"></span></span></div>
                        <div class="col-lg-6"><span style="margin-top:50px;margin-left:50px;"><span class="font-1">兑换积分:</span><span id="integral"></span></span></div>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-lg-12"><span style="margin-top:30px;margin-left:100px;"><span class="font-1">送货地址:</span><span id="receivingAddress"></span></span></div>
                       
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-lg-6"><span style="margin-top:50px;margin-left:100px;"><span class="font-1">收货人名:</span><span id="consigneeName"></span></span></div>
                        <div class="col-lg-6"><span style="margin-top:50px;margin-left:50px;"><span class="font-1">联系电话:</span><span id="telephone"></span></span></div>
                    </div>
                    <div class="row" style="margin-top:10px;">
                        <div class="col-lg-6"><span style="margin-top:50px;margin-left:100px;"><span class="font-1">联系QQ:</span><span id="qQ"></span></span></div>
                        <div class="col-lg-6"><span style="margin-top:50px;margin-left:50px;"><span class="font-1">兑换时间:</span><span id="cunDatetime"></span></span></div>
                    </div>
                    
               
                    
                </div>
            </div>
        </div>
    </div>
                             
    <script src="${ctx}/assets/jquery/jquery-3.2.1.js" type="text/javascript"></script> 
<%--    <script src="${ctx}/assets/bootstrap-3.3.7-dist/js/jquery-1.11.3.min.js"></script> --%>
    <!-- bootstrap核心 -->
	<script src="${ctx}/assets/bootstrap-3.3.7-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <%-- <script src="${ctx}/assets/bootstrap-3.3.7-dist/js/jquery-1.11.3.min.js"></script> --%> 
	<!-- ace核心js -->
	<script src="${ctx}/assets/ace/js/ace-extra.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/ace/js/ace-elements.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/ace/js/ace.min.js" type="text/javascript"></script>
	<!-- layer弹窗 -->
	<script src="${ctx}/assets/plugins/layer/layer.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery.form-3.46.0/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/assets/plugins/toastr/toastr.min.js" type="text/javascript"></script>

	<script src="${ctx}/assets/plugins/jquery.bsgrid-1.37/js/lang/grid.zh-CN.min.js"></script>
	<script src="${ctx}/assets/plugins/jquery.bsgrid-1.37/merged/grid.all.min.js"></script>

	<script src="${ctx}/assets/mycustom/js/mycustom.js" type="text/javascript"></script>
 
   <%--  <script src="${ctx}/assets/bootstrap-3.3.7-dist/js/jquery-1.11.3.min.js"> </script>
    --%>
	<%-- <script type="text/javascript" src="${ctx}/CQW/jquery.js"></script>
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
    <script type="text/javascript" src="${ctx}/CQW/layer.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/toastr.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.qqFace.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/awardRotate.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.liMarquee.js"></script> --%>
 <script type="text/javascript">
        var tableoneT;
        var tabletwoT;
		$(function(){
			  tableoneT = $.fn.bsgrid.init('tableone', {
	            url: "${ctx}/personaIWdjfweb/getListone.do",
	            autoLoad: true,
	            stripeRows: true,//隔行变色
	            rowHoverColor: true,//划过行变色
	            pageSize: 8,
	            pageAll: false,
	            pageSizeSelect: false,//是否选择分页页数下拉框
	            pagingLittleToolbar: true,//精简的图标按钮分页工具条
	           // pagingToolbarAlign: "right",//分页工具条的显示位置
	           
	        });  
	        
	        tabletwoT = $.fn.bsgrid.init('tabletwo', {
	            url: "${ctx}/personaIWdjfweb/getListtow.do",
	            autoLoad: true,
	            stripeRows: true,//隔行变色
	            rowHoverColor: true,//划过行变色
	            pageSize: 8,
	            pageAll: false,
	            pageSizeSelect: false,//是否选择分页页数下拉框
	            pagingLittleToolbar: true,//精简的图标按钮分页工具条
	           // pagingToolbarAlign: "right",//分页工具条的显示位置
	           
	        });
	        $("tabletwo_pt_outTab").attr("style","");
	        
		});
		
       //详情
		function xianqin(record, rowIndex, colIndex, options){
		    var ID=record.commodityexchangeid;
		return '<a  type="" class="btn  btn-sm btn-radius" onclick="windowK('+ID+')">详情</a>';
			
		}
		
			//时间自定义列 表2
		function bsgrdOpDatetime(record, rowIndex, colIndex, options){
		 console.log(record.cundatetime);
		 return ChangeDateFormat(record.cundatetime);
		}
		
	    //时间自定义列 表1
		function SJ(record, rowIndex, colIndex, options){
		 console.log(record.gettime);
		 return ChangeDateFormat(record.gettime);
		}
		
		
		
		//公司详细信息弹框
		function windowK(ID){
				$.getJSON("${ctx}/personaIWdjfweb/xinxi.do?Id="+ID, function (data) {
				$("#storeMC").html(data.storemc);
				$("#integral").html(data.integral);
				$("#receivingAddress").html(data.receivingaddress);
				$("#consigneeName").html(data.consigneename);
				$("#telephone").html(data.telephone);
				
				$("#qQ").html(data.qq);
				$("#cunDatetime").html(ChangeDateFormat(data.cundatetime));
				
				
						});
				 $("#modservice_room_message").modal("show");//公司模板mod显示
		}

</script>
 
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
    
   
     //签到  ${ctx}/servlet/loginServlet
	 $("#qiandao2").click(function () {
            window.location.href="${ctx}/servlet/loginServlet?fun=signin";
        });
        
     //选项卡切换单击事件
        $("#jfjl").click(function(){
          $("#jfjl").attr("class","on");
          $("#dhjl").attr("class","");
          $("#ID_one").attr("style","display: block;padding: 3px;");
          $("#ID_two").attr("style","display: none;padding: 3px;");
        });
      //选项卡切换单击事件
       $("#dhjl").click(function(){
          $("#jfjl").attr("class","");
          $("#dhjl").attr("class","on");
          $("#ID_one").attr("style","display: none;padding: 3px;");
          $("#ID_two").attr("style","display: block;padding: 3px;");
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
