package com.zgx.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zgx.po.Signtable;
import com.zgx.po.Signuptable;
import com.zgx.po.Stotetable;
import com.zgx.service.IStoreService;
import com.zgx.service.IsignService;

import com.zgx.util.Tools;
import com.zgx.vo.JsonReturn;

/**
 * 
 * 积分商城
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/zFStore")
public class ZFStoreController {
	
	
	@Autowired
	private IStoreService xlkService;// 类型//商品  XlkServiceImpl
	
	@Autowired
	private IsignService  signservice;//签到
	
	@Autowired
	private IStoreService  wdhfJlService;//积分记录



	//积分商城
	@RequestMapping("/JFmain")
	public String JFmain(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
		req.setAttribute("SESSION_USERone", SU);

		try {// 签到ID
			Signtable signtabCX = signservice.findByIdQDparmint(SU.getSignid());// 签到查询表findByIdQD
			req.setAttribute("signtabCX", signtabCX);//
			req.setAttribute("SignUpIdCS", SU.getSignupId());	
			req.setAttribute("SignUpNameCS", SU.getSignupname());
			req.setAttribute("HeadportraitCS", SU.getHeadportrait());
		} catch (Exception e) {

		}

		List<Stotetable> Xallone = xlkService.findAll();// 类型
		req.setAttribute("Xallone", Xallone);		

		// 类型一
		List<Stotetable> category1 = xlkService.findBySQLonePA(1);
		req.setAttribute("category1", category1);
		// 类型二	
		List<Stotetable> category2 = xlkService.findBySQLonePA(2);
		req.setAttribute("category2", category2);
		// 类型三
		List<Stotetable> category3 = xlkService.findBySQLonePA(3);
		req.setAttribute("category3", category3);

		// 热门 查询四条
		List<Stotetable> allo = xlkService.findBySQLonePA(4);
		req.setAttribute("allo", allo);

		// 随机8条 数据
		List<Stotetable> sja = xlkService.findBySQLonePA(5);
		req.setAttribute("sja", sja);

		return "/ZFStore";

	}

	//数据的回填 
	@ResponseBody
	@RequestMapping(value="/PDYH",produces="application/json")
	public Object PDYH(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		JsonReturn jsonReturn = new JsonReturn();
		jsonReturn.setState(false);

		String hqzhi = request.getParameter("zhi");
		Boolean pd = false;
		HttpSession session = request.getSession();
		Signuptable YH = (Signuptable) session.getAttribute("SESSION_USER");
		if (hqzhi.equals(YH.getSignupname())) {
			jsonReturn.setState(true);
		}
		// JSONArray j = JSONArray.fromObject(pd);//数组或字符串[1,2,3] 
		//JSONObject jsonObject = JSONObject.fromObject(jsonReturn);//java对象,用｛｝包裹起来 
		
		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里
	}

	//跳转页面 根据类型查询
	@RequestMapping("/chaxunzhi")
	protected String chaxunzhi(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session = req.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据 
		req.setAttribute("SESSION_USER", SU);

		try {// 签到ID           当SU为 空 时
			Signtable signtabCX = signservice.findByIdQDparmint(SU.getSignid());// 签到查询表
			req.setAttribute("signtabCX", signtabCX);//
			req.setAttribute("SignUpIdCS", SU.getSignupId());
			req.setAttribute("SignUpNameCS", SU.getSignupname());//名字
			req.setAttribute("LivingCS", SU.getLiving());//现在地址 //可以考虑获取当前定位地址
			req.setAttribute("PhoneNumberCS", SU.getPhonenumber());//电话

		} catch (Exception e) {

		}

		List<Stotetable> Xallone = xlkService.findAll();// 类型
		req.setAttribute("Xallone", Xallone);

		// 类型一
		List<Stotetable> category1 = xlkService.findBySQLonePA(1);
		req.setAttribute("category1", category1);
		// 类型二
		List<Stotetable> category2 = xlkService.findBySQLonePA(2);
		req.setAttribute("category2", category2);
		// 类型三
		List<Stotetable> category3 = xlkService.findBySQLonePA(3);
		req.setAttribute("category3", category3);

		String zhi = req.getParameter("zhi");
		// mC类型
		List<Stotetable> LXCX = xlkService.findAllstr(zhi);//findAll
		req.setAttribute("LXCX", LXCX);

        return "/ZFStoreone";
	}

	//商品积分兑换 （兑奖品之前有积分限制）    包含修改积分
	@ResponseBody
	@RequestMapping(value="/doInsert",produces="application/json")
	public Object doInsert(Stotetable DHstotelog,HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据 signID

		JsonReturn jsonReturn = new JsonReturn();// 提示映射表
		jsonReturn.setState(false);// 设jsonReturn中的state状态为false
		
		int spjf = 0;
		int qdjf = 0;
		int wjf = 0;
		int qdID = 0;
		int huiyuanID=0;

		Stotetable userType = new Stotetable();// 由于要新增Users

		userType.setIntegralstoreid(DHstotelog.getIntegralstoreid());//integralStoreIDone
		userType.setSignupId(DHstotelog.getSignupId());//signUp_id
		huiyuanID=DHstotelog.getSignupId();

		userType.setConsigneename(DHstotelog.getConsigneename());//consigneeName
		userType.setReceivingaddress(DHstotelog.getReceivingaddress());//receivingAddress
		userType.setTelephone(DHstotelog.getTelephone());//telephone
		userType.setQq(DHstotelog.getQq());//qQ

		String CnameJF=request.getParameter("nameJF");
		String Cqdjifen=request.getParameter("qdjifen");
		String Cwjifen=request.getParameter("wjifen");
		String CqdID=request.getParameter("qdID");
		spjf =0 - (Integer.parseInt(CnameJF));// 商品积分 为什么这样写？//nameJF
		qdjf = Integer.parseInt(Cqdjifen);// 签到积分 //qdjifen
		wjf = Integer.parseInt(Cwjifen);// 非签到积分  //wjifen
		qdID = Integer.parseInt(CqdID);// 兑换商品的ID  //qdID

		//qdjf签到积分        wjf非签到积分      spjf商品兑换积分
		int a = qdjf - (-spjf);//签到积分 - 商品兑换积分
		int b = 0;//b是 a的绝对值
		int c = 0;//非签到积分减去 b
		int d = 0;//商品ID

		//计算数据这样   最好‘直接’获取数据库值进行运算（避免获取之前保存的session的值进行运算）
		int qindaoID=SU.getSignid();//签到ID值（用于查询积分）
		Signtable signtable=signservice.findByIdQDparmint(qindaoID);// 查询值  再返回
		int dhjf=signtable.getSignintegral()+signtable.getIntegral();//总积分
		boolean	 bolS=false;
		if(dhjf >= -spjf){

			if (a <= 0) {// 执行签到积分修改为0 ，且求a的绝对值   把锁放进
				boolean bolqd = xlkService.findByIdQDParam(qdID);// 把签到积分修改为0（他不是查询函数）
                 if(bolqd){d=1;}else{d=0;}
				
				//d = bolqd.getIntegralstoreid();//判断值  0false  1true
				b = Math.abs(a);
			}else{//a > 0     否则修改签到积分  等于a值    一般执行不到这里
				//String pja=a+"A"+qdID;
				boolean bolqd_two = xlkService.findByNameParam(a,qdID);// 把签到积分修改为a

			}

			if (b > 0 && d == 1) {// 执行  非签到积分修改
				c = wjf - b;//非签到积分   减  （签到积分 - 商品兑换积分）绝对值  
				//					String strc = Integer.toString(c);
				//					String strqdID = Integer.toString(qdID);
				boolean bolqdjf = xlkService.findBySQLParam(c,qdID);// 把签到积分修改为0
			}

			bolS = xlkService.insert(userType);// 新增商品兑换记录


		}else{

			bolS=false;
		}

		if (bolS) {
			jsonReturn.setState(bolS);
			jsonReturn.setMsg("兑换商品成功！");

			//需要新增积分记录表
			Stotetable stoteJFJL=new Stotetable();
			stoteJFJL.setSignupId(huiyuanID);
			stoteJFJL.setGetintegral(spjf);
			stoteJFJL.setIntegralexplain("兑换物品");
			boolean wdjfjlb = wdhfJlService.insert(stoteJFJL);


		} else {
			jsonReturn.setMsg("数据出错(积分不够)");
		}

		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}

	//读取图片
	@RequestMapping("/getUserPicture")
	public void getUserPicture(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String strFileName = request.getParameter("file");// 获取请求file
		// 构建上传目录的路径
		String uploadPath = "E:\\upload\\Store";

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


	

}
