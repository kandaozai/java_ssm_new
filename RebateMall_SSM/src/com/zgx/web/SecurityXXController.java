package com.zgx.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONSerializer;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.zgx.po.Signuptable;
import com.zgx.service.IRenWuService;
import com.zgx.service.ISignupService;
import com.zgx.vo.JsonReturn;

/**
 * 
 * 我的账户---账户安全
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/securityXXweb")
public class SecurityXXController {
	

	@Autowired
	private ISignupService signupService;//用户（登录）注册
	
	//IAccountService accountService;//账户安全
	
	@Autowired
	private  IRenWuService renWuService;//任务
		

	//账户安全页面跳转
	@RequestMapping("/Account")
	public String Account(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
			//账户安全—信息认证绑定
		 	HttpSession session=req.getSession();
		 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
		 	
		 	
			try{
				req.setAttribute("table_HT", tabel);
				//地址拆分
				String  strJZ=tabel.getLiving();//居住地详细地址
				String[] sArray=strJZ.split("A");//以字符A为切割点 切成数组
				String  strQ="";//获取数组值的第一个值
				String  strH="";
				try{strQ=sArray[0];}catch (Exception e) {strQ="";}
				try{strH=sArray[1];}catch (Exception e) {strH="";}
				req.setAttribute("req_DZ", strQ);
				req.setAttribute("req_DZ_XX", strH);
				
				String  strJZ2=tabel.getHomeaddress();//居住地详细地址
				String[] sArray2=strJZ2.split("A");//以字符A为切割点 切成数组
				String  strQ2=sArray2[0];//获取数组值的第一个值
				String  strH2=sArray2[1];
				
				try{strQ2=sArray2[0];}catch (Exception e) {strQ2="";}
				try{strH2=sArray2[1];}catch (Exception e) {strH2="";}
				
				req.setAttribute("req_DZ2", strQ2);
				req.setAttribute("req_DZ_XX2", strH2);
				
				
				req.setAttribute("SignUpIdCS", tabel.getSignupId());
				req.setAttribute("SignUpNameCS", tabel.getSignupname());
				req.setAttribute("HeadportraitCS", tabel.getHeadportrait());
				String he="";
				try{
					String strstr=tabel.getPhonenumber();//178 739 237 89
					String qiang=strstr.substring(0, 3);//178
					String hou=strstr.substring(9, 11);//89
					 he=qiang+"***"+hou;
				}catch (Exception e) {
					he=tabel.getPhonenumber();
				}
				req.setAttribute("PhonenumberCS", he);//手机号码
				String hes="";
				try{
					String strstr=tabel.getIdnumber();//4409 82 1996 0202 3989
					String qiang=strstr.substring(0, 4);//178
					String hou=strstr.substring(16, 18);//89
					hes=qiang+"***"+hou;
				}catch (Exception e) {
					hes=tabel.getIdnumber();
				}
				req.setAttribute("IdnumberCS", hes);//身份证
				
				String hey="";
				try{
					String strstr=tabel.getBankcard();//16~19位
					
					String hou=strstr.substring(strstr.length()-5, strstr.length());//截取后5位
					hey="***"+hou;
				}catch (Exception e) {
					hey=tabel.getBankcard();
				}
				req.setAttribute("BankcardCS", hey);//银行卡
				req.setAttribute("MailboxCS", tabel.getMailbox());//邮箱
				req.setAttribute("RebateFreezeCS", tabel.getRebatefreeze());// 返利冻结
				req.setAttribute("TXFreezeCS", tabel.getTxfreeze());// 提现冻结
				req.setAttribute("SumCS", tabel.getSum());//可用金额
			}catch (Exception e) {

			}
		 	
		 	if(tabel != null){
		 	req.setAttribute("signuptable", tabel);		
		 	
		 	return "/Account";//跳转到账户安全
		 	
			}else{
				return "redirect:/mainsy/MainIndex.do";//重定向首页
				
			}
		}
		
		//用户名称修改保存
	@ResponseBody
	@RequestMapping(value="/Update",produces="application/json")
		public Object Update(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
		
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		
		//获取jsp页面输入值
		String strsignUpId=req.getParameter("signupId");
		String signUpName=req.getParameter("signupname");
		
		int signUpId=Integer.parseInt(strsignUpId);
		//实例化表
		Signuptable Signup=new Signuptable();			
		Signup.setSignupId(signUpId);
		Signup.setSignupname(signUpName);						
		boolean bolS = signupService.updatePramone(Signup);
		if (bolS) {
			HttpSession session=req.getSession();
		 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
		 	Signuptable chongxie=new Signuptable();
		 	chongxie=tabel;
		 	chongxie.setSignupname(signUpName);
		 	session.setAttribute("SESSION_USER", chongxie);
		 	
			jsonReturn.setMsg("修改成功");
			jsonReturn.setState(true);
		} else {
			jsonReturn.setMsg("修改失败");
			jsonReturn.setState(false);
		}

		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}


	//身份证修改保存
	@ResponseBody
	@RequestMapping(value="/UpdateSFZ",produces="application/json")
	public Object UpdateSFZ(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		//获取jsp页面输入值
		String strsignUpId=req.getParameter("signupId");
		String idnumberstr=req.getParameter("idnumber");

		int signUpId=Integer.parseInt(strsignUpId);
		//实例化表
		Signuptable Signup=new Signuptable();			
		Signup.setSignupId(signUpId);
		Signup.setIdnumber(idnumberstr);						
		boolean bolS = signupService.updatePramoneSFZ(Signup);
		
		String hes="";
		try{
			String strstr=idnumberstr;//4409 82 1996 0202 3989
			String qiang=strstr.substring(0, 4);//178
			String hou=strstr.substring(16, 18);//89
			hes=qiang+"***"+hou;
		}catch (Exception e) {
			hes="******";
		}
		
		if (bolS) {
			HttpSession session=req.getSession();
		 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
		 	Signuptable chongxie=new Signuptable();
		 	chongxie=tabel;
		 	chongxie.setIdnumber(idnumberstr);
		 	session.setAttribute("SESSION_USER", chongxie);
		 	
		 	//尝试修改任务记录状态 为3（已审核）
		 	//关于个人任务   和这里    难联系起来        反着写也难联系起来          原因：个人任务是（可随意添加）动态      基础信息是（基本）固定
		 	//（固定的个人任务，比较易）
		 	try{//当前用的是固定模式
		 	
		 	//不用它了taskLogID   以  taskID=1  用户ID=当前   为条件  修改
		 	boolean signtable1=renWuService.updateYSH(1,tabel.getSignupId());//修改状态为  已领取
		 		
		 	} catch (Exception e) {}
		 	
			
			//jsonReturn.setMsg("修改成功");
			jsonReturn.setMsg(hes);
			jsonReturn.setState(true);
		} else {
			//jsonReturn.setMsg("修改失败");
			jsonReturn.setState(false);
		}

		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}

	//银行卡修改保存
	@ResponseBody
	@RequestMapping(value="/UpdateYHK",produces="application/json")
	public Object UpdateYHK(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		//获取jsp页面输入值
		String strsignUpId=req.getParameter("signupId");
		String bankcardstr=req.getParameter("bankcard");

		int signUpId=Integer.parseInt(strsignUpId);
		//实例化表
		Signuptable Signup=new Signuptable();			
		Signup.setSignupId(signUpId);
		Signup.setBankcard(bankcardstr);						
		boolean bolS = signupService.updatePramoneYHK(Signup);
		
		
		String hey="";
		try{
			String strstr=bankcardstr;//16~19位
			
			String hou=strstr.substring(strstr.length()-5, strstr.length());//截取后5位
			hey="***"+hou;
		}catch (Exception e) {
			hey="******";
		}
		
		if (bolS) {
			HttpSession session=req.getSession();
		 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
		 	Signuptable chongxie=new Signuptable();
		 	chongxie=tabel;
		 	chongxie.setBankcard(bankcardstr);
		 	session.setAttribute("SESSION_USER", chongxie);
			
			/*jsonReturn.setMsg("修改成功");*/
			jsonReturn.setMsg(hey);
			jsonReturn.setState(true);
		} else {
			/*jsonReturn.setMsg("修改失败");*/
			jsonReturn.setState(false);
		}

		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}


	//电子邮箱修改保存
	@ResponseBody
	@RequestMapping(value="/UpdateDZYX",produces="application/json")
	public Object UpdateDZYX(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		//获取jsp页面输入值
		String strsignUpId=req.getParameter("signupId");
		String mailboxstr=req.getParameter("mailbox");

		int signUpId=Integer.parseInt(strsignUpId);
		//实例化表
		Signuptable Signup=new Signuptable();			
		Signup.setSignupId(signUpId);
		Signup.setMailbox(mailboxstr);						
		boolean bolS = signupService.updatePramoneDZYX(Signup);
		if (bolS) {
			HttpSession session=req.getSession();
		 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
		 	Signuptable chongxie=new Signuptable();
		 	chongxie=tabel;
		 	chongxie.setMailbox(mailboxstr);
		 	session.setAttribute("SESSION_USER", chongxie);
		 	
			jsonReturn.setMsg("修改成功");
			jsonReturn.setState(true);
		} else {
			jsonReturn.setMsg("修改成功");
			jsonReturn.setState(false);
		}

		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}



	//修改图片  (不用了，用下面的)
	@ResponseBody
	@RequestMapping(value="/tupian",produces="application/json")
	/*public Object tupian(@RequestParam(value="upload_file",required=false)MultipartFile myFile,HttpServletRequest req){*/
		public Object tupian(@RequestParam(value="upload_file",required=false)MultipartFile myFile,HttpServletRequest req){
     
		
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		
		String FileName="";
		int inintt =0;
		
		String strsignUpId=req.getParameter("signupId");
		int signUpId=Integer.parseInt(strsignUpId);
		
		Signuptable Signup=new Signuptable();			
		Signup.setSignupId(signUpId);
		
		try{
 			if(myFile.isEmpty()){  
	 			System.out.println("未上传图片");
	 		}else{
	 			
	 			
	 			//上传下载目录的路径
	 			String upDir="E:/upload/UserO";
	 			//获取文件原名
	 			String fullName=myFile.getOriginalFilename();
	 			//获取文件扩展名称
	 			String ext=fullName.substring(fullName.lastIndexOf('.'));
	 			//拼接文件保存名称
	 		    FileName=System.nanoTime()+ext;
	 			
	 			//保存文件（图片）
	 			FileUtils.writeByteArrayToFile(new File(upDir,FileName), myFile.getBytes());
	 			
	 			System.out.println("保存文件名称为："+FileName);
	 			//userType.setHeadportrait(FileName);//图片
	 			Signup.setHeadportrait(FileName);
	 			inintt=1;
	 		}
 			
 		}catch (Exception e) {
 			Signup.setHeadportrait(null);//图片
		}
			
		boolean bolS = signupService.updatetable(Signup);
		if (bolS) {
			HttpSession session=req.getSession();
 			
 			Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
 			if(inintt==1){
 				try{
	 				 // 删除旧的图片
		 			String uploadPath = "E:\\upload\\UserO";//String upDir="E:/upload/UserO";
		 			String oldFilePath = uploadPath + File.separator
		 					+ tabel.getHeadportrait();
		 			File oldFile = new File(oldFilePath);
		 			if (oldFile.exists() && oldFile.isFile()) {
		 				oldFile.delete();
		 			}
	 			}catch (Exception e) {}
 				
 			}
 			//重写SESSION_USER 值（图片问题需要重写）
 			tabel.setHeadportrait(FileName);
 			session.setAttribute("SESSION_USER",tabel);
			//headportrait
			jsonReturn.setMsg("上传成功！");
			jsonReturn.setState(true);
			
			
		} else {
			
			// 删除刚新增的图片
 			String uploadPath = "E:\\upload\\UserO";//String upDir="E:/upload/UserO";
 			String oldFilePath = uploadPath + File.separator+ FileName;

 			File oldFile = new File(oldFilePath);
 			if (oldFile.exists() && oldFile.isFile()) {
 				oldFile.delete();
 			}
			jsonReturn.setMsg("上传失败！");
			jsonReturn.setState(false);
		}
		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}
	
	
	//修改图片
	@ResponseBody
	@RequestMapping(value="/cesss",produces="application/json")
      public Object cesss(HttpServletRequest req){
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		
		 HttpSession session=req.getSession();
		 Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");//需要会员ID
		
		//如果目录不存在就创建
        String uploadPath = "E:\\upload\\UserO";
        File uploadDir=new File(uploadPath);
         if (!uploadDir.exists()) {
	      uploadDir.mkdir();
        }
        
         String strimagea=req.getParameter("imagea");//获取ajax提交过来的字符串（图片的编码格式）
         //不过需要注意的是，一般插件返回的base64编码的字符串都是有一个前缀的。"data:image/jpeg;base64," 最后用逗号区分   解码之前这个得去掉。
 		  String[] arlstr = strimagea.split(",");//切割获取后部分
 		
 		  String  ccdff=arlstr[1];
 		  String  tpMCQ=System.nanoTime()+".jpg";
 		 //先尝试保存
     	 try{
     		 generateImage(ccdff, "E:/upload/UserO/"+tpMCQ);//将base64编码字符串转换为图片
     		 jsonReturn.setState(true);
     	 }catch (Exception e) {
  			jsonReturn.setState(false);
 		}
         
     	 if(jsonReturn.getState()){
     		 Signuptable Signup=new Signuptable();			
    		 Signup.setSignupId(tabel.getSignupId());
    		 
    		 Signup.setHeadportrait(tpMCQ);//图片  需要进行判断
    		 boolean bolS = signupService.updatetable(Signup);//只需要会员ID  和    图片名称
    		 if(bolS){//重写SESSION_USER 值（图片问题需要重写）
    			 
    			 try{//删除旧图片
    	 	 			String oldFilePath = uploadPath + File.separator+ tabel.getHeadportrait();
    	 	  			File oldFile = new File(oldFilePath);
    	 	  			if (oldFile.exists() && oldFile.isFile()) {
    	 	  				oldFile.delete();
    	 	  			}
    				 
    			 }catch (Exception e) { }
    			
    			    Signuptable Signupcx=new Signuptable();
    			    Signupcx=tabel;
    			    Signupcx.setHeadportrait(tpMCQ);
    	 			session.setAttribute("SESSION_USER",Signupcx);
    	 		
    			 
    		 }
    		 
     	 }else{
     		// 删除刚新增的图片
  			String oldFilePath = uploadPath + File.separator+ tpMCQ;
  			File oldFile = new File(oldFilePath);
  			if (oldFile.exists() && oldFile.isFile()) {
  				oldFile.delete();
  			}
     		 
     	 }
         
        
 		 return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里
 		  
 		  
	}
	
	///
		@RequestMapping("/lissss")
		public String lissss(HttpServletRequest req, HttpServletResponse resp)
						throws ServletException, IOException {
					
			 	return "/libbbbbb";//跳转界面
			}
	
	
	//修改图片bbbbbbbbbbbb
		@ResponseBody
		@RequestMapping(value="/bbbbb",produces="application/json")
	      public Object bbbbb(HttpServletRequest req){
			JsonReturn jsonReturn = new JsonReturn();
			jsonReturn.setState(false);
			 HttpSession session=req.getSession();
			 Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");//获取登录时保存到session的用户数据
			
			//如果目录不存在就创建
	        String uploadPath = "E:\\upload\\lis";
	        File uploadDir=new File(uploadPath);
	         if (!uploadDir.exists()) {
		      uploadDir.mkdir();
	        }
	        
	         String strimagea=req.getParameter("imagea");//获取ajax提交过来的字符串（图片的编码格式）
	         //不过需要注意的是，一般插件返回的base64编码的字符串都是有一个前缀的。"data:image/jpeg;base64," 最后用逗号区分   解码之前这个得去掉。
	 		  String[] arlstr = strimagea.split(",");//切割获取后部分
	 		
	 		  String  ccdff=arlstr[1];
	 		  String  tpMCQ=System.nanoTime()+".jpg";
	 		 //先尝试保存
	     	 try{
	     		 generateImage(ccdff, "E:/upload/lis/"+tpMCQ);//将base64编码字符串转换为图片
	     		 jsonReturn.setState(true);
	     	 }catch (Exception e) {
	  			jsonReturn.setState(false);
	 		}
	         
	     	 if(jsonReturn.getState()){
	     		 Signuptable Signup=new Signuptable();			
	    		 Signup.setSignupId(tabel.getSignupId());
	    		 
	    		 Signup.setHeadportrait(tpMCQ);//图片  需要进行判断
	    		 boolean bolS = signupService.updatetable(Signup);//只需要会员ID  和    图片名称
	    		 if(bolS){//重写SESSION_USER 值（图片问题需要重写）
	    			 
	    			 try{//删除旧图片
	    	 	 			String oldFilePath = uploadPath + File.separator+ tabel.getHeadportrait();
	    	 	  			File oldFile = new File(oldFilePath);
	    	 	  			if (oldFile.exists() && oldFile.isFile()) {
	    	 	  				oldFile.delete();
	    	 	  			}
	    			 }catch (Exception e) { }
	    			    Signuptable Signupcx=new Signuptable();
	    			    Signupcx=tabel;
	    			    Signupcx.setHeadportrait(tpMCQ);
	    	 			session.setAttribute("SESSION_USER",Signupcx);
	    	 		
	    		 }
	    		 
	     	 }else{
	     		// 删除刚新增的图片
	  			String oldFilePath = uploadPath + File.separator+ tpMCQ;
	  			File oldFile = new File(oldFilePath);
	  			if (oldFile.exists() && oldFile.isFile()) {
	  				oldFile.delete();
	  			}
	     	 }
	 		 return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里
		}
	
	
	/**
	 * @Description: 将base64编码字符串转换为图片
	 * @Author: 
	 * @CreateTime: 
	 * @param imgStr base64编码字符串
	 * @param path 图片路径-具体到文件
	 * @return
	*/
	public static boolean generateImage(String imgStr, String path) {
	 if (imgStr == null){
		return false;
	 }
	 
//	 不过需要注意的是，一般插件返回的base64编码的字符串都是有一个前缀的。
//	 "data:image/jpeg;base64," 解码之前这个得去掉。
	 
     BASE64Decoder decoder = new BASE64Decoder();
	 try {
	 // 解密
	 byte[] b = decoder.decodeBuffer(imgStr);
	 // 处理数据
	 for (int i = 0; i < b.length; ++i) {
	 if (b[i] < 0) {
	 b[i] += 256;
	 }
	 }
	 OutputStream out = new FileOutputStream(path);
	out.write(b);
	out.flush();
	out.close();
	return true;
	} catch (Exception e) {
		return false;
	} 
	}
	
	
	/**
	 * @Description: 根据图片地址转换为base64编码字符串
	 * @Author: 
	 * @CreateTime: 
	 * @return
	 */
	public static String getImageStr(String imgFile) {
	    InputStream inputStream = null;
	    byte[] data = null;
	    try {
	        inputStream = new FileInputStream(imgFile);
	        data = new byte[inputStream.available()];
	        inputStream.read(data);
	        inputStream.close();
	    } catch (IOException e) {
	        e.printStackTrace();
	    }
	    // 加密
	    BASE64Encoder encoder = new BASE64Encoder();
	    return encoder.encode(data);
	}
	
	
	
	//修改密码jsp页面
	@RequestMapping("/MMjsp")
	public String MMjsp(HttpServletRequest req, HttpServletResponse resp)
						throws ServletException, IOException {
				//账户安全—信息认证绑定
			 	HttpSession session=req.getSession();
			 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
			 	
			 	
				try{
					req.setAttribute("SignUpIdCS", tabel.getSignupId());
					req.setAttribute("SignUpNameCS", tabel.getSignupname());
					req.setAttribute("HeadportraitCS", tabel.getHeadportrait());
					
				}catch (Exception e) {

				}
			 	
			 	if(tabel != null){
			 	req.setAttribute("signuptable", tabel);		
			 	
			 	return "/MM";//跳转到修改密码界面
			 	
				}else{
					return "redirect:/mainsy/MainIndex.do";//重定向首页
					
				}
			}
	
	    //修改手机号jsp页面
		@RequestMapping("/SJHjsp")
		public String SJHjsp(HttpServletRequest req, HttpServletResponse resp)
							throws ServletException, IOException {
					//账户安全—信息认证绑定
				 	HttpSession session=req.getSession();
				 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
				 	
				 	
					try{
						req.setAttribute("SignUpIdCS", tabel.getSignupId());
						req.setAttribute("SignUpNameCS", tabel.getSignupname());
						req.setAttribute("HeadportraitCS", tabel.getHeadportrait());
						
					}catch (Exception e) {

					}
				 	
				 	if(tabel != null){
				 	req.setAttribute("signuptable", tabel);		
				 	
				 	return "/SJH";//跳转到修改密码界面
				 	
					}else{
						return "redirect:/mainsy/MainIndex.do";//重定向首页
						
					}
				}
		
	

	
		
