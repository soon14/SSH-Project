package com.yuqincar.dao.car;

import com.yuqincar.dao.common.BaseDao;
import com.yuqincar.domain.car.CarCare;
import com.yuqincar.domain.car.CarExamine;

public interface CarExamineDao extends BaseDao<CarExamine> {
	public boolean canDeleteCarExamine(CarExamine carExamine);
	public boolean canUpdateCarExamine(CarExamine carExamine);

}
