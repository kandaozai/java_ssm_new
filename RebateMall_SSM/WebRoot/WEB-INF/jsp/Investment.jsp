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
	<link rel="stylesheet" href="${ctx}/CQW/laydate.css" type="text/css"></link>
	<%-- <link rel="stylesheet" href="${ctx}/CQW/laydate(1).css" type="text/css" id="LayDateSkin"></link> --%>
	<link rel="stylesheet" href="${ctx}/CQW/layer.css" type="text/css" id="layui_layer_skinlayercss"></link>
	<style type="text/css">
		fieldset {
            padding: .35em .625em .75em;
            margin: 10px 25px;
            border: 1px solid silver
        }
        legend {
            margin: 0;
            padding: 5px;
            border: 0;
            width: auto;
            font-size: 12px;
            color: #777;
        }
        
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
	
	<content>
	    <div class="login_main">
	        <div class="banner_list clearfix">
			    <div style="opacity: 0; z-index: 0; background-image: url(&quot;${ctx}/CQW/image/login_bg1.jpg&quot;); background-color: rgb(34, 213, 213);"></div>
			    <div style="opacity: 1; z-index: 10; background-image: url(&quot;${ctx}/CQW/image/login_bg2.jpg&quot;); background-color: rgb(254, 241, 102);"></div>
		    </div>
		    
		    <!-- -->
		    <div class="form_box clearfix">
			    <div class="formsm">
				    <img src="${ctx}/mainsy/getUserPicturecon.do?file=${conpanytable.picture}">
				    <span><em>${conpanytable.companyname}</em></span>
				    <fieldset>
                        <legend style="color:#000000;">投资申报填写资料</legend>                   
				    <form id="investform" action="${ctx}/detailsweb/doInsert.do" class="form-horizontal form-radius" method="post" enctype="multipart/form-data">
				    	<input type="reset" name="reset" style="display: none;"/>
	                   <input type="text" style="display: none;" class="form-control"  name="investplatform" value="${conpanytable.website }"/>
	                   <input type="text" style="display: none;" class="form-control"  name="companyid" value="${conpanytable.companyid}"/>
	                    <div class="form-group">
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">真实姓名：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <input type="text" class="form-control" id="enrName" name="enrname" />
		                    </div>
		                    
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">手机号码：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <input type="text" class="form-control" id="phoneNumber" name="phonenumber" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"  maxlength="11"/>
		                    </div>
                		</div>
                		
                		<div class="form-group">
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">用户名称：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <input type="text" class="form-control" id="enrUsers" name="enrusers" value="${SignUpNameCS}" />
		                    </div>	                		
                		
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">投资金额：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <input type="text" class="form-control" id="investJer" name="investjer" onkeyup="this.value=this.value.replace(/\D/g,'')" onafterpaste="this.value=this.value.replace(/\D/g,'')"/>
		                    </div>	                    		                    
                		</div>
                		
                		<div class="form-group">
                			<div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">投资日期：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <input type="Date" class="form-control" id="investDate" name="investdateBSA" />
		                    </div>
		                    
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">平台背景：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <select class="form-control" id="platformBackgroundId" name="platformbackgroundid" >
	                            	<c:forEach items="${platformbackgroundtables}" var="PlatformBackgroundtable">
	                            		<option value="${PlatformBackgroundtable.platformbackgroundId}">${PlatformBackgroundtable.platformbackground}</option>
	                            	</c:forEach>
	                            </select>
		                    </div>
                		</div>
                		
                		<div class="form-group">
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">投资期限：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <select class="form-control" id="deadlineId" name="deadlineid" >
	                            	<c:forEach items="${deadlinetable}" var="Deadlinetable">
	                            		<option value="${Deadlinetable.deadlineId}">${Deadlinetable.deadline}</option>
	                            	</c:forEach>
	                            </select>
		                    </div>
		                    
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">方案名称：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <select class="form-control" id="programId" name="programid" >
	                            	<c:forEach items="${programtable}" var="Programtable">
	                            		<option value="${Programtable.programId}">${Programtable.program}</option>
	                            	</c:forEach>
	                            </select>
		                    </div>		                    		                    		                    
                		</div>
                		
                		<div class="form-group">
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">备注信息：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <input type="text" class="form-control" id="note" name="note" />
		                    </div>                		
                		
		                    <div class="col-md-2" style="padding-right:0px;padding-left:30px;padding-top:10px;">
		                        <label class="control-label" style="font-family:KaiTi;font-size:18px;">上传凭证：</label>
		                    </div>
		                    <div class="col-md-4" style="padding-left:0px;margin-top:10px;">
		                        <input type="file" class="form-control" id="certificate" name="fileGG" />
		                    </div>
                		</div>
                		<div class="col-lg-12 col-md-12 col-sm-12" style="padding-right:25px;">
		              <div class="text-right">
		                  <button type="button" onClick="invest()" style="width:110px;height:40px; color:#fff; background-color:#fb685a;font-family:KaiTi;font-size:20px;">确定</button>
		                  <button type="reset" style="width:110px;height:40px; color:#fff;background-color:#fb685a;font-family:KaiTi;font-size:20px;">重置</button>
		              </div>
		          	</div>
				    </form>
				    </fieldset>
					
	            </div>
		    </div>
			<!--用户登录框结束-->
	    </div>
    </content>
	
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
    
	<script src="${ctx}/assets/plugins/layer/layer.js" type="text/javascript"></script>
	<script src="${ctx}/assets/plugins/jquery.form-3.46.0/jquery.form.js" type="text/javascript"></script>
    <script src="${ctx}/assets/plugins/toastr/toastr.min.js" type="text/javascript"></script>
	<script src="${ctx}/assets/mycustom/js/mycustom.js" type="text/javascript"></script>

    <script type="text/javascript">
    	function invest(){
    		var layerIndex=layer.load();
    		
    		if(1==1){
    			
    			var JE = $('#investform [name="investJer"]').val();//投资金额
    			var FL= JE * 0.045;
	    		$("#investform").ajaxSubmit(function(data){
					if ((typeof data)=="string") {
						data=JSON.parse(data);
					}
					console.log(data);
	                layer.close(layerIndex);
	                    
					if(data.state==true){
						showToastr('',data.msg,2,2000,'',true);
					    setTimeout(function () {
	                        window.location.href="${ctx}/mainsy/MainIndex.do";
	                        alert("恭喜你!!!  投资了" + JE + "元，获得返利"  + FL + "元，请到账户信息查看");
	                    },2000);
	                }else{
	                	showToastr('',data.msg,4,2000,'',true);
	                }
				})
			}else{
				alert("请填写信息完整");
				layer.close(layerIndex);
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
    
     $("#phoneNumber").change(function(){
            var phone=$("#phoneNumber").val();
            if(!/^1[3|4|5|8][0-9]\d{8}$/.test(phone)  && phone != phone>0){
            layer.alert($("#phoneNumber").val(),{icon:5,title:"电话号码不正确！"});
            $("#phoneNumber").val("")
            }
            
            })
            
             // 去数字强行输入的字母
            $("#phoneNumber,#investJer").on('blur', function () {
                var $asdfg = $(this);
                  $asdfg.val(($asdfg.val().replace(/[^\d]/g, '')))//去除匹配值 去除非数字
            })
    
    </script>
  </body>
</html>