//		//登录密码修改保存
//		private void UpdatePa(HttpServletRequest req, HttpServletResponse resp)
//					throws ServletException, IOException {
//			//获取jsp页面输入值
//			String strsignUpId=req.getParameter("signUpId");
//			String password=req.getParameter("password");
//			//转字符类型
//			password=Tools.ISOtoUTF8(password);
//			//打印获取到的输入值
//			System.out.println(password);
//			//判断是否为空
//			if (Tools.isNum(strsignUpId) && Tools.isNotNull(password)) {
//				int signUpId=Integer.parseInt(strsignUpId);
//				//实例化表
//				Signuptable Signupa=new Signuptable();			
//				Signupa.setSignUpId(signUpId);
//				Signupa.setPassword(password);						
//				boolean bolS = accountService.updatePa(Signupa);
//				if (bolS) {
//					req.setAttribute("msg", "修改成功");
//					req.getRequestDispatcher("/jsp/Login.jsp").forward(req, resp);
//				} else {
//					req.setAttribute("msg", "修改失败");
//				}
//			} else {
//				req.setAttribute("msg", "请补充完整");
//			}	
//		}

//		//手机号码修改保存
//		private void UpdatePb(HttpServletRequest req, HttpServletResponse resp)
//					throws ServletException, IOException {
//			//获取jsp页面输入值
//			String strsignUpId=req.getParameter("signUpId");
//			String phoneNumber=req.getParameter("phoneNumber");
//			//转字符类型
//			phoneNumber=Tools.ISOtoUTF8(phoneNumber);
//			//打印获取到的输入值
//			System.out.println(phoneNumber);
//			//判断是否为空
//			if (Tools.isNum(strsignUpId) && Tools.isNotNull(phoneNumber)) {
//				int signUpId=Integer.parseInt(strsignUpId);
//				//实例化表
//				Signuptable Signupb=new Signuptable();			
//				Signupb.setSignUpId(signUpId);
//				Signupb.setPhoneNumber(phoneNumber);						
//				boolean bolS = accountService.updatePb(Signupb);
//				if (bolS) {
//					req.setAttribute("msg", "修改成功");
//					req.getRequestDispatcher("/jsp/Login.jsp").forward(req, resp);
//				} else {
//					req.setAttribute("msg", "修改失败");
//				}
//			} else {
//				req.setAttribute("msg", "请补充完整");
//			}	
//		}
	
		//用户其他信息修改保存
	@ResponseBody
	@RequestMapping(value="/Update_QT",produces="application/json")
		public Object Update_QT(HttpServletRequest req, HttpServletResponse resp)
					throws ServletException, IOException {
		
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		
		HttpSession session=req.getSession();
	 	Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
		
		//获取jsp页面输入值
		String sexstr=req.getParameter("sex");
		String emotionalstatusIdstr=req.getParameter("emotionalstatusId");
		String yearofbirthstr=req.getParameter("yearofbirth");
		String occupationstr=req.getParameter("occupation");
		String livingstr=req.getParameter("living");
		String homeaddressstr=req.getParameter("homeaddress");
		
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");//设置日期格式
		 Date sj=new Date();
		try {
			sj = df.parse(yearofbirthstr);
		} catch (ParseException e) {
			sj=null;
		}//string 转date
		
		boolean bool=true;
		if(sexstr=="false"){
			bool=false;
		}
		
		//实例化表
		Signuptable Signup=new Signuptable();			
		Signup.setSex(bool);
		Signup.setEmotionalstatusId(Integer.parseInt(emotionalstatusIdstr));	
		Signup.setYearofbirth(sj);
		Signup.setOccupation(occupationstr);
		
		Signup.setSignupId(tabel.getSignupId());
		
		
//		Signup.setLiving(livingstr);//现居地
//		Signup.setHomeaddress(homeaddressstr);//家乡地址
		
		String strXX=req.getParameter("living_XX");//居住地详细地址
		String PJ=livingstr+"A"+strXX;
		Signup.setLiving(PJ);//居住地
		
		String strXXA=req.getParameter("homeaddress_XX");//家乡地详细地址
		String PJA=homeaddressstr+"A"+strXXA;
		Signup.setHomeaddress(PJA);//家乡地址
		
		
		
		boolean bolS = signupService.updatePramoneQT(Signup);
		if (bolS) {
		 	Signuptable chongxie=new Signuptable();
		 	chongxie=tabel;
		 	chongxie.setSex(bool);
		 	chongxie.setEmotionalstatusId(Integer.parseInt(emotionalstatusIdstr));	
		 	chongxie.setYearofbirth(sj);
		 	chongxie.setOccupation(occupationstr);
		 	chongxie.setLiving(livingstr);
		 	chongxie.setHomeaddress(homeaddressstr);
		 	session.setAttribute("SESSION_USER", chongxie);
		 	
			jsonReturn.setMsg("修改成功");
			jsonReturn.setState(true);
		} else {
			jsonReturn.setMsg("修改失败");
			jsonReturn.setState(false);
		}

		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}

}
