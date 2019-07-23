package com.zgx.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics2D;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet(name="valCode",urlPatterns={"/valcode.action"})
public class ValCode extends HttpServlet {
	String[] codeSeq = {"八仙过海","栩栩如生","狐假虎威","慷慨激昂 ","草船借箭","三阳开泰","美轮美奂","过河拆桥","情非得已","一马平川","载歌载舞"};
	/**
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			doPost(request,response);
	}

	/**
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
			int width=161,height=48;
			//缓存中的
			BufferedImage img = new BufferedImage(161, 48, BufferedImage.TYPE_INT_RGB);
			Graphics2D grap = img.createGraphics();
			//设置背景色为白色
			grap.setBackground(getRandomColor(200,250));
			//清空矩形区域，用背景色填充
			grap.clearRect(0, 0, width, height);
			//产生随机数的对象
			Random random = new Random();
			for(int i=0;i<150;i++){
				int x1 = random.nextInt(width);
				int y1 =random.nextInt(height);
				int x2 = x1 + random.nextInt(width/8);
				int y2 = y1 + random.nextInt(height/8);
				grap.setColor(getRandomColor(160,200));
				grap.drawLine(x1, y1, x2, y2);
			}
			//通过codeSeq，点击图片刷新成语验证码
			String content = codeSeq[random.nextInt(codeSeq.length)];
			//将生成的验证码存放到session中
			request.getSession().setAttribute("code", content);

			Font font = new Font("楷体",Font.BOLD,30);
			grap.setFont(font);
			char[] strArray = content.toCharArray();
			for(int i = 0; i < strArray.length; i++){
				//设置画笔为黑色
				//刷新随机切换文字颜色，通过getRandomColor方法
				grap.setColor(getRandomColor(20,130));
				grap.drawString(strArray[i]+"", (i+1)*25+10, 33);
			}
			//图片的io操作类，input output     3:24 993534731
			ImageIO.write(img, "PNG", response.getOutputStream());
	}
	public Color getRandomColor(int start,int end){
		//RGB 红绿蓝 0-255 0-255 0-255
		Random random = new Random();
		int red = start+random.nextInt(end-start);
		int blue = start+random.nextInt(end-start);
		int green = start+random.nextInt(end-start);
		 return new Color(red,blue,green);
	}

}
