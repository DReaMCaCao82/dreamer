package com.moegga.app.service.impl;

import java.util.Map;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.moegga.app.service.MemberDTO;
import com.moegga.app.service.TownDTO;

@Repository
public class TownDAO {

	@Resource(name="template")
	private SqlSessionTemplate townTemplate;

	public int insertAddr(Map map) {

		return townTemplate.insert("insertAddr",map);
		
	}

	public TownDTO selectTownById(Map map) {
		
		return townTemplate.selectOne("selectTownById",map);
	}

	public int updateAddr(Map map) {
		// TODO Auto-generated method stub
		return townTemplate.update("updateAddr",map);
	}

	

}
