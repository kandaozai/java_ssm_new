package com.zgx.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zgx.po.Conpanytable;
import com.zgx.po.Newstable;
import com.zgx.po.Signtable;
import com.zgx.po.Signuptable;
import com.zgx.po.Stotetable;
import com.zgx.po.weather;
import com.zgx.service.ICompanyService;
import com.zgx.service.ISignupService;
import com.zgx.service.IStoreService;
import com.zgx.service.InewsService;
import com.zgx.service.IsignService;
import com.zgx.vo.Bsgrid;
import com.zgx.vo.JsonReturn;

/**
 * 
 * 登录和签到    //天气抓取
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/loginweb")
public class LoginController {
	
	@Autowired
	private ISignupService signupService;//用户（登录）
	
	@Autowired
	private IsignService  signservice;//签到
	
	@Autowired
	private InewsService  newsService;// 消息
	
	@Autowired
	private IStoreService  wdhfJlService;//积分记录

//	@Autowired
//	private ICompanyService companyService;//公司

	//跳转登陆界面
	@RequestMapping("/login")
	public String login(HttpServletRequest req, HttpServletResponse resp)
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
       // int sdd=10/0;
		
       return "/Login";
	}

	//签到页面
	@RequestMapping("/signin")
	public String signin(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session=req.getSession();
		Signuptable signuptable=(Signuptable)session.getAttribute("SESSION_USER");//获取用户登录表

		req.setAttribute("signuptable", signuptable);//写入请求

		int signID=signuptable.getSignid();//获取签到ID
		try {// 签到ID
			Signtable signtabCX = signservice.findByIdQDparmint(signID);// 签到查询表
			req.setAttribute("signtabCX", signtabCX);//
			req.setAttribute("SignUpIdCS", signuptable.getSignupId());
			req.setAttribute("SignUpNameCS", signuptable.getSignupname());
		} catch (Exception e) {

		}

		Signtable signtable2=signservice.findByIdQDparmint(signID);//初步  签到查询


		Calendar a = Calendar.getInstance();  
		a.set(Calendar.DATE, 1);//把日期设置为当月第一天  
		a.roll(Calendar.DATE, -1);//日期回滚一天，也就是最后一天  
		int maxDate = a.get(Calendar.DATE);  
		req.setAttribute("intmaxDate", maxDate);//写入请求

		Date date=new Date();
		SimpleDateFormat dateFormat=new  SimpleDateFormat("yyyy-MM-dd");
		String str=dateFormat.format(date);//当前时间
		String str1=dateFormat.format(signtable2.getSigntime());//查询出的时间   oooo
		Boolean ASAS=false;

		//判断初始月 清数据(内部)
		SimpleDateFormat dateFormatmo=new  SimpleDateFormat("yyyy-MM");
		String mstr=dateFormatmo.format(date);//当前时间
		String mstr1=dateFormatmo.format(signtable2.getResettime());//查询出的初始 时间
		if(mstr.equals(mstr1)){
			//不清除

		}else{
			//清除
			Calendar now1 = Calendar.getInstance(); //当前时间  
			String year=String.valueOf(now1.get(Calendar.YEAR));
			String mooth=String.valueOf(now1.get(Calendar.MONTH)+1);
			String day=String.valueOf(now1.get(Calendar.DAY_OF_MONTH));
			//获取当前时间   再修改  签到初始时间  为  当前时间

			String strPJ= year+"-"+mooth+"-"+"01";

			Date stryong=null;
			try {//时间异常
				stryong = dateFormat.parse(strPJ);//字符串转时间类型
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}//当前时间 Date型

			Signtable signtable=new Signtable();
			signtable.setResettime(stryong);//当前拼接的 （年月） 时间
			signtable.setSignid(signID);
			int  bolS=signservice.insertReturnId(signtable);

		}
		
		Signtable signtable1=signservice.findByIdQDparmint(signID);//签到查询（最后查询）
		req.setAttribute("signtable1", signtable1);//签到查询写入请求

		if(str.equals(str1)){
			ASAS=true;
		}
		req.setAttribute("PDQD", ASAS);//写入请求

	
         return "/SignIn";
	}

	//登录保存session
	@ResponseBody   //返回JSON时要加 @ResponseBody  
	@RequestMapping(value="/userLogin",produces="application/json")
	public Object userLogin(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		JsonReturn jsonReturn=new JsonReturn();

         //123  SignUpName 为空  bankcard
		//获取用户名参数 
		String SignUpName=req.getParameter("signupname");
		//获取页面密码参数
		String Password=req.getParameter("password");
		//session获取用户名跳转显示
		HttpSession session=req.getSession();
//		req.getSession().setAttribute("signUpName", SignUpName); 没用到吧
//		req.setAttribute("signUpName", SignUpName);

		try {	
			Signuptable signuptable=signupService.login(SignUpName, Password);
			if (signuptable!=null) {
				
				jsonReturn.setState(true);
				jsonReturn.setMsg("登录成功");
				//版次
				boolean banci=signupService.updateBCH(signuptable.getSignupId());
				 Signuptable  chongxie=signupService.findByIdparmint(signuptable.getSignupId());
				 signuptable=chongxie;
				session.setAttribute("SESSION_USER",signuptable);//把登录的用户保存到session中
			} else {
				jsonReturn.setState(false);
				jsonReturn.setMsg("账户或者密码错误");
			}
		} catch (Exception e) {
			jsonReturn.setState(false);
			jsonReturn.setMsg("数据出错！");
		}
		//resp.setCharacterEncoding("UTF-8");
		//PrintWriter out = resp.getWriter();
		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里
	}

	//签到（按钮）（新增）        
	@ResponseBody
	@RequestMapping(value="/intsign",produces="application/json")
	public Object intsign(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		JsonReturn jr =new  JsonReturn();
		HttpSession session=req.getSession();
		Signuptable signuptable=(Signuptable)session.getAttribute("SESSION_USER");//获取用户登录表
		int signID=signuptable.getSignid();//获取签到ID
		int signupID=signuptable.getSignupId();//获取用户ID

		Signtable signtable1=signservice.findByIdQDparmint(signID);//签到查询
		Date date=new Date();
		SimpleDateFormat dateFormat=new  SimpleDateFormat("yyyy-MM-dd");
		String str=dateFormat.format(date);//当前时间 string型

		Date stryong=null;
		try {//时间异常
			stryong = dateFormat.parse(str);
		} catch (ParseException e) {
			e.printStackTrace();
		}//当前时间 Date型
		String str1=dateFormat.format(signtable1.getSigntime());//查询出的时间   oooo

		if(str.equals(str1)){
			jr.setState(true);
		}else{
			Signtable signtable=new Signtable();
			signtable.setSigntime(stryong);//当前时间
			signtable.setSignid(signID);
			boolean  bolS=signservice.update(signtable);//修改签到日时间
			jr.setState(bolS);
			//需要新增积分记录表
			Stotetable stoteJFJL=new Stotetable();
			stoteJFJL.setSignupId(signupID);
			stoteJFJL.setGetintegral(1);
			stoteJFJL.setIntegralexplain("签到");
			boolean wdjfjlb = wdhfJlService.insert(stoteJFJL);
			if(wdjfjlb){
				
				boolean axx=wdjfjlb;
			}
			

		}
		//当签到成功后获取签到天数 
		Signtable signtable22=signservice.findByIdQDparmint(signID);//签到查询  第二次
		if(signtable22.getSigndate() == 1 || signtable22.getSigndate() % 5 == 0 ){
			//修改用户金额+2  （红包）     
			boolean	signone=signupService.updatetow(signuptable.getSignupId());//获取会员ID
			

			//发送信息       新增信息   
			Newstable tableone=new Newstable();
			String content="收到签到的一个两元现金红包！";
			tableone.setSignupId(signupID);
			tableone.setStatus(false);
			tableone.setContent(content);
			try {
				tableone.setSendingtime(dateFormat.parse(str));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			boolean   sdf=newsService.insert(tableone);
		}//发送信息 

		return JSONSerializer.toJSON(jr);//需要引用架包文件lib里

	}
	
	
	//天气抓取
	@ResponseBody   //返回JSON时要加 @ResponseBody  
	@RequestMapping(value="/Array_A",produces="application/json;charset=UTF-8")
	public Object Array_A(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		//JsonReturn jsonReturn=new JsonReturn();
		Bsgrid<weather> bsgrid=new Bsgrid<weather>();
		
		weather weather_s=new weather();
		
		//目标页面  
		 String url = "http://www.weather.com.cn/weather/101230101.shtml"; 
		    //使用Jsoup连接目标页面,并执行请求,获取服务器响应内容  
		    String html = Jsoup.connect(url).execute().body(); 
		    //System.out.println(html);//整个界面
			String rgex="<li class=\"sky skyid lv3 on\">(.*?)</li>";//获取对应当前日  信息
			//List<String> lists = getSubUtil(html,rgex);//进行正则 抓取数据返回list数组
		    StringBuffer lists = getSubUtil_string(html,rgex);//(当日)进行正则 抓取数据返回StringBuffer字符串
		    String zaistr=lists.toString();//参数问题
		    //System.out.println(zaistr);
		    //二次正则  天气状况
		    String rgexa_tq="class=\"wea\">(.*?)</p>";
		    StringBuffer lists_tq = getSubUtil_string(zaistr,rgexa_tq);//进行正则
		    
		    //二次正则  温度
		    String rgexa_wd="tem\"><i>(.*?)</i>";
		    StringBuffer lists_wd = getSubUtil_string(zaistr,rgexa_wd);//进行正则
		    String	strstr=lists_wd.toString();
		    if(strstr.length() <= 0 ){//执行第二种情况  温度正则
//		    	 //二次正则  温度
		        String rgexa_wd_2="<span>(.*?)</i>";
		         lists_wd = getSubUtil_string(zaistr,rgexa_wd_2);//进行正则
		         String strstrstr=lists_wd.toString();
			     String regex = "</span>/<i>";//
			     strstr=strstrstr.replaceAll(regex,"/");
		    }else{
		    }
		    
		    System.out.println("天气状况:"+ lists_tq);
		    System.out.println("温度:"+ strstr);
		    weather_s.setStatus(lists_tq.toString());
		    weather_s.setTemperature(strstr);
		    
		    bsgrid.setData_lst(weather_s);
		   
		    return JSONSerializer.toJSON(bsgrid).toString();//需要引用架包文件lib里
			
	}
	
	
	 /** 
	  * 
	  * Matcher的常用方法有：
	  * find()：尝试查找与该模式匹配的输入序列的的下一个子序列。
     * find(int start)：重置此匹配器，然后尝试查找匹配该模式、从指定索引开始的输入序列的下一个子序列。
     * group()：匹配成功返回的组
     * start()：返回先前匹配的起始位置的索引。
     * end()：返回最后匹配字符的索引加一。
     * matches()：尝试将整个区域与模式匹配。匹配成功返回true
     * lookingAt()：尝试将从区域开头开始的输入序列与该模式匹配。
     * replaceFirst()：替换掉匹配的第一个子序列
     * replaceAll()：替换掉匹配的全部子序列
     * appendReplacement：重要，下面重点说
     * appendTail(StringBuffer buf)：重要，下面重点说
	  * 
	  * 正则表达式匹配两个指定字符串中间的内容   返回： List<String>
	  * @param soap 
	  * @return 
	  */  
	    public static List<String> getSubUtil(String soap,String rgex){  
	        List<String> list = new ArrayList<String>();  
	        
	        //Pattern pattern = Pattern.compile(rgex);//  编译正则表达式    当遇到  换行符  就匹配不出了
	        Pattern pattern = Pattern.compile(rgex, Pattern.CASE_INSENSITIVE | Pattern.DOTALL);//  编译正则表达式
	      
	        Matcher m = pattern.matcher(soap);//通过  matcher 进行匹配
	        while (m.find()) {  
	            int i = 1;  
	            list.add(m.group(i));  
	            i++;  
	        }  
	        return list;  
	    } 
	    
	    
	    //正则表达式匹配两个指定字符串中间的内容   返回： StringBuffer
	    public static StringBuffer getSubUtil_string(String soap,String rgex){  
	       
	        StringBuffer bustring=new StringBuffer();
	        Pattern pattern = Pattern.compile(rgex, Pattern.CASE_INSENSITIVE | Pattern.DOTALL);//  编译正则表达式
	      
	        Matcher m = pattern.matcher(soap);//通过  matcher 进行匹配
	        while (m.find()) {  
	            int i = 1;  
	            bustring.append(m.group(i));
	            i++;  
	        }  
	        return bustring;  
	    } 
	 
		
}
