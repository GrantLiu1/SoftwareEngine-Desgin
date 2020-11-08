package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.entity.Evaluations;
import com.shop.mapper.EvaluationMapper;

public class EvaluationDao {
	//根据商品id查询评价数量
	public Integer findCountByGId(Integer gId) {
		String sql = "select count(*) from evaluation where gId = ?";
		Integer count = BaseDao.excuteQueryCount(sql, gId);
		return count;
	}

	public List<Evaluations> findEvaluationListByGIdToLimit(Integer index, Integer rows, Integer gId) {
		String sql = "select * from evaluation where gId = ? limit ?,?";
		List<Evaluations> list = BaseDao.excuteQuery(sql, new EvaluationMapper(), gId,index,rows);
		return list;
	}
	//查找所有评价
	public List selectAllEvaluations() throws SQLException{
		String sql = "select * from evaluation group by eId";
		List<Evaluations> list = BaseDao.excuteQuery(sql, new EvaluationMapper());
		return list;
	}
	//根据买家id查询评价
	public List selectEvaluationsByuserID(int userId) throws SQLException{
		String sql = "select * from evaluation where userId = ?";
		List<Evaluations> list = BaseDao.excuteQuery(sql, new EvaluationMapper(),userId);
		return list;
	}
	//根据评价号修改评价
	public void updateEvaluation(Evaluations eva)throws SQLException{
		String sql="update evaluation set eContent = ?,eTime = ? WHERE eId = ?";
		BaseDao.excuteUpdate(sql,eva.geteContent(),eva.geteTime(),eva.geteID());
	}
	//新增评价
	public void addEvaluation(Evaluations eva)throws SQLException {
		String sql = "insert into evaluation(gId,eContent,eTime,userId) values(?,?,?,?)";
		BaseDao.excuteUpdate(sql,eva.getgID(),eva.geteContent(),eva.geteTime(),eva.getUserID());
	}
}
