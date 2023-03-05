package com.moegga.app.service;

import java.util.List;
import java.util.Map;

public interface DonationService {

	public List<DonationDTO> selectDonationList(Map map);


	public DonationDTO selectDonationOne(Map map);

	public int insertDonation(Map map);

	public int updateDonation(Map map);


}
