package com.yuqincar.dao.car;

import com.yuqincar.dao.common.BaseDao;
import com.yuqincar.domain.car.Car;
import com.yuqincar.domain.car.CarCareAppointment;

public interface CarCareAppointmentDao extends BaseDao<CarCareAppointment>{
	
	public boolean isExistAppointment(long selfId,Car car);
}
