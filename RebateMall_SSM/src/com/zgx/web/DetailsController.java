package com.zgx.web;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.zgx.service.IEnrollmentService;
import com.zgx.service.IDeadlineService;
import com.zgx.service.IPlatformBackground;
import com.zgx.service.IProgramService;
import com.zgx.po.Deadlinetable;
import com.zgx.po.Enrollmenttable;
import com.zgx.po.Platformbackgroundtable;
import com.zgx.po.Programtable;
import com.zgx.util.Tools;
import com.zgx.vo.JsonReturn;
import com.zgx.po.Conpanytable;
import com.zgx.po.Signuptable;
import com.zgx.service.ICompanyService;
import com.zgx.service.ISignupService;


/**
 * 投资详情
 * @author LXT
 *
 */
@Controller
@RequestMapping("/detailsweb")
public class DetailsController {

	@Autowired
	private ICompanyService companyService;//公司信息
	
	
	@Autowired
	private IEnrollmentService enrollmentService;//投资登记表

	//下拉框 最好全部下拉框写 在一个（数据库）表中
	@Autowired
	private IPlatformBackground platformbackgroundService;//投资背景

	@Autowired
	private IDeadlineService deadlineService;//投资期限  

	@Autowired
	private IProgramService programService;//方案


	@RequestMapping("/Details")
	public String Details(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		HttpSession session=req.getSession();
		Signuptable signuptable=(Signuptable)session.getAttribute("SESSION_USER");//获取用户登录表
		req.setAttribute("signuptable", signuptable);//写入请求//List<Conpanytable> conpanytable1= null;

		try{
			req.setAttribute("SignUpIdCS", signuptable.getSignupId());
			req.setAttribute("SignUpNameCS", signuptable.getSignupname());
		}catch (Exception e) {

		}
		

		//投资申报数据绑定
		String deta=req.getParameter("Deta");
		Conpanytable linshi=new Conpanytable();
		linshi.setCompanyid(Integer.parseInt(deta));
		Conpanytable conpanytable=companyService.findById(linshi.getCompanyid());
		req.setAttribute("conpanytable",conpanytable);
		//跳转到投资申报显示信息界面
		return "/Details";
	}


	//注册投资页面
	@RequestMapping("/Investment")
	public String Investment(HttpServletRequest req, HttpServletResponse resp)
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

		//投资申报数据绑定
		String deta=req.getParameter("Deta");
		Conpanytable linshi=new Conpanytable();
		linshi.setCompanyid(Integer.parseInt(deta));
		Conpanytable conpanytable=companyService.findById(linshi.getCompanyid());
		req.setAttribute("conpanytable",conpanytable);

		//下拉框
		List<Platformbackgroundtable> platformbackgroundtables=platformbackgroundService.findAll();//投资背景
		List<Deadlinetable> deadlinetable=deadlineService.findAll();//投资期限
		List<Programtable> programtable=programService.findAll();//方案
		req.setAttribute("platformbackgroundtables", platformbackgroundtables);
		req.setAttribute("deadlinetable", deadlinetable);
		req.setAttribute("programtable", programtable);

		//跳转投资申报页面
		return "/Investment";

	}

    //投资申报保存
	@ResponseBody
	@RequestMapping(value="/doInsert",produces="application/json")
	public Object doInsert(@RequestParam(value="fileGG",required=false)MultipartFile myFile ,
			Enrollmenttable jsEnrollmenttable ,HttpServletRequest req, HttpServletResponse resp)throws ServletException, IOException {
		JsonReturn jsonReturn=new JsonReturn();
		jsonReturn.setState(false);
		//构建上传目录的路径
		String uploadPath = "E:\\upload\\Investment";
		//如果目录不存在就创建
		File uploadDir=new File(uploadPath);
		if (!uploadDir.exists()) {
			uploadDir.mkdir();
		}
		
		HttpSession session=req.getSession();
		Signuptable signuptable=(Signuptable)session.getAttribute("SESSION_USER");//获取用户登录表

		//图片
		String strFileName="";
		String FileName="";
		Enrollmenttable enrollmenttable=new Enrollmenttable();

		enrollmenttable.setEnrname(jsEnrollmenttable.getEnrname());
		enrollmenttable.setPhonenumber(jsEnrollmenttable.getPhonenumber());
		enrollmenttable.setEnrusers(jsEnrollmenttable.getEnrusers());
		enrollmenttable.setInvestjer(jsEnrollmenttable.getInvestjer());

		enrollmenttable.setPlatformbackgroundid(jsEnrollmenttable.getPlatformbackgroundid());
		enrollmenttable.setDeadlineid(jsEnrollmenttable.getDeadlineid());
		enrollmenttable.setProgramid(jsEnrollmenttable.getProgramid());
		enrollmenttable.setNote(jsEnrollmenttable.getNote());
		enrollmenttable.setInvestdate(new Date());	//jsp有时间输入这也有？？  investdateBSA		

		enrollmenttable.setSignupId(signuptable.getSignupId());
		enrollmenttable.setInvestplatform(jsEnrollmenttable.getInvestplatform());
		
		enrollmenttable.setCompanyid(jsEnrollmenttable.getCompanyid());
		//文件
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
				String upDir="E:/upload/Investment";
				//获取文件原名
				String fullName=myFile.getOriginalFilename();
				//获取文件扩展名称
				String ext=fullName.substring(fullName.lastIndexOf('.'));
				//拼接文件保存名称
				FileName=System.nanoTime()+ext;

				//保存文件（图片）
				FileUtils.writeByteArrayToFile(new File(upDir,FileName), myFile.getBytes());

				System.out.println("保存文件名称为："+FileName);
				enrollmenttable.setCertificate(FileName);
			}

		}catch (Exception e) {
			enrollmenttable.setCertificate(null);//图片
		}

		//调用Service保存数据
		boolean bolS=enrollmentService.insert(enrollmenttable);
		if (bolS) {
			jsonReturn.setState(true);
			jsonReturn.setMsg("投资成功");
		} else {
			jsonReturn.setMsg("投资失败");
		}


		return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里

	}



}
