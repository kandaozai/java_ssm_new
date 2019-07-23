<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>

<!DOCTYPE HTML>
<html>
  <head> 
    <title>账户安全-返利网</title>
    
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
	<link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css" id="LayDateSkin"></link>
	<link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css" id="layui_layer_skinlayercss"></link>
	
	
	 <!-- 必要样式  -->
    <link href="${ctx}/assets/css/city/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="${ctx}/assets/css/city/city-picker.css" rel="stylesheet" type="text/css" />
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
		
		 a {
         color: #333333;
          }
          
           a:hover{
         color:#fe7171;}
	</style>
	
  </head>
  
  <body style="background-color: #f3f3f3;">
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
    <div class="account_main clearfix">
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
                <a class="text_fifteen curin" href="${ctx}/securityXXweb/Account.do">
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
        <div class="account_rig">
            <div class="account_rig_top">
                <h3>信息认证</h3>
            </div>
            <div class="account_rig_nr">
                <div class="account_box">
                    <div class="hd">
                        <ul>
                            <li class="on">账户安全</li>
                            <li class="">修改头像</li>
                        </ul>
                    </div>
                    <div class="bd">
                        <!--账户信息 -->
                        <div  style="display: block;">
                            <div class="list_user">
                                <table cellspacing="0" cellspadding="0">
                                <tbody>
                                    <tr>
                                        <td class="text_one" width="150px"><i class="member_icon me_name"></i> 用户名称</td>
                                        <td class="text_two pl65">保障账户安全，确定真实身份</td>
                                        <td class="text_tf w80">
                                        <c:choose><c:when test="${not empty signuptable.signupname}"> <i class="fa fa-check-circle color9 mr4"></i>已设置 </c:when> <c:otherwise> <i class="fa fa-times-circle mr4 color10"></i>[未设置]</c:otherwise> </c:choose>
                                        </td>
                                        <td class="text_tf text_right"><span id="span_signupname">${signuptable.signupname}</span>&emsp;
                                        	<c:choose><c:when test="${not empty signuptable.signupname}"><a class="text_xiugai" href="javascript:;" onclick="UpdateMC()">修改</a> </c:when> <c:otherwise> <button type="button" class="btn btn-warning btn-sm btn-radius" onclick="inteMC()"><i class="fa fa-edit"></i>立即填写</button></c:otherwise> </c:choose>
                                        </td>
                                    </tr>                                   
                                    <tr>
                                        <td class="text_one"><i class="member_icon me_mima"></i> 登录密码</td>
                                        <td class="text_two pl65">安全性高的密码可以使用账号更安全</td>
                                        <td class="text_tf w80">
                                         <c:choose><c:when test="${not empty signuptable.password}"> <i class="fa fa-check-circle color9 mr4"></i>已设置 </c:when> <c:otherwise> <i class="fa fa-times-circle mr4 color10"></i>[未设置]</c:otherwise> </c:choose>
                                        </td>
                                        <td class="text_tthi text_right">******&emsp;
                                        	<c:choose><c:when test="${not empty signuptable.password}"><a class="text_xiugai" href="${ctx}/securityXXweb/MMjsp.do" >修改</a>  </c:when> <c:otherwise> <button type="button" class="btn btn-warning btn-sm btn-radius" ><i class="fa fa-edit"></i></button></c:otherwise> </c:choose>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="text_one"><i class="member_icon me_shouji"></i> 手机号码</td>
                                        <td class="text_two pl65">保障资金安全，是您在返利网重要的身份认证</td>
                                        <td class="text_tf w80">
                                         <c:choose><c:when test="${not empty PhonenumberCS}"> <i class="fa fa-check-circle color9 mr4"></i>已设置 </c:when> <c:otherwise> <i class="fa fa-times-circle mr4 color10"></i>[未设置]</c:otherwise> </c:choose>
                                        </td>
                                        <td class="text_right">${PhonenumberCS}&emsp;
                                        	<c:choose><c:when test="${not empty PhonenumberCS}"><a class="text_xiugai" href="${ctx}/securityXXweb/SJHjsp.do">修改</a> </c:when> <c:otherwise> <button type="button" class="btn btn-warning btn-sm btn-radius" onclick="inteSJHM()"><i class="fa fa-edit"></i>立即填写</button></c:otherwise> </c:choose>
                                        </td>                                        
                                    </tr>
                                     <tr>
                                        <td class="text_one"><i class="member_icon me_shiing"></i> 身份证</td>
                                        <td class="text_two pl65">实名制，是您在返利网重要的身份认证</td>
                                        <td class="text_tf w80">
                                         <c:choose><c:when test="${not empty IdnumberCS}"> <i class="fa fa-check-circle color9 mr4"></i>已设置 </c:when> <c:otherwise> <i class="fa fa-times-circle mr4 color10"></i>[未设置]</c:otherwise> </c:choose>
                                         </td>
                                        <td class="text_right"><span id="span_Idnumber">${IdnumberCS}</span>&emsp;
                                        	<c:choose><c:when test="${not empty IdnumberCS}"><a class="text_xiugai" href="javascript:;" onclick=" UpdateSFZ()">修改</a>  </c:when> <c:otherwise> <button type="button" class="btn btn-warning btn-sm btn-radius" onclick="UpdateSFZ()"><i class="fa fa-edit"></i>立即填写</button></c:otherwise> </c:choose>
                                        </td>                                        
                                    </tr>
                                     <tr>
                                        <td class="text_one"><i class="member_icon me_jianjie"></i>  银行卡</td>
                                        <td class="text_two pl65">与资金关联，便于资金的储存</td>
                                        <td class="text_tf w80">
                                        <c:choose><c:when test="${not empty BankcardCS}"> <i class="fa fa-check-circle color9 mr4"></i>已设置 </c:when> <c:otherwise> <i class="fa fa-times-circle mr4 color10"></i>[未设置]</c:otherwise> </c:choose>
                                        </td>
                                        <td class="text_right"><span id="span_Bankcard">${BankcardCS}</span>&emsp;
                                        	<c:choose><c:when test="${not empty BankcardCS}"><a class="text_xiugai" href="javascript:;" onclick="UpdateYHK()">修改</a>  </c:when> <c:otherwise> <button type="button" class="btn btn-warning btn-sm btn-radius" onclick="UpdateYHK()"><i class="fa fa-edit"></i>立即填写</button></c:otherwise> </c:choose>
                                        </td>                                        
                                    </tr>
                                    <tr>
                                        <td class="text_one"><i class="member_icon me_email"></i>  电子邮箱</td>
                                        <td class="text_two pl65">通知等，便于接受通知</td>
                                        <td class="text_tf w80">
                                           <c:choose><c:when test="${not empty MailboxCS}"> <i class="fa fa-check-circle color9 mr4"></i>已设置 </c:when> <c:otherwise> <i class="fa fa-times-circle mr4 color10"></i>[未设置]</c:otherwise> </c:choose>
                                         </td>
                                        <td class="text_right"><span id="span_Mailbox">${MailboxCS}</span>&emsp;
                                        	<c:choose><c:when test="${not empty MailboxCS}"><a class="text_xiugai" href="javascript:;" onclick="UpdatedDZYX()">修改</a></c:when> <c:otherwise> <button type="button" class="btn btn-warning btn-sm btn-radius" onclick="UpdatedDZYX()"><i class="fa fa-edit"></i>立即填写</button></c:otherwise> </c:choose>
                                        </td>                                        
                                    </tr>
                                  
                                   
                                </tbody>
                            </table>
                            <div style="width: 100%;">
                             <a href="javascript:;" style="display: inline-block;margin-left: 48%;margin-top: 8px;"  onclick="modeTS()">更多</a>
                            </div>
                               
                            </div>
                           
                        </div>
                        
                        <!-- 头像图片  -->
                       <div  style="display: none;">
                            <div id="editImageDiv">
                                <div class="container"  style="width: 400px; margin-right: 300px;">
                                    <div class="imageBox">
                                        <div class="thumbBox"></div>
                                        <div class="spinner" style=""></div>
                                    </div>
                                    <div class="action">
                                     <%--  <form id="formUserManInsert" action="${ctx}/securityXXweb/tupian.do" class="form-horizontal form-radius"
                                           method="post" enctype="multipart/form-data">  --%>
                                        <div class="new-contentarea tc">
                                            <a href="javascript:void(0)" class="upload-img">
                                                <i class="fa fa-image"></i>
                                                <label for="upload-file">请先选择图片...</label>
                                            </a>
                                          <input type="text" hidden="hidden" name="signupId" value="${signuptable.signupId}"/>
                                          <input type="file" class="" name="upload_file" id="upload-file">  
                                          <!-- <input type="file" class="" name="filetp" id="upload-file"> -->
                                          
                                          
                                            
                                        </div>
                                        <!--自己	 <input type="button" id="btn_Crop" class="Btnsty_peyton2" onclick="inserttop()"  value="保存"> -->
                                        <input type="button" id="btnCrop"  class="Btnsty_peyton2"  value="保存">
                                        
                                         <!-- <button type="reset" class="btn btn-primary btn-sm btn-radius">重置</button> -->
                                      <!--  </form>  -->
                                        <input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+">
                                        <input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-">
                                    </div>
                                    <div class="cropped"></div>
                                </div>
                            </div>
                     <!--  图片 -->
                        </div>
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
    </footer>
    
    <!-- 用户名称窗体 -->
    <div id="PersonalDataModal" style="z-index:10000; width:500px; position:fixed;top:30%;left: 38%;;border: 0px solid #e9e5e5;display:none;">
        <div class="panel" style="background-color: lemonchiffon;">
            <div class="panel-heading" style="border-bottom:1px solid #f1f1f1;background-color:#fff27b;">
                <div class="panel-title" style="line-height: 0px; font-size: 13px;">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" onclick="Closes()">&times;</span><span class="sr-only" style="color:#000000;">Close</span></button>
                    <h5 style="margin:0 auto;font-weight:bold;">信息认证设置</h5>
                </div>
            </div>
            <div class="panel-collapse collapse in"  style="height:180px;">
                <form method="post" id="FormPersonalData" action="${ctx}/securityXXweb/Update.do" class="form-horizontal">
                <input type="text" hidden="hidden" name="signupId" value="${signuptable.signupId}"/>
                    <div class="tab-pane">
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:20px;">
                                    <span class="input-group-addon" style="font-size:10px;">原用户名称</span>
                                    <input class="form-control"  readonly="readonly" type="text" value="${signuptable.signupname}" />
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:10px;">
                                    <span class="input-group-addon" style="font-size:10px;">新用户名称</span>
                                    <input class="form-control" type="text" name="signupname" id="signUpName" />
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12" style="margin-top:20px;">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"  style="border:groove;" onclick="Update()">确定</button>
                                <button type="reset" class="btn btn-default"  style="border:groove;" onclick="InformationClose()">取消</button>
                            </div>
                        </div>
                    </div>
                   
                </form>
            </div>
        </div>
    </div>
   
    
    <!-- 身份证窗体 -->
    <div id="PersonalDataModalSFZ" style="z-index:10000; width:500px; position:fixed;top:30%;left: 38%;;border: 0px solid #e9e5e5;display:none;">
        <div class="panel" style="background-color:lemonchiffon;">
            <div class="panel-heading" style="border-bottom:1px solid #f1f1f1;background-color:#fff27b;">
                <div class="panel-title" style="line-height: 0px; font-size: 13px;">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" onclick="Closee()">&times;</span><span class="sr-only"  style="color:#000000;">Close</span></button>
                    <h5 style="margin:0 auto;font-weight:bold;">信息认证设置</h5>
                </div>
            </div>
            <div class="panel-collapse collapse in"  style="height:180px;">
                <form method="post" id="FormPersonalDataSFZ" action="${ctx}/securityXXweb/UpdateSFZ.do" class="form-horizontal">
                <input type="hidden" name="signupId" value="${signuptable.signupId}"/>
                    <div class="tab-pane">
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:20px;">
                                    <span class="input-group-addon" style="font-size:10px;">新身份证</span>
                                    <input class="form-control"  type="text" onKeyUp="value=value.replace(/[\u4E00-\u9FA5]/g,'')" onafterpaste="value=value.replace(/[\u4E00-\u9FA5]/g,'')"
                                    name="idnumber" id="idnumber" placeholder="" maxlength="18"/>
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:10px;">
                                    <span class="input-group-addon" style="font-size:10px;">再次确认</span>
                                    <input class="form-control" type="text" onKeyUp="value=value.replace(/[\u4E00-\u9FA5]/g,'')" onafterpaste="value=value.replace(/[\u4E00-\u9FA5]/g,'')"
                                     maxlength="18"  id="idnumbera" />
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12" style="margin-top:20px;">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"  style="border:groove;" onclick="but_Update_SFZ()">确定</button>
                                <button type="reset" class="btn btn-default"  style="border:groove;" onclick="InformationClosetwo()">重置</button>
                            </div>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
    
    
    <!-- 银行卡窗体 -->
    <div id="PersonalDataModalYHK" style="z-index:10000; width:500px; position:fixed;top:30%;left: 38%;;border: 0px solid #e9e5e5;display:none;">
        <div class="panel" style="background-color:lemonchiffon;">
            <div class="panel-heading" style="border-bottom:1px solid #f1f1f1;background-color:#fff27b;">
                <div class="panel-title" style="line-height: 0px; font-size: 13px;">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" onclick="Closeaa()">&times;</span><span class="sr-only"  style="color:#000000;">Close</span></button>
                    <h5 style="margin:0 auto;font-weight:bold;">信息认证设置</h5>
                </div>
            </div>
            <div class="panel-collapse collapse in"  style="height:180px;">
                <form method="post" id="FormPersonalDataYHK" action="${ctx}/securityXXweb/UpdateYHK.do" class="form-horizontal">
                <input type="hidden" name="signupId" value="${signuptable.signupId}"/>
                    <div class="tab-pane">
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:20px;">
                                    <span class="input-group-addon" style="font-size:10px;">新银行卡</span>
                                    <input class="form-control"  type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                    maxlength="19"  name="bankcard" id="bankcard"/>
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:10px;">
                                    <span class="input-group-addon" style="font-size:10px;">再次确认</span>
                                    <input class="form-control" type="text" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"
                                    maxlength="19" id="bankcarda" />
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12" style="margin-top:20px;">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"  style="border:groove;" onclick="but_Update_YHK()">确定</button>
                                <button type="reset" class="btn btn-default"  style="border:groove;" >重置</button>
                            </div>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
    
    <!-- 电子邮箱窗体 -->
    <div id="PersonalDataModalDZYX" style="z-index:10000; width:500px; position:fixed;top:30%;left: 38%;;border: 0px solid #e9e5e5;display:none;">
        <div class="panel" style="background-color:lemonchiffon;">
            <div class="panel-heading" style="border-bottom:1px solid #f1f1f1;background-color:#fff27b;">
                <div class="panel-title" style="line-height: 0px; font-size: 13px;">
                    <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true" onclick="Closecc()">&times;</span><span class="sr-only"  style="color:#000000;">Close</span></button>
                    <h5 style="margin:0 auto;font-weight:bold;">信息认证设置</h5>
                </div>
            </div>
            <div class="panel-collapse collapse in"  style="height:180px;">
                <form method="post" id="FormPersonalDataDZYX" action="${ctx}/securityXXweb/UpdateDZYX.do" class="form-horizontal">
                <input type="hidden" name="signupId" value="${signuptable.signupId}"/>
                    <div class="tab-pane">
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:20px;">
                                    <span class="input-group-addon" style="font-size:10px;">新电子邮箱</span>
                                    <input class="form-control"  type="text" 
                                    maxlength="19"  name="mailbox" id="mailbox"/>
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12">
                            <div class="col-sm-2"></div>
                            <div class="col-sm-8" style="padding:0px 10px 0px 0px;">
                                <div class="input-group" style="margin-top:10px;">
                                    <span class="input-group-addon" style="font-size:10px;">再次确认</span>
                                    <input class="form-control" type="text" 
                                    maxlength="19" id="mailboxa" />
                                </div>
                            </div>
                            <div class="col-sm-2"></div>
                        </div>
                        <div class="col-sm-12" style="margin-top:20px;">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default"  style="border:groove;" onclick="but_Update_DZYX()">确定</button>
                                <button type="reset" class="btn btn-default"  style="border:groove;" >重置</button>
                            </div>
                        </div>
                    </div>
                    
                </form>
            </div>
        </div>
    </div>
    
    
      <!-- 修改个人信息提示modal -->
    <div class="modal fade" data-backdrop="static" id="modservice_room_message">
        <div class="modal-dialog" style="width: 800px; padding: 10px;">
            <div class="modal-content" style="padding:8px;margin-top: 100px;background-color: #a9a9d8;">
                <div class="" style="margin-bottom:0;color: #000;">
                    <label style="font-size:14px; margin: 10px 0px 0px 10px;/* float:left; */">修改个人信息</label>
                    <button type="button" class="close" data-dismiss="modal">
                        <span aria-hidden="true" style="color: black;">&times;</span><span class="sr-only">Close</span>
                    </button><br />
                </div>
                <!-- header -->
                <div class="" style="background-color:#ececec;border: 1px solid #ff9a9a;margin-top: 10px;padding-bottom: 30px;color: #000;border-radius: 10px;">
                	
               <form id="formUserInsert_QT" action="${ctx}/securityXXweb/Update_QT.do" class="form-horizontal form-radius"  
	        		 > <!-- enctype="multipart/form-data" -->
                
                    <div class="row" style="margin-top:20px;">
                        <div class="col-lg-6">
                          <span class="font-1" style="margin-top:50px;margin-left:128px;">性别:</span>
                        
                             	<select  id="sex" name="sex"  style="color: #555;padding: 0px 6px;border-radius: 4px;width: 160px;">
                             	     
									<option value="false" ${table_HT.sex ? 'selected="selected"':''}>男</option>
									<option value="true" ${table_HT.sex ? 'selected="selected"':''}>女</option>
								</select>
                        </div>
                        <div class="col-lg-6">
                          <span class="font-1" style="margin-top:50px;margin-left:50px;">情感状态:</span>
                            	<select  id="emotionalstatusId" name="emotionalstatusId" style="color: #555;padding: 0px 6px;border-radius: 4px;width: 160px;">
                            	    <option value="0" ${table_HT.emotionalstatusId==0 ? 'selected="selected"':''}>请选择</option>
									<option value="1" ${table_HT.emotionalstatusId==1 ? 'selected="selected"':''}>单身</option>
									<option value="2" ${table_HT.emotionalstatusId==2 ? 'selected="selected"':''}>恋爱</option>
									<option value="3" ${table_HT.emotionalstatusId==3 ? 'selected="selected"':''}>已婚</option>
								</select>
                        </div>
                    </div>
                    
                    <div class="row" style="margin-top:10px;">
                        <div class="col-lg-6">
                           <span class="font-1" style="margin-top:50px;margin-left:100px;">出生年日:</span>
                           <input id="yearofbirth" name="yearofbirth" type="date" style="color: #555;padding: 0px 6px;border-radius: 4px;width: 160px;"  value="<fmt:formatDate value="${table_HT.yearofbirth}" pattern="yyyy-MM-dd"/>">
                             
                             </div>
                        <div class="col-lg-6"><span class="font-1" style="margin-top:50px;margin-left:50px;">
                                                                                         当前职业:</span>
                              <input type="text" id="occupation" name="occupation" style="color: #555;padding: 0px 6px;border-radius: 4px;width: 160px;" placeholder="请输入当前职业" value="${table_HT.occupation}">
                        </div>
                    </div>
                    
                    
                    
                   <div class="form-group form-group-sm" style="margin-top:10px;"><!-- value="江苏省/常州市/溧阳市" -->
                    <span class="font-1" style="margin-top:50px;margin-left:100px;">现居住地:</span>
							<!-- <label class="font-1" style="margin-top:50px;margin-left:100px;"for="">现居住地</label> -->
								<div class="col-sm-6" style="display: inline-block;float: none;">
									<div style="position: relative;">
										<input id="city-picker3"  style="width: 100%;display: inline-block;" name="living"
											class="form-control" readonly type="text" value="${req_DZ}"  
											data-toggle="city-picker">
									</div>
								</div>
								<div class="col-sm-3" style="display: inline-block;float: none;">
											<button class="btn " id="reset" style="border-color: #5ac1ff;" type="button">重置</button>
											<button class="btn btn-danger" id="destroy" type="button">确定</button>
								</div>
						</div> 
                    
                     <div class="row" style="margin-top:10px;">
                        <div class="col-lg-12">
                           <span class="font-1" style="margin-top:50px;margin-left:100px;">详细地址:</span>
                           <input type="text" name="living_XX" style="color: #555;padding: 0px 6px;border-radius: 4px;width: 66%;height: 30px;" placeholder="请输入地址" value="${req_DZ_XX}">
                        </div> 
                    </div> 
                    
                    <div class="form-group form-group-sm" style="margin-top:10px;"><!-- value="江苏省/常州市/溧阳市" -->
                    <span class="font-1" style="margin-top:50px;margin-left:100px;">家乡地址:</span>
							<!-- <label class="font-1" style="margin-top:50px;margin-left:100px;"for="">现居住地</label> -->
								<div class="col-sm-6" style="display: inline-block;float: none;">
									<div style="position: relative;">
										<input id="city-picker4"  style="width: 100%;display: inline-block;" name="homeaddress"
											class="form-control" readonly type="text" value="${req_DZ2}"  
											data-toggle="city-picker">
									</div>
								</div>
								<div class="col-sm-3" style="display: inline-block;float: none;">
											<button class="btn " id="resetA" style="border-color: #5ac1ff;" type="button">重置</button>
											<button class="btn btn-danger" id="destroyA" type="button">确定</button>
								</div>
						</div> 
                    
                     <div class="row" style="margin-top:10px;">
                        <div class="col-lg-12">
                           <span class="font-1" style="margin-top:50px;margin-left:100px;">详细地址:</span>
                           <input type="text" name="homeaddress_XX" style="color: #555;padding: 0px 6px;border-radius: 4px;width: 66%; height: 30px; " placeholder="请输入地址" value="${req_DZ_XX2}">
                        </div> 
                    </div> 
                    
                    
                    <div class="row" style="margin-top:18px;">
                         <button type="button" style="margin-left: 38%; width: 80px;" class="btn btn-primary btn-sm btn-radius form-save" onclick="insert()" >保存</button>
	                     <button type="reset" style="margin-left: 2%; width: 80px;" class="btn btn-primary btn-sm btn-radius">重置</button>
                    </div>
                   
                    
               
                   </form>
                </div>
                
            </div>
        </div>
    </div>
   
    
    
    <script type="text/javascript" src="${ctx}/CQW/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/yii.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/bootstrap.js"></script>
    
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
    
   <%--  <script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script> 
    /RebateMall_SSM/WebRoot/assets/js/cropper.js    --%>
    
    <script type="text/javascript" src="${ctx}/CQW/style.js"></script>
    
    <script type="text/javascript" src="${ctx}/CQW/toastr.min.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.qqFace.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/awardRotate.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/jquery.liMarquee.js"></script>
    
    <!-- layer弹窗 -->
	<script src="${ctx}/assets/plugins/layer/layer.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery.form-3.46.0/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/assets/plugins/toastr/toastr.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/mycustom/js/mycustom.js" type="text/javascript"></script>
   
   
   <!-- city 地址输入 -->
	<%-- <script src="${ctx}/assets/js/city/jquery.js"></script> 上面已经有了个 jquery-3.2.1 --%>
    <%-- <script src="${ctx}/assets/js/city/bootstrap.js"></script> --%>
    <script src="${ctx}/assets/js/city/city-picker.data.js"></script>
    <script src="${ctx}/assets/js/city/city-picker.js"></script>
    <script src="${ctx}/assets/js/city/main.js"></script>
   
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
	    
			 var top = 0;
		     $(function(){
		      jQuery('.account_box').slide({trigger:'click'});
		      if ($.cookie('center-guide-2') == null || $.cookie('center-guide-2') == 'undefined') {
		            $('#new-user-guide-cover').show();
		            $('#center-guide-step2').show();
		            $.cookie('center-guide-2', true,{ expires: 600 });
		        }
		        $('#center-step2').click(function(){
		            window.location.href = 'investRepair.html';
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
    </script>
    <script type="text/javascript">
  
    
    	//打开修改用户名称窗体
     	function UpdateMC(){
     	 /* var image = cropper.getDataURL().toString;
     	 console.log(image); */
     	
     	   $("#PersonalDataModalSFZ").css('display', 'none');//身份证 
        	$("#PersonalDataModalYHK").css('display', 'none');//银行卡
        	$("#PersonalDataModalDZYX").css('display', 'none');//电子邮箱
        	$("#PersonalDataModal").css('display', 'none');//用户名称
    		$("#PersonalDataModal").show();
    	}
        //修改用户名称 X关闭按钮
        function Closes(){
        	$("#PersonalDataModal").css('display', 'none');
        	
        }        
    	
    	
    	//打开修改身份证  
    	function UpdateSFZ(){
    	  $("#PersonalDataModalSFZ").css('display', 'none');//身份证 
        	$("#PersonalDataModalYHK").css('display', 'none');//银行卡
        	$("#PersonalDataModalDZYX").css('display', 'none');//电子邮箱
        	$("#PersonalDataModal").css('display', 'none');//用户名称
    		$("#PersonalDataModalSFZ").show();
    	}
        //修改身份证 X关闭按钮
        function Closee(){
        	$("#PersonalDataModalSFZ").css('display', 'none');
        }
        
    	
    	//打开修改银行卡码窗体  Bankcard
    	function UpdateYHK(){
    	
            $("#PersonalDataModalSFZ").css('display', 'none');//身份证 
        	$("#PersonalDataModalYHK").css('display', 'none');//银行卡
        	$("#PersonalDataModalDZYX").css('display', 'none');//电子邮箱
        	$("#PersonalDataModal").css('display', 'none');//用户名称
    		$("#PersonalDataModalYHK").show();
    	}
        //修改银行卡 X关闭按钮
        function Closeaa(){
           
        	$("#PersonalDataModalYHK").css('display', 'none');
        }
        
        //打开修改电子邮箱  
    	function UpdatedDZYX(){
    	    $("#PersonalDataModalSFZ").css('display', 'none');//身份证 
        	$("#PersonalDataModalYHK").css('display', 'none');//银行卡
        	$("#PersonalDataModalDZYX").css('display', 'none');//电子邮箱
        	$("#PersonalDataModal").css('display', 'none');//用户名称
    		$("#PersonalDataModalDZYX").show();
    	}
        //修改电子邮箱 X关闭按钮
        function Closecc(){
        	$("#PersonalDataModalDZYX").css('display', 'none');
        }
        
        
        
        
        
        //用户名称修改保存
			function Update(){		
			var signUpName=$("#signUpName").val();	
			var  signUpNamesess='${signuptable.signupname}';
			if(signUpName != null && signUpName !="" && signUpName != undefined){
			
			if( signUpNamesess == signUpName){
			  layer.msg("不能和原名相同！");
			}else{
			  
				$("#FormPersonalData").ajaxSubmit(function(data){
				if((typeof data)=="string"){
					data=JSON.parse(data);
				}
				
				if(data.state){
				layer.msg(data.msg);
				//setTimeout(data.msg, 2000);//成功时  绑值
			   setTimeout('location.reload()',2000); //指定后 2秒刷新
        	$("#PersonalDataModal").css('display', 'none');//用户名称modal 隐藏
				//$("#span_signupname").text(signUpName);//偷懒
				}else{
				setTimeout(data.msg, 2000);
				}
			})}
			}else{ layer.msg("值不能为空！");}
			
		}
		
		  //修改身份证号保存
			function but_Update_SFZ(){
			var idnumber=$("#idnumber").val();	
			var idnumbera=$("#idnumbera").val();	
			
			if(idnumber != null && idnumber !="" && idnumber != undefined &&
			  idnumbera != null && idnumbera !="" && idnumbera != undefined
			){
			if( idnumber != idnumbera){
			  layer.msg("确认身份证号不一致！");
			}else{
			 
				$("#FormPersonalDataSFZ").ajaxSubmit(function(data){
				if((typeof data)=="string"){
					data=JSON.parse(data);
				}
				//layer.msg(data.msg);
				if(data.state){
				//setTimeout("修改成功", 2000);//成功时  绑值
					 $("#PersonalDataModalSFZ").css('display', 'none');//身份证 
        	
				layer.msg("修改成功");
				
				//$("#span_Idnumber").text(data.msg);//(后台处理返回)
				
				setTimeout('location.reload()',2000); //指定后 2秒刷新
				}else{
				layer.msg("修改失败");
				//setTimeout("修改失败", 2000);
				}
			})}
			}else{ layer.msg("值不能为空！");}
			
		}
		
		 //修改银行号保存
			function but_Update_YHK(){
			var bankcard=$("#bankcard").val();	
			var bankcarda=$("#bankcarda").val();	
			
			if(bankcard != null && bankcard !="" && bankcard != undefined &&
			  bankcarda != null && bankcarda !="" && bankcarda != undefined
			){
			if( bankcard != bankcarda){
			  layer.msg("确认银行号不一致！");
			}else{
			 
				$("#FormPersonalDataYHK").ajaxSubmit(function(data){
				if((typeof data)=="string"){
					data=JSON.parse(data);
				}
				
				if(data.state){
				$("#PersonalDataModalYHK").css('display', 'none');//银行卡
        	
				//setTimeout("修改成功", 2000);//成功时  绑值
				layer.msg("修改成功");
				//$("#span_Bankcard").text(data.msg);//(后台处理返回)
				setTimeout('location.reload()',2000); //指定后 2秒刷新
				}else{
				layer.msg("修改失败");
				//setTimeout("修改失败", 2000);
				}
			})}
			}else{ layer.msg("值不能为空！");}
			
		}
		
		 //电子邮箱修改保存
			function but_Update_DZYX(){
			var mailbox=$("#mailbox").val();
			var mailboxa=$("#mailboxa").val();
			
			if(mailbox != null && mailbox !="" && mailbox != undefined &&
			mailboxa != null && mailboxa !="" && mailboxa != undefined
			){
			
			if( mailbox != mailboxa){
			  layer.msg("确认电子邮箱不一致！！");
			}else{
			  
				$("#FormPersonalDataDZYX").ajaxSubmit(function(data){
				if((typeof data)=="string"){
					data=JSON.parse(data);
				}
				
				if(data.state){
				$("#PersonalDataModalDZYX").css('display', 'none');//电子邮箱
				layer.msg("修改成功");
				//setTimeout(data.msg, 2000);//成功时  绑值
				//$("#span_Mailbox").text(mailbox);//偷懒
				setTimeout('location.reload()',2000); //指定后 2秒刷新
				}else{
				layer.msg("修改失败");
				//setTimeout(data.msg, 2000);
				}
			})}
			}else{ layer.msg("值不能为空！");}
			
		}
		
		
		
		//图片保存
		function inserttop(){
			var layerIndex=layer.load();
			$("#formUserManInsert").ajaxSubmit(function(data){
				if ((typeof data)=="string") {
					data=JSON.parse(data);
				}
				console.log(data);
                layer.close(layerIndex);
                    
				if(data.state==true){
					showToastr('',data.msg,2,2000,'',true);
				 /*    setTimeout(function () {
                        window.location.href="${ctx}/conpany/list.do";
                    },2000); */
                }else{
                	showToastr('',data.msg,4,2000,'',true);
                }
			});	
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
    
    //修改弹框   应带数据回填
    function modeTS(){
    	
      $("#modservice_room_message").modal("show");//修改个人公司模板mod显示
      // $("#modservice_room_message").modal("hide");//修改个人公司模板mod隐藏
    }
    
    
    //修改保存其他信息
    	function insert(){
		
		 //var  ZHI= $("#administratorName").val();
			var layerIndex=layer.load();
			$("#formUserInsert_QT").ajaxSubmit(function(data){
				if ((typeof data)=="string") {
					data=JSON.parse(data);
				}
				console.log(data);
                layer.close(layerIndex);
                    
				if(data.state==true){
				    layer.msg("修改完成");
				    //隐藏model//后台更新数据  
				    setTimeout('location.reload()',2000); //指定后 2秒刷新
				     
                }else{
                  layer.msg("修改失败");
                }
			});	
		
		
			
		}
		
		  
		 //身份证
             $("#idnumber").change(function(){
            var phone=$("#idnumber").val();
            if(!/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx])|([1−9]\d5\d2((0[1−9])|(10|11|12))(([0−2][1−9])|10|20|30|31)\d2[0−9Xx])|([1−9]\d5\d2((0[1−9])|(10|11|12))(([0−2][1−9])|10|20|30|31)\d2[0−9Xx])/.test(phone)  && phone != phone>1){
            layer.alert($("#idnumber").val(),{icon:5,title:"身份证号不正确！"});
            $("#idnumber").val("")
            }
            
            })
            
             //身份证确认
            $("#idnumbera").change(function(){
            var phone=$("#idnumbera").val();
            if(!/(^[1-9]\d{5}(18|19|([23]\d))\d{2}((0[1-9])|(10|11|12))(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx])|([1−9]\d5\d2((0[1−9])|(10|11|12))(([0−2][1−9])|10|20|30|31)\d2[0−9Xx])|([1−9]\d5\d2((0[1−9])|(10|11|12))(([0−2][1−9])|10|20|30|31)\d2[0−9Xx])/.test(phone)  && phone != phone>1){
            layer.alert($("#idnumbera").val(),{icon:5,title:"身份证号不正确！"});
            $("#idnumbera").val("")
            }
            
            })
            
            
            function  cssss(){
             window.location.href="${ctx}/securityXXweb/cesss.do";
            
            }
            
                     
    </script>
  </body>
</html>
