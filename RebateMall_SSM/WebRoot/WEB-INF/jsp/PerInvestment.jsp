<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head>
    <title>投资申报-返利网</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">   
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=Edge,chrome=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8">
	<link rel="stylesheet" href="${ctx}/CQW/bootstrap.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/select2.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/select2-addl.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/select2-krajee.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/kv-widgets.css" type="text/css"></link>
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
	<script type="text/javascript" src="${ctx}/CQW/hm.js"></script>
	<script type="text/javascript">var s2options_d6851687 = {"themeCss":".select2-container--krajee","sizeCss":"","doReset":true,"doToggle":false,"doOrder":false};
    window.select2_d09e9858 = {"theme":"krajee","width":"100%","placeholder":"请选择 ...","language":"zh-CN"};</script>
	<link rel="stylesheet" href="${ctx}/CQW/laydate.css" type="text/css"></link>
	<link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css"></link>
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
			    <a href="javascript:0;"><img class="bot_left" src="${ctx}/CQW/image/LOGO.png"></a>	
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
    <!--用户中心header-->
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
            <a id="member_invest curin" class="text_fifteen" href="${ctx}/perInvestmentweb/PerInvestCX.do">
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
                <a class="text_fifteen" href="${ctx}/personaIWdjfweb/wdjf.do">
                    <i class="member_icon me_jifen"></i>
                    <span>我的积分</span>
                </a>
            </dd>
        </dl>
        <div class="left_active">
            <ul class="clearfix">
                <li><a href="javascript:0;" target="_blank"><img src="${ctx}/CQW/image/2018070208541043.jpg"></a></li>
                <li><a href="javascript:0;" target="_blank"><img src="${ctx}/CQW/image/2018060210183175.jpg"></a></li>
            </ul>
        </div>
        </div>
        <!--右侧内容-->
        <div class="invest_repair_rig">
		<div class="invest_repair_top">
			<h3>投资申报</h3>
		</div>
		<div class="invest_repair_main">
			<div class="slideTxtBox">
			    <div class="hd">
			        <ul><!-- <li class="on">投资申报</li>--><li class="on">申报记录</li> </ul>
			    </div>
			    <div class="bd clearfix">
			        <div>
			           
			            	<form id="w0" class="form-horizontal" action="${ctx}/servlet/personalServlet?fun=doInsert" method="post" enctype="multipart/form-data">
							  <div class="form-group mb10">
							    <label class="col-sm-3 control-label">投资平台</label>
							    <div class="col-sm-9">
                                    <div class="form-group field-investrepair-user_name required">
                                        <div class="col-lg-12">
                                            <input type="text" id="investPlatform" class="form-control brnone" name="investPlatform" aria-required="true">
                                        </div>
                                    </div>
							    </div>
							  </div>
							  <div class="form-group mb10">
							    <label class="col-sm-3 control-label">真实姓名</label>
							    <div class="col-sm-9">
                                    <div class="form-group field-investrepair-user_name required">
                                        <div class="col-lg-12">
                                            <input type="text" id="enrName" class="form-control brnone" name="enrName" aria-required="true">
                                        </div>
                                    </div>
							    </div>
							  </div>
							  <div class="form-group mb10">
							    <label class="col-sm-3 control-label">手机号码</label>
							    <div class="col-sm-9">
							    	<div class="form-group field-user-mobile">
                                        <div class="col-lg-12">
                                            <input type="text" id="phoneNumber" class="form-control brnone" name="phoneNumber">
                                        </div>
                                    </div>
							    </div>
							  </div>
							  
							  <div class="form-group mb10">
							    <label class="col-sm-3 control-label">用户名称</label>
							    <div class="col-sm-9">
                                    <div class="form-group field-investrepair-user_name required">
                                        <div class="col-lg-12">
                                            <input type="text" id="enrUsers" class="form-control brnone" name="enrUsers" aria-required="true">
                                        </div>
                                    </div>
							    </div>
							  </div>
							  <div class="form-group mb10">
							    <label class="col-sm-3 control-label">投资金额</label>
							    <div class="col-sm-9">
                                    <div class="form-group field-invest_amount required">
                                        <div class="col-lg-12">
                                            <input type="text" id="investJer" class="form-control brnone textright" name="investJer" placeholder="元" aria-required="true">
                                        </div>
                                    </div>
							    </div>
							  </div>
							  <div class="form-group mb10">
							    <label class="col-sm-3 control-label">投资日期</label>
							    <div class="col-sm-9">
                                    <div class="form-group field-investrepair-invest_time required">
                                        <div class="col-sm-12">
                                            <input type="text" id="investDate" class="form-control brnone laydate-icon" name="investDate" onclick="laydate({istime: true, format: &#39;YYYY-MM-DD hh:mm:ss&#39;})" aria-required="true">
                                        </div>
                                    </div>
							    </div>
							  </div>
							  
							  <div class="form-group mb10">
							   <label class="col-sm-3 control-label">备注信息</label>
							    <div class="col-sm-9">
                                    <div class="form-group field-plan">
                                        <div class="col-lg-12">
					                        <input type="text" id="note" class="form-control brnone" name="note" aria-required="true">
                                        </div>
                                    </div>
							    </div>
							  </div>

							  <div class="form-group mb10">
							    <label class="col-sm-3 control-label">上传凭证</label>
							    <div class="col-sm-9">
                                    <div class="form-group field-coupon">
                                        <div class="col-lg-12">
					                        <input type="file" id="certificate" class="form-control brnone" name="certificate" aria-required="true">
                                        </div>
                                    </div>
							    </div>
							  </div>
							  <div class="form-group mb10">
							  	<label class="col-sm-3"></label>
							    <div class="col-sm-9">
							      <button type="submit" class="btn btn-danger brnone">提交</button>
							    </div>
							  </div>
							  <div class="repair_tip">
								    <h4>温馨提示:</h4>
								    <p>1.当您在推荐的网站投资成功后，再行添加申报。</p>
								    <p>2.申报规则：请您确保您填写的都是真实信息，方便我公司为您核实 ，信息有误，会导致申报失败。</p>
							   </div>
							</form>	
                            <input type="hidden" id="randcode" value="01234&lt;b style=&#39;color:blue&#39;&gt;5&lt;/b&gt;6789  01&lt;b style=&#39;color:blue&#39;&gt;2&lt;/b&gt;3456789  &lt;b style=&#39;color:blue&#39;&gt;0&lt;/b&gt;123456789  012345678&lt;b style=&#39;color:blue&#39;&gt;9&lt;/b&gt;  ">
			            
			        </div>
			        
			        <!-- <div style="display: none;">
			            <li>
			            	<div class="please_box">
			            		<div class="re_w">申请状态：</div>
			    				<div class="de_ws handle_type">
			    					<ul>
										<li class="listclick"><a href="javascript:;">不限</a></li>
										<li><a href="javascript:;">已提交</a></li>
										<li><a href="javascript:;">处理中</a></li>
										<li><a href="javascript:;">审核通过</a></li>
										<li><a href="javascript:;">审核失败</a></li>
									</ul>
			    				</div>
			            	</div>
			            	<div class="please_box">
			    				<div class="re_w">交易平台：</div> 
			                    <div class="de_ws hot_plat">
			                        <input type="text" id="hot_plat" name="" class="form-control plat_input" placeholder="请输入平台名称">
			                    </div>
			    			</div>
			    			<div class="investrecord_rig_nr" style="padding: 30px 20px;">
					          <table class="table table-hover">
					            <thead>
					              <tr>
					                <th>&nbsp;&nbsp;&nbsp;&nbsp;投资平台</th>
					                <th>手机号码</th>
					                <th>用户名称</th>
					                <th>投资金额</th>
					                <th>投资日期</th>
					                <th>备注信息</th>
					              </tr>
					            </thead>
					            <tbody id="repair_list">
					            	<tr>
					            		<td colspan="7" style="text-align:center">没有数据</td>
					            	</tr>
					            </tbody>
					          </table>
					        </div>
					        <div class="page" id="page"><span>共0条</span><span>1/0</span><span class="pageall">首页</span><span class="pageall">上一页</span><span class="pageall">下一页</span><span class="pageall">尾页</span></div>
			            </li>
			        </div> -->
			    </div>
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
	<script type="text/javascript" src="${ctx}/CQW/select2.full.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/select2-krajee.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/zh-CN.js"></script>
	<script type="text/javascript" src="${ctx}/CQW/kv-widgets.js"></script>
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
    <script type="text/javascript" src="${ctx}/CQW/laydate.js"></script>
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
	
		$(function() {
	        getData(1);//默认第一页
	        $("#page").on('click','a',function() {
	            var page = $(this).attr("data-page");//获取当前页
	            getData(page);
	        });
	        $(".slideTxtBox").slide({trigger:"click"});
	        $(".de_w ul li a").click(function(){
		 		status = $(this).parents("li").index();
		        $(this).parents("li").addClass("listclick").siblings().removeClass("listclick");
		        getData(1);//默认第一页
	    	});
			$(".hot_plat dl a").click(function(){
				plat_name = $(this).html();
				getData(1);//默认第一页
			});
			$("#hot_plat").blur(function(){
				plat_name = $(this).val();
				getData(1);//默认第一页
			});
	    });
		var status = 0;
		var plat_name = "";
		var page_cur = 1; //当前页
	    var total_num, page_size, page_total_num;//总记录数,每页条数,总页数
		//
		function getData(page) { //获取当前页数据
			$("#repair_list").html("");
	        $.ajax({
	            type: "post",
	            url: "",
	            data: {page: page - 1,plat_name:plat_name,status:status},
	            dataType: "json",
	            success: function(json) {
	                total_num = json.total_num;//总记录数
	                page_size = json.page_size;//每页数量
	                page_cur = page;//当前页
	                page_total_num = json.page_total_num;//总页数
	                if (total_num > 0) {
	                    var tr = "";
	                    var list = json.list;
	                    $.each(list, function(index, array) { //遍历返回json
	                    	var remark = (array["CHECK_REMARK"] == null) ? " " : array["CHECK_REMARK"];
	                    	tr += "<tr><td width='200px'><img src="+array['PLAT_LOGO']+" width='77px' height='20px' /><cite>"+array['TARGET_NAME']+"</cite></td><td>"+parseInt(array['INVEST_AMOUNT'])+"</td><td>"+array['INVEST_TIME']+"</td><td>"+array['ADD_TIME']+"</td><td>"+array['CHECK_TYPE']+"</td><td>"+ remark +"</td></tr>";
	                    });
	                    $("#repair_list").append(tr);
	                }else{
	                    $("#repair_list").append("<tr><td colspan='7' style='text-align:center'>没有数据</td></tr>");
	                }
	                
	            },
	            complete: function() {
	                getPageBar();//js生成分页，可用程序代替
	            }/* ,
	            error: function() {
	                alert("数据异常,请检查是否json格式");
	            } */
	        });
	    }

	    function getPageBar() { //js生成分页
	        if (page_cur > page_total_num)
	            page_cur = page_total_num;//当前页大于最大页数
	        if (page_cur < 1){
	            page_cur = 1;//当前页小于1
	        }
	        page_str = "<span>共" + total_num + "条</span><span>" + page_cur + "/" + page_total_num + "</span>";
	        
	        //若是第一页
	        if (page_cur == 1) {
	            page_str += "<span class='pageall'>首页</span><span class='pageall'>上一页</span>";
	        } else {
	            page_str += "<span class='pageall'><a href='javascript:void(0)' data-page='1'>首页</a></span><span class='pageall'><a href='javascript:void(0)' data-page='" + (page_cur - 1) + "'>上一页</a></span>";
	        }
	        //若是最后页
	        if (page_cur >= page_total_num) {
	            page_str += "<span class='pageall'>下一页</span><span class='pageall'>尾页</span>";
	        } else {
	            page_str += "<span class='pageall'><a href='javascript:void(0)' data-page='" + (parseInt(page_cur) + 1) + "'>下一页</a></span><span class='pageall'><a href='javascript:void(0)' data-page='" + page_total_num + "'>尾页</a></span>";
	        }
	        $("#page").html(page_str);
	    }
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
       
    </script>
  </body>
</html>
