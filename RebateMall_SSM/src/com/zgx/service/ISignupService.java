package com.zgx.service;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.service.BaseService;
import com.zgx.po.Signuptable;

public interface ISignupService extends BaseService<Signuptable, Integer>{
	
	public Signuptable login(String signUpName,String password);
	
	   public boolean updatetow(int  whereint);//金额+2 红包
		
		
		public boolean updaterewu(int  intwhere,int  intwhereA);//金额任务
		
		
		public boolean updatePramone(Signuptable  tables);
		
		public boolean updatePramtwo(Signuptable  tables);
		
		public boolean updatePramthree(Signuptable  tables);
	
		public boolean updatetable(Signuptable  tables);
		
		public boolean updateBCH(int  whereint);
		
		public boolean updatePramoneQT(Signuptable  tables);
		
		public boolean updatePramoneSFZ(Signuptable  tables);
		
		public boolean updatePramoneYHK(Signuptable  tables);
		
		public boolean updatePramoneDZYX(Signuptable  tables);
	
		public Signuptable findBySQL();
		
		public Signuptable findByIdparmint(int  whereint);
}
