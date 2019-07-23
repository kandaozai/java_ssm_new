package com.zgx.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONSerializer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zgx.po.Enrollmenttable;
import com.zgx.po.Signuptable;
import com.zgx.po.Stotetable;
import com.zgx.service.IEnrollmentService;
import com.zgx.util.Tools;
import com.zgx.vo.Bsgrid;
/**
 * 
 * 我的资料  投资管理
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/perInvestmentweb")
public class PerInvestmentController {
	
	@Autowired
	private IEnrollmentService enrollmentService;//投资登记表
	
	
	//跳转投资申报查询页面
	@RequestMapping("/PerInvestCX")
	public String PerInvestCX(HttpServletRequest req, HttpServletResponse resp)
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
		//跳转到投资申报显示信息界面
		return "/Personalsbgl";
	}
	
	
	// 申报查询记录
    @ResponseBody
    @RequestMapping(value="/getlistSB",produces="application/json;charset=UTF-8")
	public String getlistSB(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String strpageSize = req.getParameter("pageSize");
		String strcurPage = req.getParameter("curPage");
		
		String strzt = req.getParameter("strcs");//状态 a0 b1 c2
		int inttt=1;
		
		if(strzt==null){
			inttt=1;
		}else{
			 inttt=Integer.parseInt(strzt);//强转    （传string值时 好像默认多个空格）
			
		}
		

		Bsgrid<Enrollmenttable> bsgrid = new Bsgrid<Enrollmenttable>();
		if (Tools.isNum(strcurPage) && Tools.isNum(strpageSize)) {
			int pageSize = Integer.parseInt(strpageSize);
			int curPage = Integer.parseInt(strcurPage);

			int startIndex = (curPage - 1) * pageSize;

			HttpSession session = req.getSession();
			Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
			String usID = String.valueOf(SU.getSignupId());//会员ID
			String strpj = "SignUp_id=" + usID;//还有状态  0 1 2
			if(inttt == 3){
				strpj = "SignUp_id=" + usID+" && stateSHSB = 2";//2成    还有状态  0失    1未    2成
				
			}else if(inttt == 2){
				strpj = "SignUp_id=" + usID+" && stateSHSB = 0";//0失
				
			}else{//默认a 未读
			   strpj = "SignUp_id=" + usID+" && stateSHSB = 1";// 1未
				
			}

			// 需要加会员ID进行判断
			List<Enrollmenttable> list = enrollmentService.findPage(strpj, startIndex,pageSize);
			int totalRows = enrollmentService.getTotalRow(strpj);

//			//高亮
//			String gao=(String) req.getAttribute("IDIDAgao");
			
			
			bsgrid.setCurPage(curPage);
			bsgrid.setTotalRows(totalRows);
			bsgrid.setSuccess(true);
			bsgrid.setData(list);
		} else {

			bsgrid.setSuccess(false);
		}
		return JSONSerializer.toJSON(bsgrid).toString();//需要引用架包文件lib里
		

	}

    
 // 读取图片
 	@RequestMapping("/getUserPicture")
 	public void getUserPicture(HttpServletRequest request,
 			HttpServletResponse response) throws ServletException, IOException {
 		String strFileName = request.getParameter("file");// 获取请求file
 		// 构建上传目录的路径
 		String uploadPath = "E:\\upload\\Investment";
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
	
 	
    //兑换详细信息
    @ResponseBody
    @RequestMapping(value="/xinxi",produces="application/json;charset=UTF-8")
	public String xinxi(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String strID = req.getParameter("Id");// 获取用户管理ID
		if (Tools.isNum(strID)) {// 判断是否为数字
			int Id = Integer.parseInt(strID);// 强制转换 string--》int

			Enrollmenttable xinxiType = enrollmentService.findByIdQDParamint(Id);

			req.setAttribute("xinxiType", xinxiType);

			
			return JSONSerializer.toJSON(xinxiType).toString();//需要引用架包文件lib里
		}
		return JSONSerializer.toJSON(null).toString();//需要引用架包文件lib里
	}
 	
	
	

}
