<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set value="${pageContext.request.contextPath}" scope="page" var="ctx"></c:set>
<html>
  <head>
    <title>My JSP'libbbbbb.jsp'page</title>
	 <link rel="stylesheet" href="${ctx}/CQW/cropbox.css" type="text/css"></link>	
	 
  </head>
  <body>
     <!-- 头像图片  -->
                       <div style="">
                            <div id="editImageDiv">
                                <div class="container"  style="width: 400px; margin-right: 300px;">
                                    <div class="imageBox">
                                        <div class="thumbBox"></div>
                                        <div class="spinner" style=""></div>
                                    </div>
                                    <div class="action">
                                        <div class="new-contentarea tc">
                                            <a href="javascript:void(0)" class="upload-img">
                                                <i class="fa fa-image"></i>
                                                <label for="upload-file">请先选择图片...</label>
                                            </a>
                                          <input type="text" hidden="hidden" name="signupId" value="${signuptable.signupId}"/>
                                          <input type="file" class="" name="upload_file" id="upload-file">  
                                        </div>
                                        <input type="button" id="btnCrop"  class="Btnsty_peyton2"  value="保存">
                                        
                                        <input type="button" id="btnZoomIn" class="Btnsty_peyton" value="+">
                                        <input type="button" id="btnZoomOut" class="Btnsty_peyton" value="-">
                                    </div>
                                    <div class="cropped"></div>
                                </div>
                            </div>
                     <!--  图片 -->
                        </div>	
                          
    <script type="text/javascript" src="${ctx}/CQW/jquery.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/bootstrap.js"></script>
    <script type="text/javascript" src="${ctx}/CQW/cropbox.js"></script> <%-- 必须 --%>
   

    <script >   
var image ="";
$(window).load(function() {
    var options = {
        thumbBox: '.thumbBox',
        spinner: '.spinner',
        imgSrc: ''
    }
    var cropper = $('.imageBox').cropbox(options);
    var img = "";
    $('#upload-file').on('change', function() {
        var reader = new FileReader();
        reader.onload = function(e) {
            options.imgSrc = e.target.result;
            cropper = $('.imageBox').cropbox(options);
        }
        reader.readAsDataURL(this.files[0]);
        this.files = [];
        getImg();
    })
    
    $('#btnCrop').on('click', function() {
         image = cropper.getDataURL();
         $.ajax(
                 {
                     url:"${ctx}/securityXXweb/bbbbb.do",
                     data: {imagea:image},
                     dataType:"json",
                     type:"POST",//必须post    get提交数据有限制
                    success:function(data)
                    {
                    //1.成功的处理
                     if (data.state == true) {
                        alert("上传成功！");
                         } else {
                         alert("上传失败！");
                                  }
                     }
                   });
    })
    
  
    function getImg() {
        img = cropper.getDataURL();
        $('.cropped').html('');
        $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:180px;margin-top:4px;border-radius:180px;box-shadow:0px 0px 12px #7E7E7E;"><p>180px*180px</p>');
        $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:128px;margin-top:4px;border-radius:128px;box-shadow:0px 0px 12px #7E7E7E;"><p>128px*128px</p>');
        $('.cropped').append('<img src="' + img + '" align="absmiddle" style="width:64px;margin-top:4px;border-radius:64px;box-shadow:0px 0px 12px #7E7E7E;" ><p>64px*64px</p>');
    }
    $(".imageBox").on("mouseup", function() {
        getImg();
    });
    $('#btnZoomIn').on('click', function() {
        cropper.zoomIn();
    })
    $('#btnZoomOut').on('click', function() {
        cropper.zoomOut();
    })
});

   </script>
  </body>
</html>
