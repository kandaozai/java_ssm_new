package com.zgx.web;

import java.io.IOException;
import java.lang.reflect.Array;
import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.druid.sql.visitor.functions.Now;
import com.zgx.po.Enrollmenttable;
import com.zgx.po.Signtable;
import com.zgx.po.Signuptable;
import com.zgx.po.Stotetable;
import com.zgx.service.ICompanyService;
import com.zgx.service.IEnrollmentService;
import com.zgx.service.ISignupService;
import com.zgx.service.IStoreService;
import com.zgx.service.IsignService;
import com.zgx.vo.JsonReturn;
import com.zgx.vo.publicArry;

/**
 * 
 * 我的资料   基本信息
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/personalWeb")
public class PersonalController {

	@Autowired
	private ICompanyService companyService;//公司

	@Autowired
	private IEnrollmentService enrollmentService;// 投资登记表

	@Autowired
	private ISignupService signupService;//用户（登录）

	@Autowired
    private IStoreService  wdhfJlService;//积分记录WdhfJlServiceImpl
	
	@Autowired
	private IsignService  signservice;//签到
	
	
//	//两个人登录时的限制
//	public String xianzhe(HttpServletRequest req)
//			throws ServletException, IOException {
//		HttpSession session = req.getSession();
//		String PD="";
//		Signuptable tabel = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
//
//		try{
//			
//			 Signuptable  chongxie=signupService.findByIdparmint(tabel.getSignupId());
//			 if(chongxie.getEdition() == tabel.getEdition()){}else{ PD="1";}
//			
//		}catch (Exception e) {
//			PD="";
//		}
//		return PD;
//		
//	}
//	if(xianzhe(req).equals("1")){
//		req.getSession().removeAttribute("SESSION_USER");
//		req.setAttribute("CDX", "1");
//		return  "/MainIndex";//首页
//	}
	
	
	
	
    //我的基本资料基本信息jsp
    @RequestMapping("/wdzl")
	public String wdzl(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		HttpSession session = req.getSession();
		Signuptable tabel = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
		String str11 ="";
		String str22 ="";
		try{str11 = tabel.getLiving().replace("A","---");//将Living中所有的A替换为空格
		}catch (Exception e) {str11 ="";}
		
		try{str22 = tabel.getHomeaddress().replace("A"," ---");//将Living中所有的A替换为空格
		}catch (Exception e) {str22="";}
		
		
		req.setAttribute("Livingreq", str11);
		req.setAttribute("Homeaddressreq", str22);
		
		
		//数据刷新的需要
	 	Signuptable  chongxie=signupService.findByIdparmint(tabel.getSignupId());
	 	session.setAttribute("SESSION_USER", chongxie);
	 	
		
		
		if(tabel != null){
			Signtable signtable2=signservice.findByIdQDparmint(tabel.getSignid());//初步  签到查询
			Date date=new Date();
			SimpleDateFormat dateFormat=new  SimpleDateFormat("yyyy-MM-dd");
			String str=dateFormat.format(date);//当前时间
			String str1=dateFormat.format(signtable2.getSigntime());//查询出的时间   oooo
			
			if(str1.equals(str)){//已签到
		     req.setAttribute("qiandao", 1);
			}
			
			//投资平台数量              获取conpanytable的总行数,把总行数绑定到JSP投资平台数量中
			Integer conpanytable = companyService.getTotalRow(" 1=1 ");//count 改为 1+1
			req.setAttribute("conpanytable", conpanytable);

			//总资产                        投资平台总额   +  返利累计收益  ？？？？  写下面的
			String total = enrollmentService.findByTotal();
			if(total == null){total = "0" ;}
			req.setAttribute("total", total);
			
		
			//(自身的)投资总额   
			String lump = enrollmentService.findByLump(tabel.getSignupId());
			if(lump == null){
				lump = "0" ;
			}
			req.setAttribute("lump", lump);

			//返利累计收益                 没有单个乘  统一乘以 4.5%
			String sum = enrollmentService.findBySum(tabel.getSignupId());
			if(sum == null){
				sum = "0" ;
			}
			req.setAttribute("sum", sum);
				
			//用户注册信息
			req.setAttribute("signuptable", chongxie);

			try{
				req.setAttribute("SignUpIdCS", tabel.getSignupId());
				req.setAttribute("SignUpNameCS", tabel.getSignupname());
				req.setAttribute("HeadportraitCS", tabel.getHeadportrait());
				
				req.setAttribute("PhonenumberCS", tabel.getPhonenumber());//手机号码
				req.setAttribute("IdnumberCS", tabel.getIdnumber());//身份证
				req.setAttribute("BankcardCS", tabel.getBankcard());//银行卡
				req.setAttribute("MailboxCS", tabel.getMailbox());//邮箱
				req.setAttribute("RebateFreezeCS", tabel.getRebatefreeze());// 返利冻结
				req.setAttribute("TXFreezeCS", tabel.getTxfreeze());// 提现冻结
				req.setAttribute("SumCS", tabel.getSum());//可用金额
				
				 Stotetable wdjfjlb = wdhfJlService.findById(tabel.getSignid());
	    		 req.setAttribute("wdjfjlb", wdjfjlb);
				
			}catch (Exception e) {

			}
			
            //总资产   这个
			int intlump=0;
			try{
			 intlump=Integer.parseInt(lump);// (自身的)投资总额   
			}catch (Exception e) {
				intlump=0;
			}
			
			int  intSum=tabel.getSum();//可用金额
			int  intRebatefreeze=tabel.getRebatefreeze();//冻结金额
			int  intTxfreeze=tabel.getTxfreeze();//现提金额
			req.setAttribute("zong", intlump+intSum+intRebatefreeze+intTxfreeze);
		
			// 跳转到我的账户
            return "/Personal";
		}else{
			return "redirect:/mainsy/MainIndex.do";//重定向首页
		}

	}

    @RequestMapping("/PerInvestment")
    public String PerInvestment(HttpServletRequest req, HttpServletResponse resp)
    		throws ServletException, IOException {

    	return "/PerInvestment";
    }

    //统计图跳转
    @RequestMapping("/statisticaljt")
    public String statisticaljt(HttpServletRequest request, HttpServletResponse response)
    		throws ServletException, IOException {
    	HttpSession session = request.getSession();
    	Signuptable tabel = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
    	
    	try{
    		request.setAttribute("SignUpIdCS", tabel.getSignupId());
    		request.setAttribute("SignUpNameCS", tabel.getSignupname());
    		request.setAttribute("HeadportraitCS", tabel.getHeadportrait());
		
		}catch (Exception e) {

		}
    	SimpleDateFormat sy=new SimpleDateFormat("yyyy");
    	String yesenan=sy.format(new Date());//2019
    	
    	request.setAttribute("yesenna", yesenan);
    	
    	return "/StatisticalChart";
    }
    
    
    /** 
     * Sting转java.sql.Date
     * @param 返回java.sql.Date格式的 
     * */  
    public static java.sql.Date strToDate(String strDate) {  
        String str = strDate;  
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        java.util.Date d = null;  
        try {  
            d = format.parse(str);  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        java.sql.Date date = new java.sql.Date(d.getTime());  
        return date;  
    } 
    
    //1至12个月的统计投资账单 
    @ResponseBody
    @RequestMapping("/tzzd")
    public Object tzzd(HttpServletRequest req, HttpServletResponse resp){
    	HttpSession session = req.getSession();
    	Signuptable tabel = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
    	
    	
    	//获取当前年的每个月（设置起始年）投资金额 和收益金额总和
    	publicArry jr =new  publicArry();//定一个2个数组的vo 发送过去
    
    	
    	SimpleDateFormat sy=new SimpleDateFormat("yyyy");
    	String yesenan=sy.format(new Date());//2019
    	
    	BigDecimal[] intarger=new BigDecimal[12];//投资金额数组
    	BigDecimal[] intargertow=new BigDecimal[12];//收益金额数组
    	
    	
    	
    	BigDecimal caxun=new BigDecimal("0");
    	BigDecimal caxuntow=new BigDecimal("0");
	    for(int i=1;i<13;i++){
	    	String pingjie="-0"+i+"-01";
	    	 java.sql.Date shijian=strToDate(yesenan+pingjie);//"2019-01-01"
	    	 try{
	    		 caxun=enrollmentService.findByIdAndTime(shijian,tabel.getSignupId());//（2019-01-01(sql时间)、2）
	    		 caxuntow=enrollmentService.findByIdAndTimeSY(shijian,tabel.getSignupId());//审核成功的就算入
	    	 
	    	 }catch (Exception e) {
	    		 caxun=new BigDecimal("0");
	    		 caxuntow=new BigDecimal("0");
	    	 }
	    	 if(caxun==null){
	    		 caxun=new BigDecimal("0");
	    	 }
	    	 if(caxuntow==null){
	    		 caxuntow=new BigDecimal("0");
	    	 }
	    	 
	    	 intarger[i-1]=caxun;
	    	 intargertow[i-1]=caxuntow;
	    	
	    }
	   
    	
	    jr.setArgerint(intargertow);
	    jr.setArgerinttwo(intarger);
    	
    	return JSONSerializer.toJSON(jr);//需要引用架包文件lib里
    	
    }


}
