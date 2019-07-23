package com.zgx.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import net.sf.json.JSONObject;
import net.sf.json.JSONSerializer;

import com.zgx.po.Signuptable;
import com.zgx.po.Stotetable;
import com.zgx.service.ICompanyService;
import com.zgx.service.IRenWuService;
import com.zgx.service.ISignupService;
import com.zgx.service.IStoreService;
import com.zgx.util.Tools;
import com.zgx.vo.Bsgrid;

/**
 * 
 * 中心--我的积分
 * 
 * @author 星月
 * 
 */
@Controller
@RequestMapping("/personaIWdjfweb")
public class PersonaIWdjfController {
	
	@Autowired
    private IStoreService wdjfService;//兑换记录wdjfServiceImpl
	
	@Autowired
    private IStoreService  wdhfJlService;//积分记录WdhfJlServiceImpl

	
    @RequestMapping("/wdjf")
	public String wdjf(HttpServletRequest request, HttpServletResponse Response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
		
      if(SU != null){
    		String usID = String.valueOf(SU.getSignupId());
    		session.setAttribute("usID", usID);
    		try{
    		  Stotetable wdjfjlb = wdhfJlService.findById(SU.getSignid());
    		  request.setAttribute("wdjfjlb", wdjfjlb);
    		  request.setAttribute("SignUpIdCS", SU.getSignupId());
    		  request.setAttribute("SignUpNameCS", SU.getSignupname());
    		  request.setAttribute("HeadportraitCS", SU.getHeadportrait());
    		}catch (Exception e) {
    			
    		}
    		
			return "/PersonalWdJf";
		}else{
			return "redirect:/mainsy/MainIndex.do";//重定向首页
			
		}
		
	}

	// 商品兑换记录
    @ResponseBody
    @RequestMapping(value="/getListtow",produces="application/json;charset=UTF-8")
	public String getListtow(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String strpageSize = req.getParameter("pageSize");
		String strcurPage = req.getParameter("curPage");

		Bsgrid<Stotetable> bsgrid = new Bsgrid<Stotetable>();
		if (Tools.isNum(strcurPage) && Tools.isNum(strpageSize)) {
			int pageSize = Integer.parseInt(strpageSize);
			int curPage = Integer.parseInt(strcurPage);

			int startIndex = (curPage - 1) * pageSize;

			HttpSession session = req.getSession();
			Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
			String usID = String.valueOf(SU.getSignupId());//会员ID

			String strpj = "commodityexchangetable.SignUp_id=" + usID;

			// 需要加会员ID进行判断
			List<Stotetable> list = wdjfService.findPage(strpj, startIndex,
					pageSize);
			int totalRows = wdjfService.getTotalRow(strpj);

			bsgrid.setCurPage(curPage);
			bsgrid.setTotalRows(totalRows);
			bsgrid.setSuccess(true);
			bsgrid.setData(list);
		} else {

			bsgrid.setSuccess(false);
		}
		
		return JSONSerializer.toJSON(bsgrid).toString();//需要引用架包文件lib里
	}

    //兑换详细信息
    @ResponseBody
    @RequestMapping(value="/xinxi",produces="application/json;charset=UTF-8")
	public String xinxi(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String strID = req.getParameter("Id");// 获取用户管理ID
		if (Tools.isNum(strID)) {// 判断是否为数字
			int Id = Integer.parseInt(strID);// 强制转换 string--》int

			Stotetable xinxiType = wdjfService.findByIdQDParamint(Id);

			req.setAttribute("xinxiType", xinxiType);

			
			return JSONSerializer.toJSON(xinxiType).toString();//需要引用架包文件lib里
		}
		return JSONSerializer.toJSON(null).toString();//需要引用架包文件lib里
	}

	// 积分记录
    @ResponseBody
    @RequestMapping(value="/getListone",produces="application/json;charset=UTF-8")
	public String getListone(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		String strpageSize = req.getParameter("pageSize");
		String strcurPage = req.getParameter("curPage");

		Bsgrid<Stotetable> bsgrid = new Bsgrid<Stotetable>();
		if (Tools.isNum(strcurPage) && Tools.isNum(strpageSize)) {
			int pageSize = Integer.parseInt(strpageSize);
			int curPage = Integer.parseInt(strcurPage);

			int startIndex = (curPage - 1) * pageSize;

			HttpSession session = req.getSession();
			Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
			String usID = String.valueOf(SU.getSignupId());//会员ID

			String strpj = "SignUp_id=" + usID;

			// 需要加会员ID进行判断
			List<Stotetable> list = wdhfJlService.findPage(strpj, startIndex,pageSize);
			int totalRows = wdhfJlService.getTotalRow(strpj);

			bsgrid.setCurPage(curPage);
			bsgrid.setTotalRows(totalRows);
			bsgrid.setSuccess(true);
			bsgrid.setData(list);
		} else {

			bsgrid.setSuccess(false);
		}
		return JSONSerializer.toJSON(bsgrid).toString();//需要引用架包文件lib里
		

	}


}
