package com.my.basket;

import java.util.List;

public interface BasketDao {

	public Object insertBasket(BasketModel basketModel);
	
	public List<BasketModel> BasketList(BasketModel basketModel);
	
	public List<BasketModel> BasketOrderList(BasketModel basketModel);
	
	public Object deleteBasket(BasketModel basketModel);
	
	public Object deleteAllBasket(BasketModel basketModel);
	
	
	
}
