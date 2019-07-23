package com.zgx.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zgx.po.RenWutable;
import com.zgx.common.dao.BaseDao;

public interface IRenWuDao extends BaseDao<RenWutable,Integer>{

	//public RenWutable findByIdtow(int id,int idd);
	public RenWutable findByIdtow(@Param("idone")int idone,@Param("idtwo")int idtwo);
	
	public List<RenWutable> findPagelw(@Param("strwhere")String  strwhere);//分页
	
	public List<RenWutable> findPagenull();
	
	public boolean updateLQ(@Param("intwhere")int intwhere);//修改  领取状态
	
	public boolean updateWX();//修改  无效状态
	
	public boolean updateYSH(@Param("intwhere")int intwhere,@Param("intwhereA")int intwhereA);//修改 已审核 状态

	public boolean insertGRRW_WSH(@Param("intwhere")int intwhere,@Param("intwhereA")int intwhereA);//新增 个人任务_未审核
	
	public boolean insertGRRW_SH(@Param("intwhere")int intwhere,@Param("intwhereA")int intwhereA);//新增 个人任务_审核
	
	public List<RenWutable> findPagepramo(@Param("strwhere")String  strwhere);
	
	public RenWutable shenhetable(@Param("idone")int idone);
	
	public boolean insertSH(RenWutable tablea);//新增 审核表
	
	public boolean updateTP(RenWutable tablea);//修改 审核表图片
	
	
}
