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

import com.zgx.po.Newstable;
import com.zgx.po.Signuptable;
import com.zgx.service.InewsService;
import com.zgx.util.Tools;
import com.zgx.vo.JsonReturn;

/**
 * 
 * 用户中心--消息
 * 
 * @author 星月
 *
 */
@Controller
@RequestMapping("/personaINewsweb")
public class PersonaINewsController {
	
   @Autowired
   private InewsService  newsService;// 消息
	
	//ISignupService signupService = new SignupServiceImpl();//登录

	//跳转我的信息界面
	
	@RequestMapping("/news")
	public  String  news(HttpServletRequest request,HttpServletResponse Response) 
			throws ServletException, IOException{
		HttpSession session = request.getSession();
		Signuptable SU = (Signuptable) session.getAttribute("SESSION_USER");// 获取登录数据
		
		if(SU != null){
			
			String usID=String.valueOf(SU.getSignupId());
			//request.setAttribute("usID", usID);//signUpId
			session.setAttribute("usID", usID);
			 try{
				 request.setAttribute("SignUpIdCS", SU.getSignupId());
				 request.setAttribute("SignUpNameCS", SU.getSignupname());
				 request.setAttribute("HeadportraitCS", SU.getHeadportrait());
			 	 
			    }catch (Exception e) {
					
				}
			 //需要加jsp的
			 
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
			 if(DSAgao == 0 ){//intpj
					PJweb=" SignUp_id="+SU.getSignupId()+ " and Status=0";// 未读状态  
				}else if(DSAgao == 1){
					PJweb= " SignUp_id="+SU.getSignupId()+ " and Status=1";
				}else{
					PJweb=" SignUp_id="+SU.getSignupId();//全部
				}
			 
		     List<Newstable> listweb = newsService.findPagepramo(PJweb);//.findPage(PJ, 0,10);
			 
		     request.setAttribute("listweb", listweb);
		     
		     //页数
		     int DSA=1;
				try{
					String strye=request.getParameter("page_current");//第几页 路径传来的参数
					DSA=Integer.parseInt(strye);
				}catch (Exception e) {
					DSA=1;
				}
				
                session.setAttribute("IDIDA",DSA);//第几页
				
				session.setAttribute("IDIDAgao",DSAgao);//高亮
				
			//跳转到信息
			return "/PersonalNews";
			
		}else{
			return "redirect:/mainsy/MainIndex.do";//重定向首页
		}
		
		
	} 
	
	//修改状态为已读
	@ResponseBody
	@RequestMapping("/ztgb")
	public  Object  ztgb(HttpServletRequest request,HttpServletResponse response) 
			throws ServletException, IOException{
		JsonReturn jr =new  JsonReturn();
		String  id=request.getParameter("id");
		Newstable newst=new Newstable();
		newst.setNewsid(Integer.parseInt(id));
		
		boolean signtable1=newsService.update(newst);//修改状态为已读
		   
		    if(signtable1){
		    	jr.setState(true);
		    }else{
				jr.setState(false);
		    }
		    return JSONSerializer.toJSON(jr);//需要引用架包文件lib里
	} 
	
	// 删除信息表某一条数据
	@ResponseBody
	@RequestMapping("/delete")
	public Object delete(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException {
			JsonReturn jsonReturn = new JsonReturn();
			jsonReturn.setState(false);

			String strUserId = request.getParameter("ID");
			if (Tools.isNum(strUserId)) {
				int userId = Integer.parseInt(strUserId);

					boolean bolS = newsService.deleteByIdParam(userId);// 删除信息表某一条数据
					
					if (bolS) {
						jsonReturn.setState(true);
						jsonReturn.setMsg("删除成功");
					} else {
						jsonReturn.setMsg("删除失败");
					}

			} else {
				jsonReturn.setMsg("参数错误");
			}
			return JSONSerializer.toJSON(jsonReturn);//需要引用架包文件lib里
		
		}
	
	
	

}
