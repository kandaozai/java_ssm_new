package com.zgx.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Before;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import com.zgx.util.MD5Util;
import com.zgx.po.Conpanytable;

import com.zgx.po.Newstable;
import com.zgx.po.Signtable;
import com.zgx.po.Signuptable;
import com.zgx.po.Stotetable;

import com.zgx.service.ICompanyService;
import com.zgx.service.IRenWuService;
import com.zgx.service.ISignupService;
import com.zgx.service.IStoreService;
import com.zgx.service.InewsService;
import com.zgx.service.IsignService;
import com.zgx.util.Tools;
import com.zgx.vo.JsonReturn;

/**
 * 
 * 首页
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/mainsy")
public class MainController {
	
	
	@Autowired
	private ISignupService signupService;//用户（登录）
	
	@Autowired
	private ICompanyService companyService;//公司
	
	@Autowired
	private IsignService  signservice;//签到
	
	@Autowired
	private InewsService  newsService;// 消息
	 
	@Autowired
	private IStoreService  wdhfJlService;//积分记录
	
	@Autowired
	private  IRenWuService renWuService;//任务
	
	//aop测试调用方法
	 public void play(int index) {
	        System.out.println(" is one");
	 }

	
	//首页面
	@RequestMapping("/MainIndex")
	public String MainIndex(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		Signuptable signuptable=(Signuptable)session.getAttribute("SESSION_USER");//获取用户登录表
		req.setAttribute("signuptable", signuptable);//写入请求//List<Conpanytable> conpanytable1= null;
	
		
		try{
			req.setAttribute("SignUpIdCS", signuptable.getSignupId());
			req.setAttribute("SignUpNameCS", signuptable.getSignupname());
			req.setAttribute("HeadportraitCS", signuptable.getHeadportrait());
		}catch (Exception e) {

		}
		//RenWutable typebean=new RenWutable();
		//修改过期任务  为无效（0）                            1为有效       2为特殊
	//需要	//boolean booleaone = renWuServiceImpl.deleteAll();

		//大额
		List<Conpanytable> conpanytable1=companyService.findBySQLoneo();
		req.setAttribute("conpanytable1",conpanytable1);

		//小额
		List<Conpanytable> conpanytable2=companyService.findBySQLtwoo();
		req.setAttribute("conpanytable2",conpanytable2);

		//定额
		List<Conpanytable> conpanytable3=companyService.findBySQLthreeo();
		req.setAttribute("conpanytable3",conpanytable3);

        return "/MainIndex";//  之前的/jsp/MainIndex.jsp
	}


	// 读取图片 用户
	@RequestMapping("/getUserPicture")
	public void getUserPicture(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String strFileName = request.getParameter("file");// 获取请求file
		// 构建上传目录的路径
		//String uploadPath = "E:\\upload";
		String uploadPath = "E:\\upload\\UserO";

		if (Tools.isNotNull(strFileName)) {// 如果strFileName不为空
			File file = new File(uploadPath + File.separator + strFileName);
			if (file.exists() && file.isFile()) {// 判断是否存在 是否是文件
				FileInputStream in = new FileInputStream(file);// 读取（文件）IO流
				ServletOutputStream out = response.getOutputStream();// 类似保存流

				byte[] buf = new byte[1024];
				int count = 0;
				while (-1 != (count = in.read(buf, 0, buf.length))) {
					out.write(buf, 0, count);
				}
				response.setContentType("image/png"); // 设置返回的文件类型
				out.flush();
				out.close();
				in.close();

			}
		}
	}	

	// 读取图片 公司信息
	@RequestMapping("/getUserPicturecon")
	public void getUserPicturecon(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String strFileName = request.getParameter("file");// 获取请求file
		// 构建上传目录的路径
		//String uploadPath = "E:\\upload";
		String uploadPath = "E:\\upload\\Company";

		if (Tools.isNotNull(strFileName)) {// 如果strFileName不为空
			File file = new File(uploadPath + File.separator + strFileName);
			if (file.exists() && file.isFile()) {// 判断是否存在 是否是文件
				FileInputStream in = new FileInputStream(file);// 读取（文件）IO流
				ServletOutputStream out = response.getOutputStream();// 类似保存流

				byte[] buf = new byte[1024];
				int count = 0;
				while (-1 != (count = in.read(buf, 0, buf.length))) {
					out.write(buf, 0, count);
				}
				response.setContentType("image/png"); // 设置返回的文件类型
				out.flush();
				out.close();
				in.close();

			}
		}
	}	

	//清空（删除  不是摧毁）
	@ResponseBody
	@RequestMapping(value="/SCsessiom",produces="application/json")
	public Object SCsessiom(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		JsonReturn jsonReturn=new JsonReturn();
		jsonReturn.setState(false);

		// HttpSession session=request.getSession();
		//写ZFStore.jsp   退出
		try{
			//清空 session对应的SESSION_USER保存值    注意：还是原来的sessionID（即每个session创建都有个标识）  
			request.getSession().removeAttribute("SESSION_USER");
			jsonReturn.setState(true);
		}catch (Exception e) {
			jsonReturn.setState(false);
		}

		 return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}	
	
	///////////////////////////          注册                         ///////////////////////////////
	@RequestMapping("/Register")
	public String Register(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	       return "/Register";
	}

	
	@ResponseBody   //返回JSON时要加
	@RequestMapping(value="/doInsert",produces="application/json")
	public Object doInsert(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		JsonReturn jr =new  JsonReturn();
		
		
		String SignUpName=req.getParameter("signupname");//用户名
		String Password=req.getParameter("password");//用户密码
		String PhoneNumber=req.getParameter("phonenumber");//手机号
		String Digital=req.getParameter("digital");//数字ID
		String Mailbox=req.getParameter("mailbox");//邮箱
	
		
		String PhoneCode=req.getParameter("phonecode");//手机验证码
		// Tools.isNotNull(PhoneCode)  单独写  可直接返回值
		
		
		if (Tools.isNotNull(SignUpName) && Tools.isNotNull(Password) 
				&& Tools.isNotNull(PhoneNumber)  && Tools.isNotNull(Digital)
				&& Tools.isNotNull(Mailbox)) {
			Signuptable snup=new Signuptable();
			
			snup.setSignupname(SignUpName);
			snup.setPassword(MD5Util.getMD5(Password));
			snup.setPhonenumber(PhoneNumber);
			//snup.setPhoneCode(PhoneCode);//为什么要保存验证码
			snup.setDigital(Digital);
			snup.setMailbox(Mailbox);
			int sinid=0;//新增条数（成功值）
	 		int  hqsinid=0;//新增返回ID
	 		boolean bolS=false;
	 		//当bolS等于true  创建签到表
	 		try{
	 			SimpleDateFormat dateFormat=new  SimpleDateFormat("yyyy-MM-dd");
	 			Calendar now1 = Calendar.getInstance(); //当前时间  
	 			String year=String.valueOf(now1.get(Calendar.YEAR));
	 			String mooth=String.valueOf(now1.get(Calendar.MONTH)+1);
	 			String day=String.valueOf(now1.get(Calendar.DAY_OF_MONTH));
	 			//获取当前时间   再修改  签到初始时间  为  当前时间
	 			String strPJ= year+"-"+mooth+"-"+"01";
	 			String str= "2000"+"-"+mooth+"-"+"01";
	 			Date stryong=null;
	 			Date strnow=null;
	 			try {//时间异常
	 				stryong = dateFormat.parse(strPJ);//转为当前年月 日为1 的时间
	 				strnow = dateFormat.parse(str);//转为当前日期
	 			} catch (ParseException e) {
	 				e.printStackTrace();
	 			}//当前时间 Date型
	 			Signtable signtable = new Signtable();// 由于要新增Users
	 			signtable.setResettime(stryong);//当前拼接的 （年月） 时间
	 			signtable.setSigntime(strnow);//当前时间减一天
	 			signtable.setSignintegral(0);//签到天数积分
	 			signtable.setSigndate(0);//签到天数
	 			signtable.setIntegral(20);//签到外积分
	 			sinid=signservice.insertint(signtable);//先新增 判断用户表 新增失败再删除
                hqsinid=signtable.getSignid();//新增的ID 
                
	 		}catch (Exception e) {
	 			sinid=0;
			}
			
	 		if(sinid != 0){
	 			snup.setSignid(hqsinid);//积分表ID
		 	    bolS = signupService.insert(snup);//创建用户表
	 		}
	 		
	 		if(bolS==false && hqsinid != 0){
	 			boolean trunss=signservice.deleteById(hqsinid);//当新增用户失败  删除应改对应的签到ID
	 		}
			
	 		//如果bolS为true  消息提示    消息不提示积分  
	 		if(bolS){
	 			Date date=new Date();
	 			SimpleDateFormat dateFormat=new  SimpleDateFormat("yyyy-MM-dd");
	 			String str=dateFormat.format(date);//当前时间 string型
	 			Signuptable zhtow=signupService.findBySQL();//查询用户表最后一条（第二次）

	 			Newstable tableone=new Newstable();
	 			String content="创建账户+4元";
	 			tableone.setSignupId(zhtow.getSignupId());//用户ID  这个写法不好  多线程就出乱了
	 			tableone.setStatus(false);
	 			tableone.setContent(content);
	 			//新增个人任务（基础信息任务）
	 			//boolean  interenwuSFZ=renWuService.insertGRRW_SH(1,hqsinid);
	 			boolean  interenwuSFZ2=renWuService.insertGRRW_SH(5,hqsinid);
	 			
	 			boolean  interenwuSJH=renWuService.insertGRRW_WSH(2,hqsinid);
	 			boolean  interenwuSJH2=renWuService.insertGRRW_WSH(1,hqsinid);
	 			
	 			try {
	 				tableone.setSendingtime(dateFormat.parse(str));
	 			} catch (ParseException e) {
	 				e.printStackTrace();
	 			}
	 			boolean sdf=newsService.insert(tableone);

	 			//积分记录表
	 			Stotetable stoteJFJL=new Stotetable();
	 			stoteJFJL.setSignupId(zhtow.getSignupId());
	 			stoteJFJL.setGetintegral(20);
	 			stoteJFJL.setIntegralexplain("新建用户");
	 			boolean wdjfjlb = wdhfJlService.insert(stoteJFJL);

	 		}
			
			if (bolS) {
				jr.setMsg("注册成功");
				jr.setState(true);
			} else {
				jr.setMsg("注册失败");
			}
		} else {
			jr.setMsg("请填写完整");
		}	
		
		return JSONSerializer.toJSON(jr);
	}
	
	
	
	
	// 判断注册 管理员输入框名字是否存在
    @ResponseBody   //返回JSON时要加 @ResponseBody   method = RequestMethod.POST
    @RequestMapping("/PDGLYMC")
	public Object PDGLYMC(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);

		String strJSId = request.getParameter("ZHI");

		if (Tools.isNotNull(strJSId)) {

			List<Signuptable> usersA = signupService.findAll();// 全部查询？？？
			// 循环判断setAdministratorName
			List<String> listid = new ArrayList<String>();

			for (Signuptable goods : usersA) {
				String spid = goods.getSignupname();
				listid.add(spid);
			}

			if (listid != null) {
				// String firstspid = listid.get(0);
				for (String spid : listid) {
					if (spid.equals(strJSId)) {
						jsonReturn.setState(true);
					}
				}

			}

		}
		
		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}


}
