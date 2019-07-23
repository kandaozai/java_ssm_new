package com.zgx.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zgx.common.service.BaseService;
import com.zgx.po.RenWutable;

/**
 * 继承接口
 * 
 * @author 星月
 *
 */

public interface IRenWuService extends BaseService<RenWutable,Integer>{
	
    //public RenWutable findByIdtow(int id,int idd);
    public RenWutable findByIdtow(int idone,int idtwo);
	
	public List<RenWutable> findPagelw(String  strwhere);//分页
	
	public List<RenWutable> findPagenull();
	
	public boolean updateLQ(int intwhere);//修改  领取状态
	
	public boolean updateWX();//修改  无效状态
	
	public boolean updateYSH(int intwhere,int intwhereA);//修改 已审核 状态
	
	public boolean insertGRRW_WSH(int intwhere,int intwhereA);//新增 个人任务_未审核
	
	public boolean insertGRRW_SH(int intwhere,int intwhereA);//新增 个人任务_审核
	
    public List<RenWutable> findPagepramo(String  strwhere);
	
	public RenWutable shenhetable(int idone);
	
	public boolean insertSH(RenWutable tablea);//新增 审核表
	
	public boolean updateTP(RenWutable tablea);//修改 审核表图片

}
