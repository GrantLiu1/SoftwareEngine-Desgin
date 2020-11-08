package com.shop.dao;

import java.sql.SQLException;
import java.util.List;

import com.shop.entity.Goods;
import com.shop.mapper.GoodsMapper;

public class GoodsDao {
	//根据类型查找商品
	public Integer findGoodsCountByKindName(String kindName) {
		String sql="select count(*) from goods where gCheck = 1 && gkind = ?";
		Integer count = BaseDao.excuteQueryCount(sql, kindName);
		return count;
	}
	//根据kindName分页查询商品
	public List<Goods> findGoodsListByKindNameToLimit(String kindName,Integer index,Integer rows){
		String sql="select * from goods where gCheck = 1 && gkind = ? limit ?,?";
		List<Goods> list = BaseDao.excuteQuery(sql,new GoodsMapper(),kindName,index,rows);
		return list;
	}
	//根据ID查询一个商品
	public Goods findGoodById(String gId) {
		String sql = "select * from goods where gId=?";
		List<Goods> list = BaseDao.excuteQuery(sql, new GoodsMapper(), gId);
		return list.get(0);
	}
	//根据ID查询一个商品
	public Goods findGoodById(int gId) {
		String sql = "select * from goods where gId=?";
		List<Goods> list = BaseDao.excuteQuery(sql, new GoodsMapper(), gId);
		return list.get(0);
	}
	//根据userId查询一个商品集合
	public List<Goods> findGoodsListByUserId(Integer userId) {
		String sql = "select * from goods where userId = ?";
		List<Goods> list = BaseDao.excuteQuery(sql, new GoodsMapper(), userId);
		return list;
	}
	//根据关键字模糊,分页查询商品表，获取一个商品集合
	public List<Goods> findGoodsListByKeyWord(String keyWord,Integer index,Integer rows) {
		String sql="select * from goods where gCheck = 1 && gName like \"%\"?\"%\" limit ?,?";
		List<Goods> list = BaseDao.excuteQuery(sql, new GoodsMapper(), keyWord,index,rows);
		return list;
	}
	//根据关键字模糊查询商品总条数
	public Integer findGoodsCountBykeyWord(String keyWord) {
		String sql="select count(*) from goods where gCheck = 1 && gName like \"%\"?\"%\"";
		Integer count = BaseDao.excuteQueryCount(sql, keyWord);
		return count;
	}
	//查询所有商品
	public List selectAllGoods() throws SQLException{
		String sql="select * from Goods group by gId";
		List<Goods> list=BaseDao.excuteQuery(sql,new GoodsMapper());
		return list;
	}
	//查询待发布商品
	public List selectPublishGoods() throws SQLException{
		String sql="select * from Goods where gCheck = 0 group by gId";
		List<Goods> list=BaseDao.excuteQuery(sql,new GoodsMapper());
		return list;
	}
	public void addGoods(Goods goods) throws SQLException {
		String sql = "insert into goods(userId,gName,gKind,gPrice,gAmount,gChar,gPic,gDes) values(?,?,?,?,?,?,?,?)";
		BaseDao.excuteUpdate(sql,goods.getUserID(), goods.getgName(),goods.getgKind(),goods.getgPrice(),goods.getgAmount(),goods.getgChar(),goods.getgPic(),goods.getgDes());
	}
	// 查找卖家商品
	public List selectSellerGoods(int userId) throws SQLException{
		String sql="select * from Goods where userId = ?";
		List<Goods> list=BaseDao.excuteQuery(sql,new GoodsMapper(),userId);
		return list;
	}
	// 修改商品
	public void updateGoods(String gName,String gDes,String gPic,String gKind,int gAmount,double gPrice,double gChar,int gId) throws SQLException{
		String sql ="UPDATE Goods SET gName = ?,gDes = ?,gPic = ?,gKind = ?,gAmount = ?,gPrice = ?,gChar = ? where gId = ?";
		BaseDao.excuteUpdate(sql,gName,gDes,gPic,gKind,gAmount,gPrice,gChar,gId);
	}
	//查找某个商品的信息
	public List selectOneGoods(int gId) throws SQLException{
		String sql="select * from Goods where gId = ?";
		List<Goods> list=BaseDao.excuteQuery(sql,new GoodsMapper(),gId);
		return list;
	}
	//删除某个商品
	public void deleteGoods(int gId) throws SQLException{
		String sql = "delete from Goods where gId = ?";
		BaseDao.excuteUpdate(sql,gId);
	}
	//查看商品评价
	public List selectEvas(int gId) throws SQLException{
		String sql = "select * from Goods where gId = ?";
		List<Goods> list = BaseDao.excuteQuery(sql, new GoodsMapper(),gId);
		return list;
	}
	//更新商品数量
	public void updateGoodsAmonut(Integer gAmount,Integer gId) {
		String sql = "update goods set gAmount = gAmount - ? where gId = ?";
		BaseDao.excuteUpdate(sql, gAmount,gId);
	}
}
