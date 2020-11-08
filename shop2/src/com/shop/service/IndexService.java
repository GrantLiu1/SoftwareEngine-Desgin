package com.shop.service;

import java.sql.SQLException;
import java.util.List;

import com.shop.dao.BaseDao;
import com.shop.dao.IndexDao;
import com.shop.entity.Indexs;
import com.shop.service.IndexService;

public class IndexService{

	public List<Indexs> findIndexList(String kindName){
		IndexDao dao = new IndexDao();
		List<Indexs> list = dao.findGoodsList(kindName);
		return list;
	}
	//上传广告
	public void addIndex(Indexs index) throws SQLException{
		String sql = "insert into Indexs (iName,iSName,iPic,iUrl,iKind) values (?,?,?,?,?)";
		BaseDao.excuteUpdate(sql,index.getiName(),index.getiSName(),index.getiPic(),index.getiUrl(),index.getiKind());
	}
}
