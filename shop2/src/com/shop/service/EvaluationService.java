package com.shop.service;

import java.sql.SQLException;
import java.util.List;

import com.shop.dao.BaseDao;
import com.shop.dao.EvaluationDao;
import com.shop.dao.UserDao;
import com.shop.entity.Evaluations;
import com.shop.entity.User;
import com.shop.entity.pageBean;

public class EvaluationService {
	EvaluationDao evaluationDao = new EvaluationDao();
	UserDao userDao = new UserDao();

	// 根据商品id查询一个评论集合
	public pageBean findEvalutionByGId(Integer currentPage, Integer rows, Integer gId) {
		// 查询记录总条数
		Integer total = evaluationDao.findCountByGId(gId);
		// 计算总页数
		Integer totalPage = 0;
		if (total % rows > 0) {
			totalPage = total / rows + 1;
		} else {
			totalPage = total / rows;
		}
		// 计算每页显示的第一条的下标
		Integer index = (currentPage - 1) * rows;
		//查询每页显示的内容
		List<Evaluations> list = evaluationDao.findEvaluationListByGIdToLimit(index,rows,gId);
		for (Evaluations evaluations : list) {
			User user = userDao.findUserById(evaluations.getUserID());
			evaluations.setUser(user);
		}
		
		pageBean pageBean = new pageBean();
		pageBean.setCurrentPage(currentPage);
		pageBean.setTotal(total);
		pageBean.setRows(rows);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		
		return pageBean;
	}
	//买家更新评价内容
	public void updateEvaluation(Evaluations eva)throws SQLException{
		evaluationDao.updateEvaluation(eva);
	}
	
	//新增评价
	public void addEvaluation(Evaluations eva)throws SQLException {
		evaluationDao.addEvaluation(eva);
	}
}
