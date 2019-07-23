<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head>    
    <title>投资收益统计-返利网</title>    
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
                <a class="text_fifteen" href="${ctx}/personalWeb/wdzl.do">
                    <i class="member_icon me_user"></i>
                    <span>我的资料</span>
                </a>
            </dd>
            <dd class="dl_dd">
                <a class="text_fifteen curin" href="${ctx}/personalWeb/statisticaljt.do">
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
            <div class="invest_rig_top" style="padding-bottom: 20px;">
                
                <H3 style="padding: 18px 40px;">金额统计 ${yesenna} 年</H3>
               <!-- 为ECharts准备一个具备大小（宽高）的Dom -->
               <div id="main" 
               style="border:1px solid red;width:900px;height:600px;">
               </div>
               
               <b style="margin-left: 10px;">提示：投资的收益必须审核成功才算入收益金额。</b>
              
                
               
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
    
    <!-- 引入 echarts.js -->
<script src="${ctx}/assets/echarts.js"></script>
    
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
<script type="text/javascript">


//先加载后台数据 对获取的数据进行分组 且写入对应位置的数组中
//var mycars=new Array('日', '一', '二', '三', '四', '五', '六');//string型数组
//var shouyi=new Array(10, 940, 908, 940, 1300, 1350, 1450,0,0,0,0,10);//int型数组 12个
//var touzhiaa=new Array(10, 9, 19, 20, 13, 13, 14,0,0,0,0,1);//int型数组  12个

// 基于准备好的dom，初始化echarts实例
var myChart;
var colors;
var shouyi=new Array();//int型数组 12个
var touzhi=new Array();//int型数组  12个

 $(function(){
 
    $.getJSON("${ctx}/personalWeb/tzzd.do", function (data) {
      shouyi =data.argerint;
      touzhi=data.argerinttwo;
    /*   console.log(shouyi);
      console.log(touzhi); */
     JJZZ();
			});  
			
		
 
 })

//双曲线统计图

function JJZZ(){
 myChart = echarts.init(document.getElementById('main'));
 colors = ['#5793f3', '#d14a61'];

optionAA = {
    color: colors,

    tooltip: {
        trigger: 'axis',
        axisPointer: {
            type: 'cross'
        }
    },
    grid: {
        right: '20%'
    },
    toolbox: {
        feature: {
            dataView: {show: true, readOnly: false},
            restore: {show: true},
            saveAsImage: {show: true}
        }
    },
    legend: {
        data:['收益金额（元）','投资金额（元）']
    },
    xAxis: [
        {
            type: 'category',
            axisTick: {
                alignWithLabel: true
            },
            data: ['1月','2月','3月','4月','5月','6月','7月','8月','9月','10月','11月','12月']
        }
    ],
    yAxis: [//Y轴刻度样式
        {
            type: 'value',
            name: '收益金额（元）',
            min: 0,
            //max: 250,
            position: 'right',
            axisLine: {
                lineStyle: {
                    color: colors[0]
                }
            },
            axisLabel: {
                formatter: '{value}'//刻度值
            }
        },
        {
            type: 'value',
            name: '投资金额（元）',
            min: 0,
            //max: 350,
            position: 'left',
            
            axisLine: {
                lineStyle: {
                    color: colors[1]
                }
            },
            axisLabel: {
                formatter: '{value}'
            }
        }
    ],
    series: [
        {
            name:'收益金额（元）',
            type:'line',
            data:shouyi
        },
        {
            name:'投资金额（元）',
            type:'line',
            yAxisIndex: 1,
            data:touzhi
        }
    ]
};

myChart.setOption(optionAA);
}


//window.onload = JJZZ;//加载完页面执行

// 使用刚指定的optionone配置项和数据显示图表。 
//myChart.setOption(optionAA);
</script>

  </body>
</html>
