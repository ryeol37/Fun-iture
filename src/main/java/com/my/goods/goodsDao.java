package com.my.goods;

import java.util.List;

import com.my.goods.goodsModel;
import com.my.goods.likesModel;
import com.my.goods.goodsComModel;

public interface goodsDao {
	public List<goodsModel> goodsList();
	
	public List<goodsModel> goodsCategoryList(String cate_no);

	public goodsModel goodsView(int goods_no);

	public Object amountDown(goodsModel goodsModel);
	
		//영화 평점 업데이트
		public likesModel insertLikes(likesModel likesModel);
		
		//평점입력 중복체크 정보 꺼내오기
		public likesModel likesCheck(likesModel likesModel);
		
		//좋아요
		public int likesCount(likesModel likesModel);
		
		//goods comment List
		List<goodsComModel> goodsComList(int goods_no);
		
		//goods 코멘트 작성
		public Object goodsComWrite(goodsComModel goodsComModel);

		//goods 코멘트 삭제
		public Object goodsComDelete(goodsComModel goodsComModel);
		
		public List<goodsModel> likeList(String id);
		
		public List<goodsComModel> mycomList(String id);
		
		public List<goodsComModel> searchC(String keyword);
		
		//Admin Goods Insert
		public Object adGoodsInsert(goodsModel goodsModel);
		
		//Admin Goods Delete
		public Object adGoodsDelete(goodsModel goodsModel);
		
		//Admin Goods Modify
		public Object adGoodsModify(goodsModel goodsModel);


	
}
