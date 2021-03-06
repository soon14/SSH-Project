package com.yuqincar.dao.order.impl;

import org.springframework.stereotype.Repository;

import com.yuqincar.dao.common.impl.BaseDaoImpl;
import com.yuqincar.dao.order.PriceTableDao;
import com.yuqincar.domain.order.Order;
import com.yuqincar.domain.order.PriceTable;

@Repository
public class PriceTableDaoImpl extends BaseDaoImpl<PriceTable> implements PriceTableDao {

	public PriceTable getDefaultPriceTable(){
		return (PriceTable) (getSession().createQuery("from PriceTable where title=?")
				.setParameter(0, "价格表").uniqueResult());
	}
	
	public PriceTable getPriceTableByTitle(String title){
		return (PriceTable) (getSession().createQuery("from PriceTable where title=?")
				.setParameter(0, title).uniqueResult());
	}
}
