package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface TownService {

	public int insertAddr(Map map);

	public TownDTO selectTownById(Map map);

	public int updateAddr(Map map);

}
