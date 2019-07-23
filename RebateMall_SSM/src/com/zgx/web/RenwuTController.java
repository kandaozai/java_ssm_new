package com.zgx.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.io.FileUtils;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zgx.po.Newstable;
import com.zgx.po.RenWutable;
import com.zgx.po.Signuptable;
import com.zgx.service.IRenWuService;
import com.zgx.service.ISignupService;
import com.zgx.service.InewsService;
import com.zgx.vo.JsonReturn;
import com.zgx.vo.Request;
/**
 * 
 * 任务 （任务大厅、我的任务）
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/RenwuT")
public class RenwuTController {
	
	
	@Autowired
	private  IRenWuService renWuService;//任务
	
//	@Autowired
//	private   IRenWuService  renWulogService;//任务记录等renWulogServiceImpl
	
//	IRenWuService shshenheServiceImpl;//审核
	
	@Autowired
	private InewsService  newsService;// 消息
	
	@Autowired
	private  ISignupService signupService;//用户

  
	//任务大厅页面跳转
	@RequestMapping("/renwu")
	public String renwu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
		request.setAttribute("SESSION_USERone", SU);
		try{
			request.setAttribute("SignUpIdCS", SU.getSignupId());
			request.setAttribute("SignUpNameCS", SU.getSignupname());
			request.setAttribute("HeadportraitCS", SU.getHeadportrait());
		}catch (Exception e) {

		}
		
		//查询结束日期小于当前日期的任务ID  再修改状态为无效             
		boolean sub= renWuService.updateWX();
		
		session.setAttribute("IDIDA",1);
	
		  //手写table表
		   List<RenWutable> list = renWuService.findPagenull();
		   request.setAttribute("listC", list);
		  
        return "/Renwudating";
	}
	
	//和上面的差不多
	@RequestMapping("/urlj")
	public String urlj(HttpServletRequest request, HttpServletResponse response){
	
		HttpSession session = request.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
		request.setAttribute("SESSION_USERone", SU);
		try{
			request.setAttribute("SignUpIdCS", SU.getSignupId());
			request.setAttribute("SignUpNameCS", SU.getSignupname());
			request.setAttribute("HeadportraitCS", SU.getHeadportrait());
		}catch (Exception e) {

		}
		
		session.setAttribute("IDIDA",1);
	
		  //手写table表
		   List<RenWutable> list = renWuService.findPagenull();
		   request.setAttribute("listC", list);
		
		
		
		String strye=request.getParameter("page_current");
		int DSA=Integer.parseInt(strye);
	//	HttpSession session=request.getSession();
		session.setAttribute("IDIDA",DSA);
		
		return "/Renwudating";
	}


	//我的任务页面跳转
	@RequestMapping("/woderenwu")
	public String woderenwu(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		HttpSession session = request.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据

		if(SU != null){

			request.setAttribute("SESSION_USERone", SU);
			try{
				request.setAttribute("SignUpIdCS", SU.getSignupId());
				request.setAttribute("SignUpNameCS", SU.getSignupname());
				request.setAttribute("HeadportraitCS", SU.getHeadportrait());
			}catch (Exception e) {

			}
			
			
			//table数据   就两条条件  
			String PJweb="";
			int DSAgao=0;
			try{
				 DSAgao=(Integer) session.getAttribute("stran");//高亮
			}catch (Exception e) {
				DSAgao=0;
			}
			
			
			
			if(DSAgao == 0 ){
				PJweb="state=1 && tasklogtable.SignUp_id="+SU.getSignupId();// 公司任务  
			}else if(DSAgao == 4){
				PJweb= "state=2 && tasklogtable.SignUp_id="+SU.getSignupId();// 个人任务
			}else{
				PJweb="state=1 && tasklogtable.SignUp_id="+SU.getSignupId();// 公司任务  
			}
				
		
			List<RenWutable> listweb = renWuService.findPagepramo(PJweb);
			
			request.setAttribute("listweb", listweb);
			
			return "/PersonalRenWu";
		}else{
			
			return "redirect:/mainsy/MainIndex.do";//重定向首页
		}


	}
	
	//和上面的差不多   将2个合起来
		@RequestMapping("/urljDT")
		public String urljDT(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {

			HttpSession session = request.getSession();
			Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据

			if(SU != null){

				request.setAttribute("SESSION_USERone", SU);
				try{
					request.setAttribute("SignUpIdCS", SU.getSignupId());
					request.setAttribute("SignUpNameCS", SU.getSignupname());
					request.setAttribute("HeadportraitCS", SU.getHeadportrait());
				}catch (Exception e) {

				}
				
				//table 数据
				String PJweb="";
				int DSAgao=0;
				
				 //尝试获取高亮 
				try{
					String strpjjishou = request.getParameter("intpjgg");//路径传来的高亮
					DSAgao=Integer.parseInt(strpjjishou);  
				}catch (Exception e) {
					DSAgao=4;//4 是默认值
				}
				
				//通过高亮选择对应的查询sql条件
				if(DSAgao == 4 ){
					PJweb= "state=2 && tasklogtable.SignUp_id="+SU.getSignupId();//个人信息（默认值）
				}else if(DSAgao == 0){
					PJweb="state=1 && tasklogtable.SignUp_id="+SU.getSignupId();// 公司信息
				}else{
					PJweb= "state=2 && tasklogtable.SignUp_id="+SU.getSignupId();//个人信息（默认值）
				}
				
				
				List<RenWutable> listweb = renWuService.findPagepramo(PJweb);
				
				request.setAttribute("listweb", listweb);
				
				int DSA=1;
				try{
					String strye=request.getParameter("page_current");//第几页 路径传来的参数
					DSA=Integer.parseInt(strye);
				}catch (Exception e) {
					DSA=1;
				}
				
				
				 
				session.setAttribute("IDIDA",DSA);//第几页
				
				session.setAttribute("IDIDAgao",DSAgao);//高亮
				
				
				
				return "/PersonalRenWu";
			}else{
				
				return "redirect:/mainsy/MainIndex.do";//重定向首页
			}


		}
	

	//判断任务    不存在：新增任务记录表  和审核表
	@ResponseBody
	@RequestMapping(value="/renwulog_pd",produces="application/json")
	public Object renwulog_pd(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JsonReturn jr =new  JsonReturn();
		jr.setState(false);//
		String HYID=request.getParameter("huiyuanID");//用户ID
		String rwID=request.getParameter("rwID");//任务ID
		
		RenWutable selerto=renWuService.findByIdtow(Integer.parseInt(rwID),Integer.parseInt(HYID));//查询是否有值

		if(selerto==null){//执行领取任务    和审核表
			RenWutable  renwuinse=new RenWutable();
			renwuinse.setTaskid(Integer.parseInt(rwID));
			renwuinse.setSignupId(Integer.parseInt(HYID));
			renwuinse.setLagstate(1);//0-未领取、1-未完成、2-完成

			Boolean rewuinsert=renWuService.insert(renwuinse);//新增任务记录表

			
			int sdff=renwuinse.getTasklogid();
			if(rewuinsert){//在新增对应的审核
				RenWutable  renSHwuinse=new RenWutable();
				renSHwuinse.setTasklogid(sdff);
				Boolean rewuSH=renWuService.insertSH(renSHwuinse);

				jr.setState(true);
			}
		}
		 return JSONSerializer.toJSON(jr);//需要引用架包文件lib里

	}


	
	//上传凭证  投资申报 （修改图片）
	@ResponseBody
	@RequestMapping(value="/SHdoInsert",produces="application/json")
	public Object SHdoInsert(@RequestParam(value="file_picture",required=false)MultipartFile myFile,HttpServletRequest req){
     //name="tasklogID"     file_picture
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);
		
		//构建上传目录的路径   
		String uploadPath="E:\\upload\\ToExamine";
		//如果目录不存在就创建
		File uploadDir=new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		String FileName="";
		int inintt =0;
		
		String strsignUpId=req.getParameter("tasklogID");
		int signUpId=Integer.parseInt(strsignUpId);
		
		RenWutable Signup=new RenWutable();			
		Signup.setTasklogid(signUpId);
		
		try{
 			if(myFile.isEmpty()){  
	 			System.out.println("未上传图片");
	 		}else{
	 			//获取文件上传属性
	 			System.out.println("图片大小："+myFile.getSize());
	 			System.out.println("图片类型："+myFile.getContentType());
	 			System.out.println("图片名称："+myFile.getName());
	 			System.out.println("图片原名："+myFile.getOriginalFilename());
	 			System.out.println("=====================================================");
	 			
	 			//上传下载目录的路径
	 			String upDir="E:/upload/ToExamine";
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
	 			Signup.setTupian(FileName);
	 			inintt=1;
	 		}
 			
 		}catch (Exception e) {
 			Signup.setTupian(null);//图片
		}
		//boolean bolS=false;
		//boolean bolS=shshenheServiceImpl.update(renWutable);//
		boolean bolS = renWuService.updateTP(Signup);
		if (bolS) {
			HttpSession session=req.getSession();
 			
 			Signuptable tabel =(Signuptable) session.getAttribute("SESSION_USER");
 			if(inintt==1){
 				try{
	 				 // 删除旧的图片
		 			//String uploadPath = "E:\\upload\\ToExamine";//String upDir="E:/upload/UserO";
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
 			//String uploadPath = "E:\\upload\\ToExamine";//String upDir="E:/upload/UserO";
 			String oldFilePath = uploadPath + File.separator
 					+ FileName;

 			File oldFile = new File(oldFilePath);
 			if (oldFile.exists() && oldFile.isFile()) {
 				oldFile.delete();
 			}
			jsonReturn.setMsg("上传失败！");
			jsonReturn.setState(false);
		}
		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}
	
	



					

//
//	//审核状态判断
//	private void SHZT(HttpServletRequest request, HttpServletResponse response)
//			throws ServletException, IOException {
//		JsonReturn jr =new  JsonReturn();
//		jr.setState(false);//
//		String SHID=request.getParameter("SHID");
//		RenWutable  listrenwu=new RenWutable();
//		listrenwu.setShenheID(Integer.parseInt(SHID));
//		Integer selerto=renWuServiceImpl.insertReturnId(listrenwu);//查询是否有值
//
//		JSONArray jsonObject = JSONArray.fromObject(100);
//		if(selerto != null){
//			//				JSONObject jsonObject = JSONObject.fromObject(jr);
//			jsonObject = JSONArray.fromObject(selerto);
//
//		}
//		//			JSONObject jsonObject = JSONObject.fromObject(jr);
//		//JSONArray jsonObject = JSONArray.fromObject(jr);
//
//		System.out.println(jsonObject.toString());
//
//		PrintWriter out = response.getWriter();
//		out.write(jsonObject.toString());
//		out.close();
//
//	}


	//领取    修改状态  设置时间
	@ResponseBody
	@RequestMapping(value="/lingqu",produces="application/json")
	public Object  lingqu(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException{
		JsonReturn jr =new  JsonReturn();
		String  id=request.getParameter("id");
		String  rwjl=request.getParameter("rwjl");
    
		String pattern = "\\d+";////需要要判断的数字 （就是正则的：    \d ）; 
		Pattern r = Pattern.compile(pattern);// 将给定的正则表达式编译到具有给定标志的模式中
		Matcher m = r.matcher(rwjl);//类似只匹配Pattern 给的模型；  这里是数字
		StringBuffer sb = new StringBuffer();//创建StringBuffer 
		while(m.find()){ sb.append(m.group());}//m.find() 应是检测m是否存在匹配值   //while循环语句

		HttpSession session=request.getSession();
		Signuptable signuptable=(Signuptable)session.getAttribute("SESSION_USER");//获取用户登录表
		//int signID=signuptable.getSignID();//获取签到ID
		int signupID=signuptable.getSignupId();//获取用户ID
		boolean	signone=false;
		try{
			int intsb=Integer.parseInt(sb.toString());
			//能修改？？？？？？？PJ
			//Signuptable	signone=signupService.findBySQL(PJ);//获取会员ID   这个是查询最后一条数据
				signone=signupService.updaterewu(intsb,signuptable.getSignupId());//修改金额（任务）  
		}catch (Exception e) {	signone=false;}
		
		
		
		
		if(signone){
			jr.setState(true);
			
			//已领取                                                                 
			boolean signtable1=renWuService.updateLQ(Integer.parseInt(id));//修改状态为  已领取
			
			//发送信息       新增信息   
			Newstable tableone=new Newstable();
			String content="完成任务奖励"+rwjl;
			tableone.setSignupId(signupID);
			tableone.setStatus(false);
			tableone.setContent(content);

			boolean sdf=newsService.insert(tableone);//发送消息

		}else{
			jr.setState(false);
		}

		 return JSONSerializer.toJSON(jr);//需要引用架包文件lib里
		
	} 
	
	
	
	    //已审核    修改状态  为3  个人任务  用的         公司任务的是在后台进行审核的
		@ResponseBody
		@RequestMapping(value="/YiShengHe",produces="application/json")
		public Object  YiShengHe(HttpServletRequest request,HttpServletResponse response) 
				throws ServletException, IOException{
			JsonReturn jr =new  JsonReturn();
			String  id=request.getParameter("id");
			String  rwjl=request.getParameter("rwjl");
			
			String pattern = "\\d+";////需要要判断的数字 （就是正则的：    \d ）; 
			Pattern r = Pattern.compile(pattern);// 将给定的正则表达式编译到具有给定标志的模式中
			Matcher m = r.matcher(rwjl);//类似只匹配Pattern 给的模型；  这里是数字
			StringBuffer sb = new StringBuffer();//创建StringBuffer 
			while(m.find()){ sb.append(m.group());}//m.find() 应是检测m是否存在匹配值   //while循环语句
	    
			//等下  可能要修改状态 session		
            HttpSession session=request.getSession();
			Signuptable signuptable=(Signuptable)session.getAttribute("SESSION_USER");//获取用户登录表
			//int signID=signuptable.getSignID();//获取签到ID
			int signupID=signuptable.getSignupId();//获取用户ID
			boolean	signone=false;
			try{
				int intsb=Integer.parseInt(sb.toString());
					signone=signupService.updaterewu(intsb,signuptable.getSignupId());//修改金额（任务）  
			}catch (Exception e) {signone=false;}

			

			if(signone){
				jr.setState(true);
				//修改用户金额  （奖励）  用正则获取数字    signuptable.getSignUpId()  和   要加的金额
				//String PJ=signuptable.getSignupId().toString()+"A"+sb;
				//Signuptable	signone=signupService.findBySQL(PJ);//获取会员ID
				
				//任务记录里不以任务ID为条件了                                                                                               
				boolean signtable1=renWuService.updateYSH(1,signuptable.getSignupId());//修改状态为 已审核
			
				//发送信息       新增信息   
				Newstable tableone=new Newstable();
				String content="完成任务奖励"+rwjl;
				tableone.setSignupId(signupID);
				tableone.setStatus(false);
				tableone.setContent(content);

				boolean sdf=newsService.insert(tableone);//发送消息

			}else{
				jr.setState(false);
			}

			 return JSONSerializer.toJSON(jr);//需要引用架包文件lib里
			

		} 


		//统计图跳转（测试的）
		@RequestMapping("/tongjt")
		public String tongjt(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			return "/ceshi/tongjitu";
		}

		
		//神箭云市场  返回热点新闻（或天气获取到对应的字符串再进行改动）      内容没连接（可以用百度进行查询）
		@RequestMapping("/hotspotAPI")
		public void hotspotAPI(HttpServletRequest request, HttpServletResponse response) 
		     throws ServletException, IOException {
		    String appid="be3fa225c1afcec8b1adee70d981a151";
		    String httpUrl = "https://api.shenjian.io/";
		    String httpArg = "appid="+appid;
		    String jsonResult = Request.request(httpUrl, httpArg);
		    //String xxxd="https://api.shenjian.io/?appid=6cddaa7e090249d28520128b6b8f9a18&mid=228514";
				
		    request.setCharacterEncoding("utf-8");
		    JSONObject jsonObject = JSONObject.fromObject(jsonResult);
		    PrintWriter out = response.getWriter();
		    out.write(jsonObject.toString());
		    out.close();
		}

		


}
