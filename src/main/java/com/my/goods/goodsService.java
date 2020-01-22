package com.my.goods;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.my.goods.goodsModel;
import com.my.goods.likesModel;
import com.my.goods.goodsComModel;


@Service
public class goodsService implements goodsDao{
	
	@Resource(name="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate;
	
	@Override
	public List<goodsModel> goodsList(){
		return sqlSessionTemplate.selectList("goods.goodsList");
	}
	
	@Override
	public goodsModel goodsView(int goods_no){
		return sqlSessionTemplate.selectOne("goods.selectOne-goods",goods_no);
	}
	
	@Override
	public Object amountDown(goodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("goods.amountDown", goodsModel);
	}
	
	@Override
	public List<goodsModel> goodsCategoryList(String cate_no) {
		return sqlSessionTemplate.selectList("goods.goodsCate",cate_no);
	}
	
	@Override
	public likesModel insertLikes(likesModel likesModel) {
		return sqlSessionTemplate.selectOne("goods.insert-likes", likesModel);
	}
	
	@Override
	public likesModel likesCheck(likesModel likesModel) {
		return sqlSessionTemplate.selectOne("goods.likesCheck", likesModel);
	}
	
	@Override
	public int likesCount(likesModel likesModel) {
		return sqlSessionTemplate.selectOne("goods.likesCount", likesModel);
	}
	
	@Override
	public List<goodsComModel> goodsComList(int goods_no) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.selectList("goods.goodsComList",goods_no);
	}
	
	@Override
	public Object goodsComWrite(goodsComModel goodsComModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("goods.goodsComWrite",goodsComModel); 
	}
	
	@Override
	public Object goodsComDelete(goodsComModel goodsComModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("goods.goodsComDelete",goodsComModel); 
	}
	
	@Override
	public List<goodsModel> likeList(String id){
		return sqlSessionTemplate.selectList("goods.likeList", id);
	}
	
	@Override
	public List<goodsComModel> mycomList(String id){
		return sqlSessionTemplate.selectList("goods.mycomList", id);
	}
	@Override
	public List<goodsComModel> searchC(String keyword){
		return sqlSessionTemplate.selectList("goods.searchC", "%" + keyword + "%");
	}
	
	
	//2.8 main 때문에 추가함
	public List<goodsModel> goodsBest(){
		return sqlSessionTemplate.selectList("goods.goodsBest");
	}
	
	@Override
	public Object adGoodsInsert(goodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("goods.adGoodsInsert", goodsModel);
	}

	public Object adGoodsDelete(goodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.insert("goods.adGoodsDelete", goodsModel);
	}

	public Object adGoodsModify(goodsModel goodsModel) {
		// TODO Auto-generated method stub
		return sqlSessionTemplate.update("goods.adGoodsModify", goodsModel);
	}
	
	
}
